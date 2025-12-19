import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../models/invoice.dart';
import '../services/firestore_service.dart';

class CreateInvoiceScreen extends StatefulWidget {
  const CreateInvoiceScreen({super.key});

  @override
  CreateInvoiceScreenState createState() => CreateInvoiceScreenState();
}

class CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  final List<InvoiceItem> _items = [];
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  void _addItem() {
    if (_nameController.text.isNotEmpty && _quantityController.text.isNotEmpty) {
      final quantity = int.tryParse(_quantityController.text);
      if (quantity != null && quantity > 0) {
        setState(() {
          _items.add(InvoiceItem(name: _nameController.text, quantity: quantity));
          _nameController.clear();
          _quantityController.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid positive quantity')),
        );
      }
    }
  }

  void _submit() async {
    if (_items.isNotEmpty) {
      final user = context.read<AuthProvider>().user;
      if (user != null && user.address != null && user.address!.isNotEmpty) {
        final invoice = Invoice(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          groceryId: user.id,
          groceryName: user.name,
          phone: user.phone,
          address: user.address!,
          items: _items,
        );
        await FirestoreService().addInvoice(invoice);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please ensure your profile has a valid address')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one item')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Invoice')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Item Name'))),
                const SizedBox(width: 10),
                Expanded(child: TextField(controller: _quantityController, decoration: const InputDecoration(labelText: 'Quantity'), keyboardType: TextInputType.number)),
                IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: _submit, child: const Text('Submit Invoice')),
          ],
        ),
      ),
    );
  }
}