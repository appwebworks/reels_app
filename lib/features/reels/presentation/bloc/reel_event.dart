import 'package:equatable/equatable.dart';

abstract class ReelEvent extends Equatable {
  const ReelEvent();

  @override
  List<Object> get props => [];
}

class FetchReelsEvent extends ReelEvent {}
