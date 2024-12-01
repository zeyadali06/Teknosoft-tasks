import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  static Future<QuerySnapshot<Map<String, dynamic>>> getCollectionData({required String collectionPath}) async {
    return await FirebaseFirestore.instance.collection(collectionPath).get();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getDocumentData({required String collectionPath, required String docName}) async {
    return await FirebaseFirestore.instance.collection(collectionPath).doc(docName).get();
  }

  static Future<dynamic> getField({required String collectionPath, required String docName, required String key}) async {
    try {
      var data = await FirebaseFirestore.instance.collection(collectionPath).doc(docName).get();
      return data.data()![key];
    } catch (_) {}
  }

  static Future<void> setField({required String collectionPath, required String docName, required Map<String, dynamic> data, bool merge = true}) async {
    await FirebaseFirestore.instance.collection(collectionPath).doc(docName).set(data, SetOptions(merge: merge));
  }

  static Future<void> updateField({required String collectionPath, required String docName, required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance.collection(collectionPath).doc(docName).update(data);
  }

  static Future<void> deleteField({required String collectionPath, required String docName, required String key}) async {
    await FirebaseFirestore.instance.collection(collectionPath).doc(docName).update(<String, dynamic>{
      key: FieldValue.delete(),
    });
  }

  static Future<void> deleteDoc({required String collectionPath, required String docName}) async {
    await FirebaseFirestore.instance.collection(collectionPath).doc(docName).delete();
  }

  static Future<void> batch() async {
    // enable you to make multiple operations on the same time

    WriteBatch ba = FirebaseFirestore.instance.batch();
    // ba.set(document, data);
    // ba.set(document, data);
    // ba.delete(document);

    ba.commit(); // to execute operations
  }

  static Future<void> transaction() async {
    //   FirebaseFirestore.instance.runTransaction((transaction) async {
    //     // Get Data
    //     if (snapshot.exists) {
    //       // Update Data
    //     }
    //   });
  }
}

// FirebaseFirestore.instance.collection(collectionPath).where();
// FirebaseFirestore.instance.collection(collectionPath).orderBy();
// FirebaseFirestore.instance.collection(collectionPath).limit();
// FirebaseFirestore.instance.runTransaction((transaction) async {
//   // Get Data
//   if (snapshot.exists) {
//     // Update Data
//   }
// });
// WriteBatch ba = FirebaseFirestore.instance.batch();

// where("FIELD" , PARAMETER) --> to filter the results according to PARAMETER
// limit(NUMBER) --> to make the number of results equal to NUMBER
// orderBy("FIELD", descending: true).startAt(["PARAMETER"]) --> get results that is <= to PARAMETER
// orderBy("FIELD", descending: false).startAt(["PARAMETER"]) --> get results that is >= to PARAMETER
// orderBy("FIELD", descending: BOOLEAN).startAfter(["PARAMETER"]) --> same thing but without =
// orderBy("FIELD", descending: true).endAt(["PARAMETER"]) --> get results that is >= to PARAMETER
// orderBy("FIELD", descending: false).endAt(["PARAMETER"]) --> get results that is <= to PARAMETER
// orderBy("FIELD", descending: BOOLEAN).endBefore(["PARAMETER"]) --> same thing but without =
// runTransaction((transaction) async {}) --> used when the app conatiains financial services
// batch() --> return an OBJECT that enables you to execute several operations on the firesotre(set, update, delete) in the same time and use OBJECT.commit() to run the operations




//change the minSdkVersion to 19 and add multiDexEnabled in FireStore\android\app\build.gradle

// android {
//     defaultConfig {
//         minSdkVersion 19
//         multiDexEnabled true
//     }
// }

// and change dependencies in FireStore\android\app\build.gradle
// dependencies {
//     implementation 'androidx.multidex:multidex:2.0.1'
// }

// create database in --> https://console.firebase.google.com/u/0/project/fir-core-14c6c/firestore

// next, go to Rules and change if false to if true , then publish

// rules_version = '2';
// service cloud.firestore {
//   match /databases/{database}/documents {
//     match /{document=**} {
//       allow read, write: if true;
//     }
//   }
// }
