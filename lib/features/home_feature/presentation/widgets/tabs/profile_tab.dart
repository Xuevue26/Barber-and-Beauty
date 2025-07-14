import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/colors.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_elevated_button.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_light_text.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_list_tile.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/user_profile_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName ?? 'No Name';
    final email = user?.email ?? 'No Email';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          UserProfileImageWidget(width: 150, height: 150),
          const SizedBox(height: 16),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.aksharBold,
                ),
              ),
              AppLightText(email),
            ],
          ),
          const SizedBox(height: 16),
          AppElevatedButton(title: 'ແກ້ໄຂໂປຣໄຟລ໌', onPressed: () {}),
          AppListTile(
            onTap: () {},
            title: 'ວິທີການຊຳລະເງິນ',
            leadingIconPath: Assets.icons.cardPos,
          ),
          AppListTile(
            onTap: () {},
            title: 'ພາສາ',
            leadingIconPath: Assets.icons.language,
          ),
          AppListTile(
            onTap: () {},
            title: 'ການແຈ້ງເຕືອນ',
            leadingIconPath: Assets.icons.notification,
            trailing: Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: true,
                onChanged: (final value) {},
                activeTrackColor: AppColors.primaryColor,
              ),
            ),
          ),
          AppListTile(
            onTap: () {},
            title: 'ໂໝດມືດ',
            leadingIconPath: Assets.icons.moon,
            trailing: Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: false,
                onChanged: (final value) {},
                activeTrackColor: AppColors.primaryColor,
              ),
            ),
          ),
          AppListTile(
            onTap: () {},
            title: 'ຊ່ວຍເຫຼືອແລະສະໜັບສະໜູນ',
            leadingIconPath: Assets.icons.info,
          ),

          // Logout signOut
          AppListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              // ไม่ต้อง Navigator เพราะ main.dart ใช้ StreamBuilder ฟังการเปลี่ยนแปลงสถานะ login อยู่แล้ว
            },
            title: 'ອອກຈາກລະບົບ',
            leadingIconPath: Assets.icons.logout,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
