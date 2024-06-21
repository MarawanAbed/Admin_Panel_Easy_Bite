// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../../screens/data/data_sources/dashboard_datasource.dart' as _i10;
import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i13;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i25;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i24;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i23;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i31;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i37;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i38;
import '../../src/categories/data/data_sources/categories_datasource.dart'
    as _i7;
import '../../src/categories/domain/use_cases/categories_usecase.dart' as _i8;
import '../../src/categories/presentation/bloc/categories_bloc.dart' as _i28;
import '../../src/dashboard/data/data_sources/dashboard_datasource.dart' as _i9;
import '../../src/dashboard/presentation/bloc/dashboard_bloc.dart' as _i29;
import '../../src/employees/data/data_sources/employees_datasource.dart'
    as _i11;
import '../../src/employees/domain/use_cases/employees_usecase.dart' as _i12;
import '../../src/employees/presentation/bloc/employees_bloc.dart' as _i30;
import '../../src/positions/data/data_sources/positions_datasource.dart'
    as _i15;
import '../../src/positions/domain/use_cases/positions_usecase.dart' as _i16;
import '../../src/positions/presentation/bloc/positions_bloc.dart' as _i32;
import '../../src/products/data/data_sources/products_datasource.dart' as _i17;
import '../../src/products/domain/use_cases/products_usecase.dart' as _i18;
import '../../src/products/presentation/bloc/products_bloc.dart' as _i33;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i19;
import '../../src/settings/data/repositories/settings_repo.dart' as _i27;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i26;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i34;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i36;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i14;
import '../../src/users/data/data_sources/users_datasource.dart' as _i21;
import '../../src/users/domain/use_cases/users_usecase.dart' as _i22;
import '../../src/users/presentation/bloc/users_bloc.dart' as _i35;
import 'injection_module.dart' as _i39;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource(gh<_i4.Dio>()));
  gh.factory<_i5.BaseAuthRepo>(() => _i6.AuthRepo(gh<_i3.AuthDataSource>()));
  gh.factory<_i7.CategoriesDatasource>(
      () => _i7.CategoriesDatasource(gh<_i4.Dio>()));
  gh.factory<_i8.CategoriesUseCase>(
      () => _i8.CategoriesUseCase(gh<_i7.CategoriesDatasource>()));
  gh.factory<_i9.DashboardDatasource>(
      () => _i9.DashboardDatasource(gh<_i4.Dio>()));
  gh.factory<_i10.DashboardDatasource>(
      () => _i10.DashboardDatasource(gh<_i4.Dio>()));
  gh.factory<_i11.EmployeesDatasource>(
      () => _i11.EmployeesDatasource(gh<_i4.Dio>()));
  gh.factory<_i12.EmployeesUseCase>(
      () => _i12.EmployeesUseCase(gh<_i11.EmployeesDatasource>()));
  gh.factory<_i13.ForgotPasswordDataSource>(
      () => _i13.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i14.LanguageCubit>(() => _i14.LanguageCubit());
  gh.factory<_i15.PositionsDatasource>(
      () => _i15.PositionsDatasource(gh<_i4.Dio>()));
  gh.factory<_i16.PositionsUseCase>(
      () => _i16.PositionsUseCase(gh<_i15.PositionsDatasource>()));
  gh.factory<_i17.ProductsDatasource>(
      () => _i17.ProductsDatasource(gh<_i4.Dio>()));
  gh.factory<_i18.ProductsUseCase>(
      () => _i18.ProductsUseCase(gh<_i17.ProductsDatasource>()));
  gh.factory<_i19.SettingsDatasource>(
      () => _i19.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i20.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i21.UsersDatasource>(() => _i21.UsersDatasource(gh<_i4.Dio>()));
  gh.factory<_i22.UsersUseCase>(
      () => _i22.UsersUseCase(gh<_i21.UsersDatasource>()));
  gh.factory<_i23.AuthUseCase>(() => _i23.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i24.BaseForgotPasswordRepo>(
      () => _i25.ForgotPasswordRepo(gh<_i13.ForgotPasswordDataSource>()));
  gh.factory<_i26.BaseSettingsRepo>(
      () => _i27.SettingsRepo(gh<_i19.SettingsDatasource>()));
  gh.factory<_i28.CategoriesCubit>(
      () => _i28.CategoriesCubit(gh<_i8.CategoriesUseCase>()));
  gh.factory<_i29.DashboardCubit>(
      () => _i29.DashboardCubit(gh<_i10.DashboardDatasource>()));
  gh.factory<_i30.EmployeesCubit>(() => _i30.EmployeesCubit(
        gh<_i12.EmployeesUseCase>(),
        gh<_i16.PositionsUseCase>(),
      ));
  gh.factory<_i31.ForgotPasswordUseCase>(
      () => _i31.ForgotPasswordUseCase(gh<_i24.BaseForgotPasswordRepo>()));
  gh.factory<_i32.PositionsCubit>(
      () => _i32.PositionsCubit(gh<_i16.PositionsUseCase>()));
  gh.factory<_i33.ProductsCubit>(() => _i33.ProductsCubit(
        gh<_i18.ProductsUseCase>(),
        gh<_i8.CategoriesUseCase>(),
      ));
  gh.factory<_i34.SettingsUseCase>(
      () => _i34.SettingsUseCase(gh<_i26.BaseSettingsRepo>()));
  gh.factory<_i35.UsersCubit>(() => _i35.UsersCubit(gh<_i22.UsersUseCase>()));
  gh.factory<_i36.AboutUsCubit>(
      () => _i36.AboutUsCubit(gh<_i34.SettingsUseCase>()));
  gh.factory<_i37.AuthCubit>(() => _i37.AuthCubit(gh<_i23.AuthUseCase>()));
  gh.factory<_i38.ForgotPasswordCubit>(
      () => _i38.ForgotPasswordCubit(gh<_i31.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i39.InjectionModule {}
