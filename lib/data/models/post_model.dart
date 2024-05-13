import 'package:post_bloc_clean_architecture/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({required body, required title, required id, required userId})
      : super(
          body: body,
          title: title,
          id: id,
          userId: userId,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'],
      title: json['title'],
      id: json['id'],
      userId: json['userId'],
    );
  }
}
