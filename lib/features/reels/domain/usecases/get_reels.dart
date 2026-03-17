import '../entities/reel.dart';
import '../repositories/reel_repository.dart';

class GetReels {
  final ReelRepository repository;

  GetReels(this.repository);

  Future<List<Reel>> call() async {
    return await repository.getReels();
  }
}
