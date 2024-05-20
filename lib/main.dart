import 'package:bloc_apicall_t/blocs/Comment_Bloc/comment_bloc_bloc.dart';
import 'package:bloc_apicall_t/cubits/user_cubit/user_cubit_cubit.dart';
import 'package:bloc_apicall_t/views/Post_Comment_Screen.dart';
import 'package:bloc_apicall_t/views/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/Post_Bloc/post_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CommentBloc()),
          BlocProvider(create: (context) => PostBloc()),
          BlocProvider(create: (context) => UserCubit()),
        ],
        //child: PostCommentScreen(),
        child: const UserScreen(),
      ),
    );
  }
}
