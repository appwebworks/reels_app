import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_reels.dart';
import 'reel_event.dart';
import 'reel_state.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final GetReels getReels;

  ReelBloc({required this.getReels}) : super(ReelInitial()) {
    on<FetchReelsEvent>(_onFetchReels);
  }

  Future<void> _onFetchReels(FetchReelsEvent event, Emitter<ReelState> emit) async {
    emit(ReelLoading());
    try {
      final reels = await getReels();
      emit(ReelLoaded(reels: reels));
    } catch (e) {
      emit(ReelError(message: e.toString()));
    }
  }
}
