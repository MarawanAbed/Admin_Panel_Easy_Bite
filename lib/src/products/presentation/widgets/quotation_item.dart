// import 'package:admin_app/core/extensions/dimension.dart';
//
// import '../../../../core/utils/colors_manager.dart';
// import '../../../../core/utils/font_sizer.dart';
// import '../../../../core/utils/font_weight_manager.dart';
// import '../../../../main_index.dart';
// import '../../../../shared/custom_text.dart';
// import '../../domain/entities/quotation.dart';
//
// class QuotationItem extends StatelessWidget {
//   final Quotation quotation;
//   const QuotationItem({super.key, required this.quotation});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ()=>  Navigator.pushNamed(context, Routes.quotationDetailsPage,arguments: quotation.id),
//       child: Container(
//         padding:  EdgeInsets.all(4.0.w),
//         decoration: BoxDecoration(
//             color: ColorsManager.whiteColor,
//             borderRadius: BorderRadius.circular(10.r)),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               quotation.title ?? "",
//               maxLines: 2,
//               style: context.bodyMedium,
//             ),
//             Align(
//               alignment: AlignmentDirectional.bottomEnd,
//               child:  Text(
//                 context.strings.click_view_content,
//                 style: context.displaySmall.copyWith(
//                   fontSize: 10
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
