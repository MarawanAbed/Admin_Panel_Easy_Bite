import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/core/extensions/extensions.dart';
import 'package:admin/core/routes/navigator.dart';
import 'package:admin/core/routes/routes.dart';
import 'package:admin/core/utils/helper_methods.dart';
import 'package:admin/core/widgets/images/image_network.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        const Spacer(),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: FutureBuilder(
        future: HelperMethods.getProfile(),
        builder: (context, snapshot) {
          return Row(
            children: [
              ImageNetworkCircle(
                image: snapshot.data?.image ?? '',
                height: 38,
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Text(snapshot.data?.userName ?? ''),
                ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await HelperMethods.removeProfile();
                  Navigators.pushNamedAndRemoveUntil(Routes.loginPage);
                },
              )
            ],
          );
        }
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: context.cardColor,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
