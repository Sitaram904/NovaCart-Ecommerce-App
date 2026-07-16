import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserDetails {
  FirebaseUserDetails._();

static Future<void> checkUserDetails({String? userName}) async {
    final userId = FirebaseAuth.instance.currentUser;
    final collection = FirebaseFirestore.instance.collection("Users");

    if (userId == null) return;

    final docSnapshot = await collection.doc(userId.uid).get();
    if (!docSnapshot.exists) {
      await collection.doc(userId.uid).set({
        'uid': userId.uid,
        'userName': userName ?? userId.displayName ?? "userName",
        'userImage':
            userId.photoURL ??
            "https://cdn-icons-png.flaticon.com/512/149/149071.png",
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}

class GetFireStoreData {
  static Future<String> getUserImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return "https://cdn-icons-png.flaticon.com/512/149/149071.png";
    }

    final docSnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get();

    final data = docSnapshot.data();

    if (data == null || data["userImage"] == null) {
      return "https://cdn-icons-png.flaticon.com/512/149/149071.png";
    } else {
      return data["userImage"];
    }
  }

  static Future<String> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return "UserName";
    }

    final docSnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get();

    final data = docSnapshot.data();

    if (data == null || data["userName"] == null) {
      return "UserName";
    } else {
      return data["userName"];
    }
  }

  static Future<String> getUserEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    final String email = user.email ?? "user@gmail.com";
    return email;
  }
}
