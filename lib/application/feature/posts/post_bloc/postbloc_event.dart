part of 'postbloc_bloc.dart';

@immutable
sealed class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostRequestedEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}
