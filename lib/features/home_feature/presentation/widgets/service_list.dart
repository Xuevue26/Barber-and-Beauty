import 'package:flutter/material.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/colors.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/dimens.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_light_text.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_svg_viewer.dart';
import 'package:barber_and_beauty_salon_booking_app/features/booking/booking_page.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Assets.images.hairStyle.path,
      Assets.images.hairCut.path,
      Assets.images.washingHair.path,
      Assets.images.womenHairStyle.path,
      Assets.images.hairStyle.path,
      Assets.images.hairCut.path,
      Assets.images.washingHair.path,
      Assets.images.womenHairStyle.path,
    ];
    final List<String> titles = [
      "ໂກນໜວດຜູ້ຊາຍ",
      "ຕັດຜົມຂອງຜູ້ຍິງ",
      "ສະຫົວ",
      "ລອນຜົມ",
      "ໂກນໜວດຜູ້ຊາຍ",
      "ຕັດຜົມຂອງຜູ້ຍິງ",
      "ສະຫົວ",
      "ລອນຜົມ",
    ];
    final List<String> addresses = [
      "8th DongDok,Vientiane,",
      "6th ThatLuag,Vientiane, ",
      "9th PhonTong,Vientiane,",
      "5th Sivilay,Vientiane,",
      "8th Tunmisay, Vientiane,",
      "6th DongDok,Vientiane,",
      "8th ThatLuag,Vientiane,",
      "5th PhonTong,Vientiane,",
    ];

    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemCount: titles.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingPage(selectedService: titles[index]),
                ),
              );
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(Dimens.corners),
              ),
              padding: EdgeInsets.all(Dimens.padding),
              margin: EdgeInsets.symmetric(
                horizontal: index == 0 ? Dimens.largePadding : Dimens.padding,
                vertical: Dimens.padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 182,
                    height: 114,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.corners),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: Dimens.padding),
                  Text(
                    titles[index],
                    style: const TextStyle(fontFamily: FontFamily.aksharMedium),
                  ),
                  AppLightText(addresses[index]),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppLightText('286 Reviews'),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(Dimens.corners),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: AppSvgViewer(
                          Assets.icons.arrowRight,
                          color: AppColors.whiteColor,
                          width: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
