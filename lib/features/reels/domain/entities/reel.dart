import 'package:equatable/equatable.dart';

class Reel extends Equatable {
  final String id;
  final String videoUrl;
  final String username;
  final String caption;
  final int likes;

  const Reel({
    required this.id,
    required this.videoUrl,
    required this.username,
    required this.caption,
    required this.likes,
  });

  @override
  List<Object?> get props => [id, videoUrl, username, caption, likes];
}
