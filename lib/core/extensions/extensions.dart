import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:admin/src/main_index.dart';

import '../exceptions/api_exception.dart';


extension AppResource on BuildContext {

  AppLocalizations getStrings() {
    var stringRes = AppLocalizations.of(this);
    return stringRes! ;
  }

  T? getArguments<T>(){
    return ModalRoute.of(this)?.settings.arguments as T?;
  }


  String handleApiErrorMessage({required dynamic exception}) {
    String message = 'undefine_error';

    if (exception is DioError) {


      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        print('handleApiError whenApiException is dio   $message');

      }
      else {
        message = 'undefine_error';
      }
    }

    if (exception is ApiException) {
      message = exception.message;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    return message;
  }

  ApiException handleApiError({required dynamic exception}) {
    String message = 'undefine_error';
    String code = "0";
    if (exception is DioError) {
      print('handleApiError is dio   ${exception.error is ApiException}');

      if (exception.error is WebSocketException ||
          exception.error is HandshakeException) {
        message = 'error_internet_connection';
      } else if (exception.error is SocketException ||
          exception.error is TimeoutException ||
          exception.error is TimeoutException || exception.type == DioErrorType.connectionTimeout) {
        message = 'error_internet_connection';
      }
      else if (exception.error is ApiException) {
        message = (exception.error as ApiException).message;
        code = (exception.error as ApiException).code ;
      } else {
        message = 'undefine_error';
      }
    }

    if (exception is ApiException) {
      message = exception.message;
      code = exception.code;
    }

    if (exception is SocketException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'error_internet_connection';
    }

    if (exception is WebSocketException || exception is HandshakeException) {
      // placeHolderImage = Image.asset(Res.connection_error);
      message = 'check_network_connection';
    }

    print('handleApiError message ${message}');
    return ApiException(message ,code );
  }


}

extension NullOrEmpty on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty;
  }
}

extension ThemesExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get cardColor => Theme.of(this).cardColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get outline => Theme.of(this).colorScheme.outline;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  Color get hintColor => Theme.of(this).hintColor;

  Color get dividerColor => Theme.of(this).dividerColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get displayLarge => textTheme.displayLarge!;

  TextStyle get displayMedium => textTheme.displayMedium!;

  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;
}

extension PaddingExtension on num {
  EdgeInsetsDirectional get paddingAll => EdgeInsetsDirectional.all(toDouble());

  EdgeInsetsDirectional get paddingVert =>
      EdgeInsetsDirectional.symmetric(vertical: toDouble());

  EdgeInsetsDirectional get paddingHoriz =>
      EdgeInsetsDirectional.symmetric(horizontal: toDouble());

  EdgeInsetsDirectional get paddingStart =>
      EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsDirectional get paddingEnd =>
      EdgeInsetsDirectional.only(end: toDouble());

  EdgeInsetsDirectional get paddingTop =>
      EdgeInsetsDirectional.only(top: toDouble());

  EdgeInsetsDirectional get paddingBottom =>
      EdgeInsetsDirectional.only(bottom: toDouble());
}

extension EmptyPaadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

extension ConvertColor on String {
  Color toColor() {
    return Color(int.parse('0xFF${substring(1)}'));
  }
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String get countryCode => locale.countryCode!;

  String get ar => 'ar';
  String get en => 'en';
  String get fr => 'fr';


  String get languageName {
    switch (languageCode) {
      case 'ar':
        return strings.arabic;
      case 'en':
        return strings.english;
      case 'fr':
        return strings.french;
      default:
        return strings.arabic;
    }
  }
}


extension AppLocalizationsShortcuts on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this) ?? injector<ServicesLocator>().strings;
}


extension SizeExtension on BuildContext {
  BuildContext get context => injector<ServicesLocator>().appContext;
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;
}

extension FirstOrNullExtension<T> on List<T> {
  T? firstOrNull(bool Function(T element) test) {
    try {
      return any(test) ? firstWhere(test) : null;
    } catch (e) {
      return null;
    }
  }
}