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
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../../screens/data/data_sources/dashboard_datasource.dart' as _i11;
import '../../src/ads/data/data_sources/ads_datasource.dart' as _i3;
import '../../src/ads/domain/use_cases/ads_usecase.dart' as _i5;
import '../../src/ads/presentation/bloc/ads_bloc.dart' as _i25;
import '../../src/auth/data/data_sources/auth_datasource.dart' as _i6;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i15;
import '../../src/auth/data/repositories/auth_repo.dart' as _i8;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i28;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i7;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i27;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i26;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i34;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i40;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i41;
import '../../src/categories/data/data_sources/categories_datasource.dart'
    as _i9;
import '../../src/categories/domain/use_cases/categories_usecase.dart' as _i10;
import '../../src/categories/presentation/bloc/categories_bloc.dart' as _i31;
import '../../src/dashboard/data/data_sources/dashboard_datasource.dart'
    as _i12;
import '../../src/dashboard/presentation/bloc/dashboard_bloc.dart' as _i32;
import '../../src/employees/data/data_sources/employees_datasource.dart'
    as _i13;
import '../../src/employees/domain/use_cases/employees_usecase.dart' as _i14;
import '../../src/employees/presentation/bloc/employees_bloc.dart' as _i33;
import '../../src/positions/data/data_sources/positions_datasource.dart'
    as _i17;
import '../../src/positions/domain/use_cases/positions_usecase.dart' as _i18;
import '../../src/positions/presentation/bloc/positions_bloc.dart' as _i35;
import '../../src/products/data/data_sources/products_datasource.dart' as _i19;
import '../../src/products/domain/use_cases/products_usecase.dart' as _i20;
import '../../src/products/presentation/bloc/products_bloc.dart' as _i36;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i21;
import '../../src/settings/data/repositories/settings_repo.dart' as _i30;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i29;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i37;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i39;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i16;
import '../../src/users/data/data_sources/users_datasource.dart' as _i23;
import '../../src/users/domain/use_cases/users_usecase.dart' as _i24;
import '../../src/users/presentation/bloc/users_bloc.dart' as _i38;
import 'injection_module.dart' as _i42;

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
  gh.factory<_i3.AdsDatasource>(() => _i3.AdsDatasource(gh<_i4.Dio>()));
  gh.factory<_i5.AdsUseCase>(() => _i5.AdsUseCase(gh<_i3.AdsDatasource>()));
  gh.factory<_i6.AuthDataSource>(() => _i6.AuthDataSource(gh<_i4.Dio>()));
  gh.factory<_i7.BaseAuthRepo>(() => _i8.AuthRepo(gh<_i6.AuthDataSource>()));
  gh.factory<_i9.CategoriesDatasource>(
      () => _i9.CategoriesDatasource(gh<_i4.Dio>()));
  gh.factory<_i10.CategoriesUseCase>(
      () => _i10.CategoriesUseCase(gh<_i9.CategoriesDatasource>()));
  gh.factory<_i11.DashboardDatasource>(
      () => _i11.DashboardDatasource(gh<_i4.Dio>()));
  gh.factory<_i12.DashboardDatasource>(
      () => _i12.DashboardDatasource(gh<_i4.Dio>()));
  gh.factory<_i13.EmployeesDatasource>(
      () => _i13.EmployeesDatasource(gh<_i4.Dio>()));
  gh.factory<_i14.EmployeesUseCase>(
      () => _i14.EmployeesUseCase(gh<_i13.EmployeesDatasource>()));
  gh.factory<_i15.ForgotPasswordDataSource>(
      () => _i15.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i16.LanguageCubit>(() => _i16.LanguageCubit());
  gh.factory<_i17.PositionsDatasource>(
      () => _i17.PositionsDatasource(gh<_i4.Dio>()));
  gh.factory<_i18.PositionsUseCase>(
      () => _i18.PositionsUseCase(gh<_i17.PositionsDatasource>()));
  gh.factory<_i19.ProductsDatasource>(
      () => _i19.ProductsDatasource(gh<_i4.Dio>()));
  gh.factory<_i20.ProductsUseCase>(
      () => _i20.ProductsUseCase(gh<_i19.ProductsDatasource>()));
  gh.factory<_i21.SettingsDatasource>(
      () => _i21.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i22.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i23.UsersDatasource>(() => _i23.UsersDatasource(gh<_i4.Dio>()));
  gh.factory<_i24.UsersUseCase>(
      () => _i24.UsersUseCase(gh<_i23.UsersDatasource>()));
  gh.factory<_i25.AdsCubit>(() => _i25.AdsCubit(gh<_i5.AdsUseCase>()));
  gh.factory<_i26.AuthUseCase>(() => _i26.AuthUseCase(gh<_i7.BaseAuthRepo>()));
  gh.factory<_i27.BaseForgotPasswordRepo>(
      () => _i28.ForgotPasswordRepo(gh<_i15.ForgotPasswordDataSource>()));
  gh.factory<_i29.BaseSettingsRepo>(
      () => _i30.SettingsRepo(gh<_i21.SettingsDatasource>()));
  gh.factory<_i31.CategoriesCubit>(
      () => _i31.CategoriesCubit(gh<_i10.CategoriesUseCase>()));
  gh.factory<_i32.DashboardCubit>(
      () => _i32.DashboardCubit(gh<_i11.DashboardDatasource>()));
  gh.factory<_i33.EmployeesCubit>(() => _i33.EmployeesCubit(
        gh<_i14.EmployeesUseCase>(),
        gh<_i18.PositionsUseCase>(),
      ));
  gh.factory<_i34.ForgotPasswordUseCase>(
      () => _i34.ForgotPasswordUseCase(gh<_i27.BaseForgotPasswordRepo>()));
  gh.factory<_i35.PositionsCubit>(
      () => _i35.PositionsCubit(gh<_i18.PositionsUseCase>()));
  gh.factory<_i36.ProductsCubit>(() => _i36.ProductsCubit(
        gh<_i20.ProductsUseCase>(),
        gh<_i10.CategoriesUseCase>(),
      ));
  gh.factory<_i37.SettingsUseCase>(
      () => _i37.SettingsUseCase(gh<_i29.BaseSettingsRepo>()));
  gh.factory<_i38.UsersCubit>(() => _i38.UsersCubit(gh<_i24.UsersUseCase>()));
  gh.factory<_i39.AboutUsCubit>(
      () => _i39.AboutUsCubit(gh<_i37.SettingsUseCase>()));
  gh.factory<_i40.AuthCubit>(() => _i40.AuthCubit(gh<_i26.AuthUseCase>()));
  gh.factory<_i41.ForgotPasswordCubit>(
      () => _i41.ForgotPasswordCubit(gh<_i34.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i42.InjectionModule {}
