import '../../domain/entities/reel.dart';
import '../../domain/repositories/reel_repository.dart';
import '../datasources/reel_remote_data_source.dart';

class ReelRepositoryImpl implements ReelRepository {
  final ReelRemoteDataSource remoteDataSource;

  ReelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Reel>> getReels() async {
    return await remoteDataSource.getReels();
  }
}
