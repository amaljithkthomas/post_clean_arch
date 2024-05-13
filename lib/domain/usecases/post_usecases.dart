import 'package:post_bloc_clean_architecture/data/repositories/post_repo_implementation.dart';
import 'package:post_bloc_clean_architecture/domain/entities/post_entity.dart';
import 'package:post_bloc_clean_architecture/domain/repositories/post_repository.dart';

class PostUseCases {
  PostRepo postRepoObject = PostRepoImplementation();
  Future<List<PostEntity>> getPostFromDataSource() async {
    final posts = await postRepoObject.getPostFromDataSource();
    return posts;
  }
}
