import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DatabaseService({required this.uid});

  // Referencia a la colección de usuarios
  CollectionReference get usersCollection => _firestore.collection('users');

  // Obtener datos del usuario actual
  Future<DocumentSnapshot> getUserData() async {
    return await usersCollection.doc(uid).get();
  }

  // Actualizar datos del usuario
  Future<void> updateUserData(Map<String, dynamic> data) async {
    return await usersCollection.doc(uid).update(data);
  }

  // Guardar una nueva habilidad o atributo
  Future<void> saveSkill(String skillName, int value) async {
    return await usersCollection.doc(uid).collection('skills').doc(skillName).set({
      'name': skillName,
      'value': value,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // Obtener todas las habilidades del usuario
  Stream<QuerySnapshot> get skills {
    return usersCollection.doc(uid).collection('skills').snapshots();
  }
}