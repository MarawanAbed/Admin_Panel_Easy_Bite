
import '../../../../../core/widgets/radio/custom_radio_list_tile.dart';
import '../../../../main_index.dart';
import '../../bloc/locale_cubit.dart';
import '../../bloc/locale_state.dart';

class ChangeLanguageScreen extends BaseStatelessWidget {
  ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.change_language,
            style: theme.textTheme.bodyLarge,
          ),
          Container(
            margin: 10.paddingTop,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: Decorations.kDecorationRadius(
              color: context.cardColor,
              radius: 8,
            ),
            child: BlocBuilder<LocaleCubit, LocalState>(
                bloc: LocaleCubit()..getLanguageData(),
                builder: (context, state) {
                  return
                    Column(
                    children: [
                      CustomRadioListTile(
                        value: 'ar',
                        title: strings.arabic,
                        groupValue: state.language,
                        onChanged: (value) {
                          context.read<LocaleCubit>().setLanguageData(value.toString());
                        },
                      ),
                      CustomRadioListTile(
                        value: 'en',
                        title: strings.english,
                        groupValue: state.language,
                        onChanged: (value) {
                          print('value $value');
                          context.read<LocaleCubit>().setLanguageData(value.toString());
                        },
                      ),
                      CustomRadioListTile(
                        value: 'fr',
                        title: strings.french,
                        groupValue: state.language,
                        onChanged: (value) {
                          print('value $value');
                          context.read<LocaleCubit>().setLanguageData(value.toString());
                        },
                      ),
                    ],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
