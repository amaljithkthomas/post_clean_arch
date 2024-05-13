part of 'postbloc_bloc.dart';

@immutable
sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;
  PostLoaded({required this.posts});
  @override
  List<Object?> get props => [];
}

class PostError extends PostState {
  final String message;
  PostError({required this.message});
  @override
  List<Object?> get props => [];
}
