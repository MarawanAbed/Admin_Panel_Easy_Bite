import 'package:admin/core/extensions/dimension.dart';
import 'package:admin/core/extensions/extensions.dart';

import '../../../src/main_index.dart';
import '../../utils/colors_manager.dart';
import '../../utils/screen_sizer.dart';
import 'progress_dialog.dart';

class DialogsManager {
  static CustomProgressDialog createProgress() {
    return ProgressDialog.createProgress(
        injector<ServicesLocator>().navigatorKey.currentContext!);
  }

  static showAlertDialog(BuildContext context, Widget content) {
    AlertDialog alert = AlertDialog(
      content: Container(
        child: content,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static onBackPress(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static baseDialog(
      BuildContext context, {
        String? confirmButtonName,
        required String message,
        Function()? onClickOk,
        bool? dismissible = true,
        Function()? negativeTap,
        required IconData icon,
        String? negativeButtonName,
        bool hideCancelButton = true,
      }) {
    print('baseDialog $message');
    showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Icon(icon, size: 60, color: icon == Icons.error ? Colors.red : Colors.green),
          actionsPadding: 10.paddingBottom ,
          content: WillPopScope(
            onWillPop: () async {
              return dismissible == true;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: context.bodyMedium),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (onClickOk != null) {
                  onClickOk();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                confirmButtonName ?? context.strings.ok,
                style:  context.bodyMedium.copyWith(color: Colors.green, fontSize: 18),
              ),
            ),
            hideCancelButton == true
                ? const SizedBox.shrink()
                : TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (negativeTap != null) {
                  negativeTap();
                }
              },
              child: Text(
                negativeButtonName ?? context.strings.cancel,
                style: context.bodyMedium.copyWith(color: Colors.red),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }

  static showSuccessDialog(BuildContext context,
      {required String message, Function()? onClickOk}) {
    return baseDialog(context,
        message: message, icon: Icons.check_circle, onClickOk: onClickOk);
  }

  static showErrorDialog(BuildContext context, String text) {
    baseDialog(context, message: text, icon: Icons.error, );
  }


  static showInfoDialog(BuildContext context,
  {required String message, Function()? onClickOk}) {
    baseDialog(context, message: message, icon: Icons.info, onClickOk: onClickOk, hideCancelButton: false);
  }
}
void showCustomBottomSheetMenu({
  required BuildContext context,
  required Widget child,
  required double height,
}) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(ScreenSizer.borderRadius24),
        topRight: Radius.circular(ScreenSizer.borderRadius24),
      ),
    ),
    context: context,
    builder: (builder) {
      return Container(
        height: height,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSizer.padding24,
            vertical: ScreenSizer.padding20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ScreenSizer.borderRadius24),
            topRight: Radius.circular(ScreenSizer.borderRadius24),
          ),
          color: ColorsManager.offWhiteColorF9F0E1,
        ),
        child: child,
      );
    },

  );
}


void showMyDialog(
    {required BuildContext context,
      required Widget title,
      required Widget child}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenSizer.borderRadius28),
      ),
      titlePadding: const EdgeInsets.only(top: 10),
      insetPadding: EdgeInsets.symmetric(horizontal: 12),
      backgroundColor: context.cardColor,
      title: Padding(
        padding: EdgeInsets.all(6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  size: 20.w,
                  color: ColorsManager.blackColor343434,
                )),
            Center(child: title),
            const SizedBox()
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: child,
        ),
      ),
    ),
  );
}
