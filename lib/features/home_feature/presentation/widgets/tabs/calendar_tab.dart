import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/colors.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/dimens.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_elevated_button.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_light_text.dart';
import 'package:flutter/material.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  // ฟังก์ชันแปลงชื่อรูปเป็น path ภาพ assets
  String getUserImage(String key) {
    switch (key) {
      case 'user1':
        return Assets.images.user1.path;
      case 'user2':
        return Assets.images.user2.path;
      case 'user3':
        return Assets.images.user3.path;
      case 'user4':
        return Assets.images.user4.path;
      case 'user5':
        return Assets.images.user5.path;
      default:
        return Assets.images.user1.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bookings = [
      {
        'name': 'Emily Johnson',
        'service': 'ຍອມສີຜົມ',
        'image': 'user1',
      },
      {
        'name': 'Daniel Taylor',
        'service': 'ນວດ',
        'image': 'user2',
      },
      {
        'name': 'Henry Rodriguez',
        'service': 'ຕັດຜົມ',
        'image': 'user3',
      },
      {
        'name': 'Amelia Young',
        'service': 'ແຕ່ງຫນ້າ',
        'image': 'user4',
      },
      {
        'name': 'Samuel Hernandez',
        'service': 'ເຮັດເລັບ',
        'image': 'user5',
      },
    ];

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];

        return Container(
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(Dimens.corners),
          ),
          padding: EdgeInsets.all(Dimens.largePadding),
          margin: EdgeInsets.symmetric(
            horizontal: Dimens.largePadding,
            vertical: Dimens.padding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  color: AppColors.primaryColor,
                ),
                padding: EdgeInsets.only(top: Dimens.padding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.corners),
                  child: Image.asset(
                    getUserImage(booking['image'] ?? 'user1'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(width: Dimens.largePadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          booking['name'] ?? '',
                          style: const TextStyle(
                            fontFamily: FontFamily.aksharMedium,
                            fontSize: 16,
                          ),
                        ),
                        AppLightText(booking['service'] ?? ''),
                      ],
                    ),
                    const SizedBox(height: Dimens.largePadding),
                    const Text(
                      '14 ກໍລະກົດ 2025 . 12 - 15',
                      style: TextStyle(
                        fontFamily: FontFamily.aksharMedium,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: Dimens.smallPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              '\K40.000',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: FontFamily.aksharMedium,
                              ),
                            ),
                            Text('/ຄົນ', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        AppElevatedButton(
                          onPressed: () {},
                          title: 'ເພີ່ມເຕີມ',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
