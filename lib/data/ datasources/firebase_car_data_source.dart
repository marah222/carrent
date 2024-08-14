import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/car.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firebaseFirestore;

  FirebaseCarDataSource({required this.firebaseFirestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firebaseFirestore.collection('cars').get();

    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
