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
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i11;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i23;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i22;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i21;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i28;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i34;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i35;
import '../../src/categories/data/data_sources/categories_datasource.dart'
    as _i7;
import '../../src/categories/domain/use_cases/categories_usecase.dart' as _i8;
import '../../src/categories/presentation/bloc/categories_bloc.dart' as _i26;
import '../../src/employees/data/data_sources/employees_datasource.dart' as _i9;
import '../../src/employees/domain/use_cases/employees_usecase.dart' as _i10;
import '../../src/employees/presentation/bloc/employees_bloc.dart' as _i27;
import '../../src/positions/data/data_sources/positions_datasource.dart'
    as _i13;
import '../../src/positions/domain/use_cases/positions_usecase.dart' as _i14;
import '../../src/positions/presentation/bloc/positions_bloc.dart' as _i29;
import '../../src/products/data/data_sources/products_datasource.dart' as _i15;
import '../../src/products/domain/use_cases/products_usecase.dart' as _i16;
import '../../src/products/presentation/bloc/products_bloc.dart' as _i30;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i17;
import '../../src/settings/data/repositories/settings_repo.dart' as _i25;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i24;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i31;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i33;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i12;
import '../../src/users/data/data_sources/users_datasource.dart' as _i19;
import '../../src/users/domain/use_cases/users_usecase.dart' as _i20;
import '../../src/users/presentation/bloc/users_bloc.dart' as _i32;
import 'injection_module.dart' as _i36;

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
  gh.factory<_i9.EmployeesDatasource>(
      () => _i9.EmployeesDatasource(gh<_i4.Dio>()));
  gh.factory<_i10.EmployeesUseCase>(
      () => _i10.EmployeesUseCase(gh<_i9.EmployeesDatasource>()));
  gh.factory<_i11.ForgotPasswordDataSource>(
      () => _i11.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i12.LanguageCubit>(() => _i12.LanguageCubit());
  gh.factory<_i13.PositionsDatasource>(
      () => _i13.PositionsDatasource(gh<_i4.Dio>()));
  gh.factory<_i14.PositionsUseCase>(
      () => _i14.PositionsUseCase(gh<_i13.PositionsDatasource>()));
  gh.factory<_i15.ProductsDatasource>(
      () => _i15.ProductsDatasource(gh<_i4.Dio>()));
  gh.factory<_i16.ProductsUseCase>(
      () => _i16.ProductsUseCase(gh<_i15.ProductsDatasource>()));
  gh.factory<_i17.SettingsDatasource>(
      () => _i17.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i18.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i19.UsersDatasource>(() => _i19.UsersDatasource(gh<_i4.Dio>()));
  gh.factory<_i20.UsersUseCase>(
      () => _i20.UsersUseCase(gh<_i19.UsersDatasource>()));
  gh.factory<_i21.AuthUseCase>(() => _i21.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i22.BaseForgotPasswordRepo>(
      () => _i23.ForgotPasswordRepo(gh<_i11.ForgotPasswordDataSource>()));
  gh.factory<_i24.BaseSettingsRepo>(
      () => _i25.SettingsRepo(gh<_i17.SettingsDatasource>()));
  gh.factory<_i26.CategoriesCubit>(
      () => _i26.CategoriesCubit(gh<_i8.CategoriesUseCase>()));
  gh.factory<_i27.EmployeesCubit>(
      () => _i27.EmployeesCubit(gh<_i10.EmployeesUseCase>()));
  gh.factory<_i28.ForgotPasswordUseCase>(
      () => _i28.ForgotPasswordUseCase(gh<_i22.BaseForgotPasswordRepo>()));
  gh.factory<_i29.PositionsCubit>(
      () => _i29.PositionsCubit(gh<_i14.PositionsUseCase>()));
  gh.factory<_i30.ProductsCubit>(
      () => _i30.ProductsCubit(gh<_i16.ProductsUseCase>()));
  gh.factory<_i31.SettingsUseCase>(
      () => _i31.SettingsUseCase(gh<_i24.BaseSettingsRepo>()));
  gh.factory<_i32.UsersCubit>(() => _i32.UsersCubit(gh<_i20.UsersUseCase>()));
  gh.factory<_i33.AboutUsCubit>(
      () => _i33.AboutUsCubit(gh<_i31.SettingsUseCase>()));
  gh.factory<_i34.AuthCubit>(() => _i34.AuthCubit(gh<_i21.AuthUseCase>()));
  gh.factory<_i35.ForgotPasswordCubit>(
      () => _i35.ForgotPasswordCubit(gh<_i28.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i36.InjectionModule {}
