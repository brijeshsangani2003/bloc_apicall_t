import 'package:bloc_apicall_t/cubits/user_cubit/user_cubit_cubit.dart';
import 'package:bloc_apicall_t/cubits/user_cubit/user_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BlocBuilder<UserCubit, UserCubitState>(
            builder: (context, state) {
              if (state is UserCubitLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserCubitLoadedState) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.userData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Title:-',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.userData[index].name.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    maxLines: 2,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                );
              } else {
                return const Text('Something Went Wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
