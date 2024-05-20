import 'dart:developer';

import 'package:bloc_apicall_t/model/user_model.dart';

import '../core/constants/network_constants.dart';
import '../model/comment_model.dart';
import '../model/post_model.dart';
import 'Api_Services.dart';

class ApiServices {
  Future<List<PostModel>?> posts() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.posts,
        callType: ApiCallType.get,
      );

      if (result != null) {
        List<PostModel> postData =
            result.map((e) => PostModel.fromJson(e)).toList();

        return postData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<CommentModel>?> comments() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.comments,
        callType: ApiCallType.get,
      );

      if (result != null) {
        List<CommentModel> commentData =
            result.map((e) => CommentModel.fromJson(e)).toList();

        return commentData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<UserModel>?> users() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConstants.users,
        callType: ApiCallType.get,
      );

      if (result != null) {
        List<UserModel> userData =
            result.map((e) => UserModel.fromJson(e)).toList();

        return userData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
