import '../../model/user_model.dart';

abstract class UserCubitState {}

class UserCubitLoadingState extends UserCubitState {}

class UserCubitLoadedState extends UserCubitState {
  final List<UserModel> userData;

  UserCubitLoadedState(this.userData);
}
