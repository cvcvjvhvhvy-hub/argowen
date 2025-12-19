import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  firebase_auth.FirebaseAuth get auth => _auth;

  Future<void> verifyPhoneNumber(
    String phoneNumber,
    Function(String) codeSent,
    Function(String) verificationCompleted,
    Function(firebase_auth.FirebaseAuthException) verificationFailed,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (firebase_auth.PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        verificationCompleted('Auto verified');
      },
      verificationFailed: verificationFailed,
      codeSent: (String verificationId, int? resendToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<firebase_auth.UserCredential> signInWithSmsCode(String verificationId, String smsCode) async {
    firebase_auth.PhoneAuthCredential credential = firebase_auth.PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<void> registerUser(User user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<User?> getCurrentUser() async {
    firebase_auth.User? firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      DocumentSnapshot doc = await _firestore.collection('users').doc(firebaseUser.uid).get();
      if (doc.exists) {
        return User.fromMap(doc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}