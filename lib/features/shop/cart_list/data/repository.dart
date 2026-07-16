
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nova_cart/core/common/dialogs/success.dart';

class UpdateCartLRepository {
 static final _instance = FirebaseFirestore.instance;
 static final _uid = FirebaseAuth.instance.currentUser!.uid;

  static Future<void> incrementItemValue({required String uid})async{
    await _instance.collection("Users").doc(_uid).collection("cartCollection").doc(uid).update({
      "itemCount":FieldValue.increment(1)

    });
  }
  static  Future<void> decrementItemValue({required String uid})async{
    await _instance.collection("Users").doc(_uid).collection("cartCollection").doc(uid).update({
      "itemCount":FieldValue.increment(-1)

    });
  }
  
  static  Future<void> removeItem({required String uid,required context })async{
    await _instance.collection("Users").doc(_uid).collection("cartCollection").doc(uid).delete();
  SuccessToast.successSnackBar(content: "successfully deleted", context: context);
    }

  
  
  
}