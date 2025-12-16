const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const PORT = 5000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.use(session({
  secret: 'order-management-secret-key',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

let users = [
  { id: '1', name: 'بقالة الأمل', phone: '771234567', role: 'grocery', address: 'صنعاء - شارع الزبيري' },
  { id: '2', name: 'تاجر الجملة', phone: '772345678', role: 'merchant', address: 'صنعاء - شارع المطار' },
  { id: '3', name: 'المسؤول', phone: '773456789', role: 'admin', address: 'صنعاء' }
];

let invoices = [];
let bids = [];

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'login.html'));
});

app.post('/api/login', (req, res) => {
  const { phone } = req.body;
  const user = users.find(u => u.phone === phone);
  if (user) {
    req.session.user = user;
    res.json({ success: true, user });
  } else {
    res.json({ success: false, message: 'المستخدم غير مسجل' });
  }
});

app.post('/api/register', (req, res) => {
  const { name, phone, role, address } = req.body;
  const existingUser = users.find(u => u.phone === phone);
  if (existingUser) {
    res.json({ success: false, message: 'رقم الهاتف مسجل مسبقاً' });
    return;
  }
  const newUser = {
    id: Date.now().toString(),
    name,
    phone,
    role,
    address
  };
  users.push(newUser);
  req.session.user = newUser;
  res.json({ success: true, user: newUser });
});

app.get('/api/user', (req, res) => {
  if (req.session.user) {
    res.json({ success: true, user: req.session.user });
  } else {
    res.json({ success: false });
  }
});

app.post('/api/logout', (req, res) => {
  req.session.destroy();
  res.json({ success: true });
});

app.post('/api/invoices', (req, res) => {
  if (!req.session.user) {
    res.status(401).json({ success: false, message: 'غير مصرح' });
    return;
  }
  const { items, address, phone } = req.body;
  const invoice = {
    id: Date.now().toString(),
    groceryId: req.session.user.id,
    groceryName: req.session.user.name,
    phone: phone || req.session.user.phone,
    address: address || req.session.user.address,
    items,
    status: 'pending',
    lowestPrice: null,
    selectedMerchantId: null,
    createdAt: new Date().toISOString()
  };
  invoices.push(invoice);
  res.json({ success: true, invoice });
});

app.get('/api/invoices', (req, res) => {
  if (!req.session.user) {
    res.status(401).json({ success: false });
    return;
  }
  const user = req.session.user;
  let result;
  if (user.role === 'grocery') {
    result = invoices.filter(i => i.groceryId === user.id);
  } else if (user.role === 'merchant') {
    result = invoices.filter(i => i.status === 'pending' || i.status === 'priced');
  } else {
    result = invoices;
  }
  res.json({ success: true, invoices: result });
});

app.post('/api/bids', (req, res) => {
  if (!req.session.user || req.session.user.role !== 'merchant') {
    res.status(401).json({ success: false });
    return;
  }
  const { invoiceId, totalPrice, itemPrices } = req.body;
  const bid = {
    id: Date.now().toString(),
    invoiceId,
    merchantId: req.session.user.id,
    merchantName: req.session.user.name,
    totalPrice,
    itemPrices,
    createdAt: new Date().toISOString()
  };
  bids.push(bid);
  
  const invoice = invoices.find(i => i.id === invoiceId);
  if (invoice) {
    invoice.status = 'priced';
    if (!invoice.lowestPrice || totalPrice < invoice.lowestPrice) {
      invoice.lowestPrice = totalPrice;
    }
  }
  res.json({ success: true, bid });
});

app.get('/api/bids/:invoiceId', (req, res) => {
  const invoiceBids = bids.filter(b => b.invoiceId === req.params.invoiceId);
  res.json({ success: true, bids: invoiceBids });
});

app.post('/api/invoices/:id/approve', (req, res) => {
  const { merchantId } = req.body;
  const invoice = invoices.find(i => i.id === req.params.id);
  if (invoice) {
    invoice.status = 'approved';
    invoice.selectedMerchantId = merchantId;
    res.json({ success: true, invoice });
  } else {
    res.status(404).json({ success: false });
  }
});

app.get('/api/users', (req, res) => {
  if (!req.session.user || req.session.user.role !== 'admin') {
    res.status(401).json({ success: false });
    return;
  }
  res.json({ success: true, users });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on http://0.0.0.0:${PORT}`);
});
