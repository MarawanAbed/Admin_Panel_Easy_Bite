import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/widgets/scaffold/app_scaffold.dart';
import 'change_language_screen.dart';

class ChangeLanguagePage extends BaseStatelessWidget {
  ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      title: strings.change_language,
        body: ChangeLanguageScreen());
  }
}


