import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/Core/Failures/Result.dart';
import 'package:todo_list_app/Features/Home/Data/Models/HomeComponentsModel.dart';
import 'package:todo_list_app/Features/Home/Domain/RepoInterface/HomeComponentsRepo.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeComponentsRepo) : super(HomeViewInitial());

  late HomeComponentsModel homeComponentsModel;
  final HomeComponentsRepo homeComponentsRepo;

  void getNumOfEachTask() {
    Result res = homeComponentsRepo.getHomeComponents();

    if (res is ResultSuccess) {
      homeComponentsModel = res.data;
      return emit(HomeViewSuccessed());
    } else if (res is ResultFailure) {
      return emit(HomeViewFailed(errMessage: res.failure.message));
    }
  }
}
