// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';

// // class AddProducts {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   Future<void> addProducts() async {
// //     final String uuid = Uuid().v4();
// //     await _firestore.collection("allProducts").doc(uuid).set({
// //       "id": uuid,
// //       "color": ["pink", "black"],
// //       "createdAt": Timestamp.now(),
// //       "productImageUrl": [
// //         'https://www.sony.com/image/4e7583de9395738b7d2b9607e945b058?fmt=jpeg&wid=558&hei=336',
// //       ],
// //       "productName": 'Red Eye',
// //       "productPrice": 233,
// //       "favoriteProduct": true,
// //       "prodDescription": 'This is very smart product',
// //       "stock": 20,
// //       "category": 'Camera',
// //       "rating": 3.3,
// //       "review": 23,
// //     });
// //   }
// // }



// class AddProducts

//  {

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addProducts() async {
//     final String uuid = Uuid().v4();
//     await _firestore.collection("allProducts").doc(uuid).update({"favoriteProduct":true,});
//   }
//  }
