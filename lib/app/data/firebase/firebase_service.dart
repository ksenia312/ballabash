import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<Map<String, dynamic>?> getLevelData(int level) async {
    final query = FirebaseFirestore.instance.collection('/levels').where(
          'number',
          isEqualTo: level,
        );
    final data = await query.get();
    if (data.docs.isEmpty) {
      return null;
    } else {
      return data.docs.first.data();
    }
  }

  Future<int?> getLevelsCount() async {
    final query = FirebaseFirestore.instance.collection('/levels').count();
    final data = await query.get();
    return data.count;
  }
}
