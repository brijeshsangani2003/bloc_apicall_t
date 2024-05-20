import 'package:bloc_apicall_t/blocs/Post_Bloc/post_bloc_event.dart';
import 'package:bloc_apicall_t/blocs/Post_Bloc/post_bloc_state.dart';
import 'package:bloc_apicall_t/model/post_model.dart';
import 'package:bloc_apicall_t/repositories/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostBlocEvent, PostBlocState> {
  ///super(); aa super keyword Bloc<PostBlocEvent, PostBlocState> anu work karse.
  PostBloc() : super(PostBlocLoadingState()) {
    on<PostBlocEvent>((event, emit) async {
      List<PostModel>? postData = await ApiServices().posts();
      if (postData != null) {
        emit(PostBlocLoadedState(postData: postData));
      }
    });

    ///on(); method jetli event hse etli var call karavani.
    add(PostInitialEvent());
  }
}
