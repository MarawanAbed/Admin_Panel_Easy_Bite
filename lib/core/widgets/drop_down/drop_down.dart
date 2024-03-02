import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:admin/src/main_index.dart';

import '../../resources/validation.dart';

class DropDownField extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem) onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final Color? colorBorderSide;
  final Color? fillColor;
  final TextStyle? hintStyle;

  const DropDownField(
      {Key? key,
      required this.items,
      this.title,
      this.hint,
      required this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.colorBorderSide,
      this.fillColor,
      this.hintStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Color? borderColor = colorBorderSide ??
        context.theme.inputDecorationTheme.fillColor ??
        context.theme.colorScheme.onSurface;
    print('saasc ${items.firstOrNull((element) => element.id == value)}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
        DropdownButtonFormField2<DropDownItem>(
          isExpanded: true,
          value: value != null
              ? items.firstOrNull((element) => element.id == value)
              : null,
          decoration: InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            // label: Text(
            //   hint ?? '',
            //   style: context.displaySmall,
            // ),
            constraints: BoxConstraints(
              maxHeight: 40,
            ),
            filled: true,
            fillColor:
                fillColor ?? context.theme.inputDecorationTheme.fillColor,
            contentPadding: EdgeInsets.zero,

            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            // Add more decoration..
          ),
          hint: Text(
            hint ?? '',
            style: hintStyle ?? context.labelSmall.copyWith(fontSize: 16),
          ),
          items: items
              .map((item) => DropdownMenuItem<DropDownItem>(
                    value: item,
                    child: Text(
                      item.title ?? '',
                      style: context.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ))
              .toList(),
          validator: isValidator
              ? (value) => Validation.validateRequired(value?.title ?? '')
              : null,
          onChanged: (value) {
            onChanged(value!);
          },
          onSaved: (value) {
            //  selectedValue = value.toString();
          },
          buttonStyleData: ButtonStyleData(
            padding: 0.paddingVert + 6.paddingEnd,
            // decoration: BoxDecoration(
            //   color: Colors.transparent,
            // ),
            height: 50,
          ),
          iconStyleData: IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
            ),
            iconDisabledColor: context.disabledColor,
            iconEnabledColor: context.primaryColor,
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: context.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.theme.inputDecorationTheme.fillColor,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
          onMenuStateChange: (isMenuOpen) {
            if (isMenuOpen) {
              searchController.clear();
            }
          },
          dropdownSearchData: DropdownSearchData(
            searchController: searchController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: 5.paddingAll,
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: searchController,
                style: context.bodyMedium,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  hintText: context.strings.search_here,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.dividerColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: context.dividerColor,
                    ),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value!.title.toString().contains(searchValue);
            },
          ),
        ),
      ],
    );
  }
}

// class DefaultDropDown extends StatelessWidget {
//   final List<DropdownMenuItem>? items;
//   final String? hintText;
//   final String? value;
//   final TextStyle? texStyle;
//   final IconData? prefixIcon;
//   final bool? isLoading;
//   final void Function(dynamic)? onChanged;
//   final bool isValidator;
//   const DefaultDropDown({Key? key, this.items, this.hintText, this.value, this.texStyle, this.prefixIcon, this.isLoading = false, this.onChanged, this.isValidator = true}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  isLoading! ? DropDownField(
//       prefixIcon: prefixIcon,
//       hint: hintText,
//   //    iconWidget: const LoadingWidget(size: 40, strokeWidth: 2.5),
//     ) : DropDownField(
//       prefixIcon: prefixIcon,
//       hint: hintText,
//       texStyle:Theme.of(context).textTheme.labelSmall,
//       items: items,
//       onChanged: onChanged,
//       isValidator: isValidator,
//     );
//   }
// }

class DropDownItem {
  final String? id;
  final String? title;
  final String? value;
  final IconData? icon;
  final Widget? child;

  const DropDownItem({this.id, this.title, this.value, this.icon, this.child});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'icon': icon,
      'child': child,
    };
  }
}
