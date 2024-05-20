import 'package:bloc_apicall_t/cubits/user_cubit/user_cubit_state.dart';
import 'package:bloc_apicall_t/model/user_model.dart';
import 'package:bloc_apicall_t/repositories/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserCubitLoadingState()) {
    fetchUser();
  }

  void fetchUser() async {
    List<UserModel>? user = await ApiServices().users();
    emit(UserCubitLoadedState(user!));
  }
}
