import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'features/reels/data/datasources/reel_remote_data_source.dart';
import 'features/reels/data/repositories/reel_repository_impl.dart';
import 'features/reels/domain/repositories/reel_repository.dart';
import 'features/reels/domain/usecases/get_reels.dart';
import 'features/reels/presentation/bloc/reel_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => ReelBloc(getReels: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetReels(sl()));

  // Repository
  sl.registerLazySingleton<ReelRepository>(
    () => ReelRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ReelRemoteDataSource>(
    () => ReelRemoteDataSourceImpl(firestore: sl()),
  );

  // External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
