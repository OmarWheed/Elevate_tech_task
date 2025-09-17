import 'package:elevate_tech_task/feature/home/data/api/home_api.dart';
import 'package:elevate_tech_task/feature/home/data/repo/data_sourse/home_data_sourse.dart';
import 'package:elevate_tech_task/feature/home/data/repo/data_sourse/home_data_sourse_impl.dart';
import 'package:elevate_tech_task/feature/home/data/repo/repository/home_repo.dart';
import 'package:elevate_tech_task/feature/home/data/repo/repository/home_repo_impl.dart';
import 'package:elevate_tech_task/feature/home/presentation/view_model/home_cubit.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => HomeApi());
  sl.registerLazySingleton<HomeDataSourse>(() => HomeDataSourseImpl(sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  sl.registerFactory(() => HomeCubit(sl()));
}
