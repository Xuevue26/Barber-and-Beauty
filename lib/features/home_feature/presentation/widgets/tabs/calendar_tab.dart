import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/colors.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/dimens.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_elevated_button.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_light_text.dart';
import 'package:flutter/material.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Assets.images.user1.path,
      Assets.images.user2.path,
      Assets.images.user3.path,
      Assets.images.user4.path,
      Assets.images.user5.path,
      Assets.images.user1.path,
      Assets.images.user2.path,
      Assets.images.user3.path,
      Assets.images.user4.path,
      Assets.images.user5.path,
    ];
    final List<String> names = [
      'Emily Johnson',
      'Daniel Taylor',
      'Henry Rodriguez',
      'Amelia Young',
      'Samuel Hernandez',
      'Emily Johnson',
      'Daniel Taylor',
      'Henry Rodriguez',
      'Amelia Young',
      'Samuel Hernandez',
    ];
    final List<String> services = [
      'ຍອມສີຜົມ',
      'ນວດ',
      'ຕັດຜົມ',
      'ແຕ່ງຫນ້າ',
      'ເຮັດເລັບ',
      'ຍອມສີຜົມ',
      'ນວດ',
      'ຕັດຜົມ',
      'ແຕ່ງຫນ້າ',
      'ເຮັດເລັບ',
    ];
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (final context, final index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(Dimens.corners),
          ),
          padding: EdgeInsets.all(Dimens.largePadding),
          margin: EdgeInsets.symmetric(
            horizontal: index == 0 ? Dimens.largePadding : Dimens.padding,
            vertical: Dimens.padding,
          ),
          child: Row(
            spacing: Dimens.largePadding,
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
                  child: Image.asset(images[index], fit: BoxFit.fitHeight),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          names[index],
                          style: TextStyle(
                            fontFamily: FontFamily.aksharMedium,
                            fontSize: 16,
                          ),
                        ),
                        AppLightText(services[index]),
                      ],
                    ),
                    SizedBox(height: Dimens.largePadding),
                    Text(
                      '14 ກໍລະກົດ 2025 . 12 - 15',
                      style: TextStyle(
                        fontFamily: FontFamily.aksharMedium,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: Dimens.smallPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        AppElevatedButton(onPressed: () {}, title: 'ເພີ່ມເຕີມ'),
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
