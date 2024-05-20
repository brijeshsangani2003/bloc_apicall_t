import '../../model/comment_model.dart';

abstract class CommentBlocState {}

final class CommentBlocInitialState extends CommentBlocState {}

final class CommentBlocLoadedState extends CommentBlocState {
  final List<CommentModel> commentData;

  CommentBlocLoadedState({required this.commentData});
}
