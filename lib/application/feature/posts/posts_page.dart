import 'package:flutter/material.dart';
import 'package:post_bloc_clean_architecture/application/core/services/theme_service.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post app - Bloc',
          style: theme.textTheme.titleMedium,
        ),
        actions: [
          Switch(
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              })
        ],
      ),
    );
  }
}
