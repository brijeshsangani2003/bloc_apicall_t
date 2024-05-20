import '../../model/post_model.dart';

abstract class PostBlocState {}

///CircularProgressIndicator use mate
final class PostBlocLoadingState extends PostBlocState {}

final class PostBlocLoadedState extends PostBlocState {
  final List<PostModel> postData;

  PostBlocLoadedState({required this.postData});
}
