import 'package:get_it/get_it.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/RepoImplmentation/TaskManagementRepoImpl.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/RepoImplmentation/TaskValidationRepoImpl.dart';
import 'package:todo_list_app/Features/Home/Data/RepoImplmentation/HomeComponentsRepoImpl.dart';
import 'package:todo_list_app/Features/Search/Data/RepoImplmentation/SearchRepoImpl.dart';
import 'package:todo_list_app/Features/ViewTasks/Data/RepoImplmentation/FetchTasksRepoImpl.dart';
import 'package:todo_list_app/Features/ViewTasks/Data/RepoImplmentation/MidNightRefreshRepoImpl.dart';

GetIt getit = GetIt.instance;

void setup() {
  getit.registerSingleton<HiveServices>(const HiveServices());

  getit.registerSingleton<TaskValidationRepoImpl>(TaskValidationRepoImpl());

  getit.registerSingleton<TaskManagementRepoImpl>(TaskManagementRepoImpl(getit<HiveServices>(), getit<TaskValidationRepoImpl>()));

  getit.registerSingleton<HomeComponentsRepoImpl>(HomeComponentsRepoImpl(getit<HiveServices>()));

  getit.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getit<HiveServices>()));

  getit.registerSingleton<FetchTasksRepoImpl>(FetchTasksRepoImpl(getit<HiveServices>()));

  getit.registerSingleton<MidHightRefresherRepoImpl>(MidHightRefresherRepoImpl());
}
