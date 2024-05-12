import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_master_repo/src/abstractions/base_filter.dart';

/// configure firestore fetching policy
const GetOptions getOptions = GetOptions();

/// {@template firebase_helpers}
/// Firebase Firestore helpers mixin, contains main functions to handle
/// firestore database
/// {@endtemplate}
mixin FirebaseHelpers{

  /// access firestore
  FirebaseFirestore get _db => FirebaseFirestore.instance;


  /// gets a document from firestore
  DocumentReference<Map<String, dynamic>> doc(String documentPath) {
    return _db.doc(documentPath);
  }

  /// gets collection documents
  Future<QuerySnapshot<Object?>> docs(String documentPath,
      {
        GetOptions? getOptions,
        IApiFilter? filter,
      }) async {
    Query query = _db.collection(documentPath);


    if (filter != null) {
      if (filter.startAfter != null) {
        query = query.startAfterDocument(filter.startAfter!,);
      }
      query = query.limit(filter.pageLength);
    }


    return query.get(getOptions);
  }

  /// add document to collection
  Future<DocumentSnapshot<Map<String, dynamic>>> addDocument(
      String collectionPath,
      Map<String, dynamic> data,) async {
    final documentReference = await _db.collection(collectionPath).add(data);
    return documentReference.get();
  }
}
