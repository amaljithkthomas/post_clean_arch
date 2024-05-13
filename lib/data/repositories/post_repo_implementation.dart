import 'package:post_bloc_clean_architecture/data/data_source/post_remote_datasource.dart';
import 'package:post_bloc_clean_architecture/domain/entities/post_entity.dart';
import 'package:post_bloc_clean_architecture/domain/repositories/post_repository.dart';

class PostRepoImplementation extends PostRepo {
  PostRemoteDataSource postRemoteDataSourceImplObject =
      PostRemoteDataSourceImpl();
  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final postModels = await postRemoteDataSourceImplObject.getPostModels();
    return postModels;
  }
}
