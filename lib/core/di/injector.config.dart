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
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../src/auth/data/data_sources/auth_datasource.dart' as _i3;
import '../../src/auth/data/data_sources/forgot_password_datasource.dart'
    as _i8;
import '../../src/auth/data/repositories/auth_repo.dart' as _i6;
import '../../src/auth/data/repositories/forgot_password_repo.dart' as _i16;
import '../../src/auth/domain/repositories/base_auth_repo.dart' as _i5;
import '../../src/auth/domain/repositories/base_forgot_password_repo.dart'
    as _i15;
import '../../src/auth/domain/use_cases/auth_usecase.dart' as _i12;
import '../../src/auth/domain/use_cases/forgot_password_usecase.dart' as _i20;
import '../../src/auth/presentation/bloc/auth_bloc.dart' as _i23;
import '../../src/auth/presentation/bloc/forgot_password_bloc.dart' as _i25;
import '../../src/benefits/data/data_sources/benefits_datasource.dart' as _i7;
import '../../src/benefits/data/repositories/benefits_repo.dart' as _i14;
import '../../src/benefits/domain/repositories/base_benefits_repo.dart' as _i13;
import '../../src/benefits/domain/use_cases/benefits_usecase.dart' as _i19;
import '../../src/benefits/presentation/bloc/benefits_bloc.dart' as _i24;
import '../../src/settings/data/data_sources/settings_datasource.dart' as _i10;
import '../../src/settings/data/repositories/settings_repo.dart' as _i18;
import '../../src/settings/domain/repositories/base_settings_repo.dart' as _i17;
import '../../src/settings/domain/use_cases/settings_usecase.dart' as _i21;
import '../../src/settings/presentation/bloc/about_us_bloc.dart' as _i22;
import '../../src/settings/presentation/bloc/language_bloc.dart' as _i9;
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
  gh.factory<_i7.BenefitsDatasource>(
      () => _i7.BenefitsDatasource(gh<_i4.Dio>()));
  gh.factory<_i8.ForgotPasswordDataSource>(
      () => _i8.ForgotPasswordDataSource(gh<_i4.Dio>()));
  gh.factory<_i9.LanguageCubit>(() => _i9.LanguageCubit());
  gh.factory<_i10.SettingsDatasource>(
      () => _i10.SettingsDatasource(gh<_i4.Dio>()));
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  gh.factory<_i12.AuthUseCase>(() => _i12.AuthUseCase(gh<_i5.BaseAuthRepo>()));
  gh.factory<_i13.BaseBenefitsRepo>(
      () => _i14.BenefitsRepo(gh<_i7.BenefitsDatasource>()));
  gh.factory<_i15.BaseForgotPasswordRepo>(
      () => _i16.ForgotPasswordRepo(gh<_i8.ForgotPasswordDataSource>()));
  gh.factory<_i17.BaseSettingsRepo>(
      () => _i18.SettingsRepo(gh<_i10.SettingsDatasource>()));
  gh.factory<_i19.BenefitsUseCase>(
      () => _i19.BenefitsUseCase(gh<_i13.BaseBenefitsRepo>()));
  gh.factory<_i20.ForgotPasswordUseCase>(
      () => _i20.ForgotPasswordUseCase(gh<_i15.BaseForgotPasswordRepo>()));
  gh.factory<_i21.SettingsUseCase>(
      () => _i21.SettingsUseCase(gh<_i17.BaseSettingsRepo>()));
  gh.factory<_i22.AboutUsCubit>(
      () => _i22.AboutUsCubit(gh<_i21.SettingsUseCase>()));
  gh.factory<_i23.AuthCubit>(() => _i23.AuthCubit(gh<_i12.AuthUseCase>()));
  gh.factory<_i24.BenefitsCubit>(
      () => _i24.BenefitsCubit(gh<_i19.BenefitsUseCase>()));
  gh.factory<_i25.ForgotPasswordCubit>(
      () => _i25.ForgotPasswordCubit(gh<_i20.ForgotPasswordUseCase>()));
  return getIt;
}

class _$InjectionModule extends _i26.InjectionModule {}
