import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc_clean_architecture/application/core/services/theme_service.dart';
import 'package:post_bloc_clean_architecture/application/feature/posts/post_bloc/postbloc_bloc.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    //BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
    context.read<PostBloc>().add(PostRequestedEvent());
    super.initState();
  }

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
              activeColor: Colors.green,
              inactiveThumbColor: Colors.black87,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              inactiveTrackColor: Colors.blueGrey,
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              }),
          IconButton(
            onPressed: () {
              BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'All Posts',
                style: theme.textTheme.displayMedium,
              ),
              Expanded(
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostInitial) {
                      return Text(
                        'Your posts are waiting to be loaded....',
                        style: theme.textTheme.bodySmall,
                      );
                    }
                    if (state is PostLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      );
                    }
                    if (state is PostLoaded) {
                      final data = state.posts;
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Center(
                                child: Text(data[index].id.toString()),
                              ),
                            ),
                            title: Text(data[index].title),
                            subtitle: Text(data[index].body),
                          ),
                        ),
                      );
                    }
                    if (state is PostError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const Center(
                      child:
                          Text('Something went wrong please try again later'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
