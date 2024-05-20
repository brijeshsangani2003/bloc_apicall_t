import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Comment_Bloc/comment_bloc_bloc.dart';
import '../blocs/Comment_Bloc/comment_bloc_event.dart';
import '../blocs/Comment_Bloc/comment_bloc_state.dart';
import '../blocs/Post_Bloc/post_bloc_bloc.dart';
import '../blocs/Post_Bloc/post_bloc_event.dart';
import '../blocs/Post_Bloc/post_bloc_state.dart';
import '../model/comment_model.dart';
import '../model/post_model.dart';

class PostCommentScreen extends StatelessWidget {
  PostCommentScreen({Key? key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  BlocProvider.of<PostBloc>(context).add(PostGetEvent());
                  BlocProvider.of<CommentBloc>(context).add(CommentGetEvent());
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'Post Screen',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<PostBloc, PostBlocState>(
                    builder: (context, state) {
                      // int a = 2;
                      // if (a == 2)
                      // == to check value.=>jyre value check karvi hoy tyre == no use thai.
                      // is to check data type.=>jyre value no type check karvo hoy tyre is keyword use thai
                      //means if(a is 2)
                      // a no type int che am.
                      if (state is PostBlocLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is PostBlocLoadedState) {
                        final List<PostModel> searchPosts =
                            state.postData.where((post) {
                          final String query =
                              searchController.text.toLowerCase();
                          return post.id.toString().contains(query) ||
                              post.userId.toString().contains(query) ||
                              post.title!.toLowerCase().contains(query);
                        }).toList();

                        return searchPosts.isNotEmpty
                            ? Container(
                                height: 167,
                                color: Colors.white24,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 150,
                                            width: 280,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.amberAccent.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Id:-',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      // Text(state
                                                      //     .postData[index].id
                                                      //     .toString()),
                                                      Text(searchPosts[index]
                                                          .id
                                                          .toString()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'User Id-',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(searchPosts[index]
                                                          .userId
                                                          .toString()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Title:-',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          searchPosts[index]
                                                              .title
                                                              .toString(),
                                                          maxLines: 3,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: searchPosts.length,
                                ),
                              )
                            : const Text('Data not found');
                      } else {
                        return const Center(
                            child: Text('Something Went Wrong'));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Comment Screen',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CommentBloc, CommentBlocState>(
                    builder: (context, state) {
                      if (state is CommentBlocInitialState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CommentBlocLoadedState) {
                        final List<CommentModel> searchComments =
                            state.commentData.where((comment) {
                          final String query =
                              searchController.text.toLowerCase();
                          return comment.id.toString().contains(query) ||
                              comment.email!.toLowerCase().contains(query) ||
                              comment.name!.toLowerCase().contains(query);
                        }).toList();

                        return searchComments.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Card(
                                          color: Colors.lightBlueAccent,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Id:-',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(searchComments[index]
                                                        .id
                                                        .toString()),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Email:-',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                          searchComments[index]
                                                              .email
                                                              .toString()),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Name:-',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        searchComments[index]
                                                            .name
                                                            .toString(),
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: searchComments.length,
                                ),
                              )
                            : const Text('Data Not Found');
                      } else {
                        return const Center(
                            child: Text('Something Went Wrong'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
