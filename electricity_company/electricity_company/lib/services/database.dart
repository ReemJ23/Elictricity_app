import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference formCollection =
      FirebaseFirestore.instance.collection('forms');
}
