import 'package:post_bloc_clean_architecture/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEntity>> getPostFromDataSource();
}
