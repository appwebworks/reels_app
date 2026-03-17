import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/reel_model.dart';

abstract class ReelRemoteDataSource {
  Future<List<ReelModel>> getReels();
}

class ReelRemoteDataSourceImpl implements ReelRemoteDataSource {
  final FirebaseFirestore firestore;

  ReelRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<ReelModel>> getReels() async {
    try {
      final snapshot = await firestore.collection('reels').get();
      return snapshot.docs
          .map((doc) => ReelModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch reels: $e');
    }
  }
}
