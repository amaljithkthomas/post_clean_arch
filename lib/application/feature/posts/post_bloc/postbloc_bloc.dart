import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc_clean_architecture/domain/entities/post_entity.dart';
import 'package:post_bloc_clean_architecture/domain/usecases/post_usecases.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>((event, emit) async {
      print('bloc initialised');
      emit(PostLoading());
      await Future.delayed(const Duration(seconds: 2));
      try {
        final posts = await PostUseCases().getPostFromDataSource();
        emit(PostLoaded(posts: posts));
      } catch (e) {
        emit(
          PostError(
            message: e.toString(),
          ),
        );
      }
    });
  }
}
