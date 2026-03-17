import 'package:equatable/equatable.dart';
import '../../domain/entities/reel.dart';

abstract class ReelState extends Equatable {
  const ReelState();

  @override
  List<Object> get props => [];
}

class ReelInitial extends ReelState {}

class ReelLoading extends ReelState {}

class ReelLoaded extends ReelState {
  final List<Reel> reels;

  const ReelLoaded({required this.reels});

  @override
  List<Object> get props => [reels];
}

class ReelError extends ReelState {
  final String message;

  const ReelError({required this.message});

  @override
  List<Object> get props => [message];
}
