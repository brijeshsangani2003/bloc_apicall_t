import 'package:bloc_apicall_t/blocs/Comment_Bloc/comment_bloc_event.dart';
import 'package:bloc_apicall_t/blocs/Comment_Bloc/comment_bloc_state.dart';
import 'package:bloc_apicall_t/model/comment_model.dart';
import 'package:bloc_apicall_t/repositories/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentBlocEvent, CommentBlocState> {
  CommentBloc() : super(CommentBlocInitialState()) {
    on<CommentBlocEvent>((event, emit) async {
      List<CommentModel>? commentData = await ApiServices().comments();
      if (commentData != null) {
        emit(CommentBlocLoadedState(commentData: commentData));
      }
    });
    add(CommentInitialEvent());
  }
}
