import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/dimens.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_bordered_icon_button.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_svg_viewer.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/user_profile_image_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? 'No Name';

    return Padding(
      padding: const EdgeInsets.only(top: Dimens.padding),
      child: AppBar(
        actions: [AppBorderedIconButton(iconPath: Assets.icons.notification)],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontFamily: FontFamily.aksharLight,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                AppSvgViewer(Assets.icons.location, width: 18),
                const SizedBox(width: 4),
                Text(
                  'Vientiane',
                  style: TextStyle(
                    fontFamily: FontFamily.aksharMedium,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: UserProfileImageWidget(),
        leadingWidth: 85,
        titleSpacing: Dimens.padding,
        actionsPadding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + 16.0);
}
