import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection("userType");

class FirebaseCrud {
  static Future updateInfo({
    required String type,
    required String docId,
  }) async {
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "type": type,
    };

    await documentReferencer.update(data);
  }
}
