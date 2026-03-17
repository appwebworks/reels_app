import '../../domain/entities/reel.dart';

class ReelModel extends Reel {
  const ReelModel({
    required super.id,
    required super.videoUrl,
    required super.username,
    required super.caption,
    required super.likes,
  });

  factory ReelModel.fromFirestore(Map<String, dynamic> json, String id) {
    return ReelModel(
      id: id,
      videoUrl: json['videoUrl'] ?? '',
      username: json['username'] ?? '',
      caption: json['caption'] ?? '',
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'videoUrl': videoUrl,
      'username': username,
      'caption': caption,
      'likes': likes,
    };
  }
}
