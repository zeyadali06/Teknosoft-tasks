import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn {
  static Future<UserCredential> signIn(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AccountData {
  // Username
  static Future<String?> getUsernameFromFirestore(String uid) async {
    var d = await FirebaseFirestore.instance.collection(usersCollection).doc(uid).get();
    try {
      if (d.data() == null) throw Exception();
      return d.data()!['username'];
    } catch (e) {
      return null;
    }
  }

  // Email
  static Future<String?> getEmailFromFirestore(String uid) async {
    var d = await FirebaseFirestore.instance.collection(usersCollection).doc(uid).get();
    try {
      if (d.data() == null) throw Exception();
      return d.data()!['email'];
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getEmailFromFirebaseAuth(String uid) async {
    User? user = await FirebaseAuth.instance.userChanges().firstWhere((user) => user!.uid == uid);
    return user?.email;
  }

  // Phone
  static Future<String?> getPhoneNumberFromFirestore(String uid) async {
    var d = await FirebaseFirestore.instance.collection(usersCollection).doc(uid).get();
    try {
      if (d.data() == null) throw Exception();
      return d.data()!['phone'];
    } catch (e) {
      return null;
    }
  }

  // UID using username
  static Future<String?> getUIDFromFirestoreUsingUsername(String username) async {
    try {
      QuerySnapshot uidDocument = await FirebaseFirestore.instance.collection(usersCollection).where('username', isEqualTo: username).limit(1).get();
      return uidDocument.docs[0].id;
    } catch (e) {
      return null;
    }
  }

  // UID using email
  static Future<String?> getUIDFromFirestoreUsingEmail(String email) async {
    try {
      QuerySnapshot uidDocument = await FirebaseFirestore.instance.collection(usersCollection).where('email', isEqualTo: email).limit(1).get();
      return uidDocument.docs[0].id;
    } catch (e) {
      return null;
    }
  }

  // Password
  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> updatePassword(String newPassword) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
  }

  // Get All User Data From Firestore
  static Future<Map<String, dynamic>?> getUserDataFromFirestore(String uid) async {
    // return user data without password
    var data = await FirebaseFirestore.instance.collection(usersCollection).doc(uid).get();
    return data.data();
  }
}

class Register {
  static Future<UserCredential> register(Map<String, dynamic> data, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: data['email'], password: password);
    data['uid'] = userCredential.user!.uid;
    await FirebaseFirestore.instance.collection(usersCollection).doc(userCredential.user!.uid).set(data, SetOptions(merge: true));
    return userCredential;
  }
}

class SignOut {
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> deleteAccount(String uid, String email) async {
    await FirebaseFirestore.instance.collection(usersCollection).doc(uid).delete();
    await FirebaseAuth.instance.currentUser!.delete();
  }
}

class Verification {
  static Future<void> sendVerification() async {
    return await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  static bool isVerified() {
    return FirebaseAuth.instance.currentUser!.emailVerified;
  }
}
