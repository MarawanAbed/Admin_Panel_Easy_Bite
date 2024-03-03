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
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i7;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i17;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i16;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i15;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i20;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i24;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i25;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i9;
import '../../src/settings/data/repositories/settings_repo.dart' as _i19;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i18;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i21;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i23;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i8;
import '../../src/users/data/data_sources/users_datasource.dart' as _i11;
import '../../src/users/data/repositories/users_repo_imp.dart' as _i13;
import '../../src/users/domain/repositories/users_repo.dart' as _i12;
import '../../src/users/domain/use_cases/users_usecase.dart' as _i14;
import '../../src/users/presentation/bloc/users_bloc.dart' as _i22;
import 'injection_module.dart' as _i26;

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
  gh.factory<_i7.ForgotPasswordDataSource>(
      () => _i7.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i8.LanguageCubit>(() => _i8.LanguageCubit());
  gh.factory<_i9.SettingsDatasource>(
      () => _i9.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i11.UsersDatasource>(() => _i11.UsersDatasource(gh<_i4.Dio>()));
  gh.factory<_i12.UsersRepo>(
      () => _i13.UsersRepoImp(gh<_i11.UsersDatasource>()));
  gh.factory<_i14.UsersUseCase>(
      () => _i14.UsersUseCase(gh<_i11.UsersDatasource>()));
  gh.factory<_i15.AuthUseCase>(() => _i15.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i16.BaseForgotPasswordRepo>(
      () => _i17.ForgotPasswordRepo(gh<_i7.ForgotPasswordDataSource>()));
  gh.factory<_i18.BaseSettingsRepo>(
      () => _i19.SettingsRepo(gh<_i9.SettingsDatasource>()));
  gh.factory<_i20.ForgotPasswordUseCase>(
      () => _i20.ForgotPasswordUseCase(gh<_i16.BaseForgotPasswordRepo>()));
  gh.factory<_i21.SettingsUseCase>(
      () => _i21.SettingsUseCase(gh<_i18.BaseSettingsRepo>()));
  gh.factory<_i22.UsersCubit>(() => _i22.UsersCubit(gh<_i14.UsersUseCase>()));
  gh.factory<_i23.AboutUsCubit>(
      () => _i23.AboutUsCubit(gh<_i21.SettingsUseCase>()));
  gh.factory<_i24.AuthCubit>(() => _i24.AuthCubit(gh<_i15.AuthUseCase>()));
  gh.factory<_i25.ForgotPasswordCubit>(
      () => _i25.ForgotPasswordCubit(gh<_i20.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i26.InjectionModule {}
