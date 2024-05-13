import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc_clean_architecture/application/core/services/theme_service.dart';
import 'package:post_bloc_clean_architecture/application/feature/posts/post_bloc/postbloc_bloc.dart';
import 'package:post_bloc_clean_architecture/application/feature/posts/posts_page.dart';
import 'package:post_bloc_clean_architecture/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeServiceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
        builder: (context, themeService, child) {
      return BlocProvider(
        create: (context) => PostBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const PostPage(),
        ),
      );
    });
  }
}
