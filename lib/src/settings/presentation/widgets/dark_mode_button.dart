import '../../../../core/utils/assets_manager.dart';
import '../../../main_index.dart';
import '../bloc/theme_bloc.dart';
import '../bloc/theme_state.dart';
import 'profile_switch_item_widget.dart';

class DarkModeButton extends BaseStatelessWidget {
   DarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ProfileSwitchItemWidget(
                title: strings.night_reading,
                hint: ThemeState.isDarkTheme(state.themeData) ? strings.enabled: strings.disabled,
                icon: AssetsManager.modeLightSVG,
                switchValue: ThemeState.isDarkTheme(state.themeData),
                onChanged: (value) {
                  print("value $value");
                  print("state.themeData ${state.themeData}");
                  value
                      ? BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEvent.toggleDark)
                      : BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEvent.toggleLight);
                }
            );
          }
      );
  }
}
