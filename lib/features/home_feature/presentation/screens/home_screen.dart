import 'package:barber_and_beauty_salon_booking_app/core/gen/assets.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_scaffold.dart';
import 'package:barber_and_beauty_salon_booking_app/core/widgets/app_svg_viewer.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/widgets/home_app_bar.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/widgets/tabs/calendar_tab.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/widgets/tabs/home_tab.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/widgets/tabs/profile_tab.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/widgets/tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;

  const HomeScreen({super.key, this.initialIndex = 0}); // 👈 default = 0

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  final List<Widget> _tabs = [
    const HomeTab(),
    const SearchTab(),
    const CalendarTab(),
    const ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // 👈 ตั้งค่าเริ่มต้นจาก constructor
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: _tabs[_currentIndex],
      appBar: _currentIndex == 0
          ? HomeAppBar()
          : _currentIndex == 2
          ? AppBar(title: const Text('ປະຫວັດການຈອງ'))
          : null,
      padding: EdgeInsets.zero,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(30),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (int index) => setState(() => _currentIndex = index),
          items: [
            bottomBarItem(
              iconPath: Assets.icons.home,
              title: 'ໜ້າຫຼັກ',
              isSelected: _currentIndex == 0,
            ),
            bottomBarItem(
              iconPath: Assets.icons.searchNormal,
              title: 'ຄົ້ນຫາ',
              isSelected: _currentIndex == 1,
            ),
            bottomBarItem(
              iconPath: Assets.icons.calendar,
              title: 'ປະຫວັດ',
              isSelected: _currentIndex == 2,
            ),
            bottomBarItem(
              iconPath: Assets.icons.user,
              title: 'ໂປຣໄຟລ໌',
              isSelected: _currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  SalomonBottomBarItem bottomBarItem({
    required final String iconPath,
    required final String title,
    required final bool isSelected,
  }) =>
      SalomonBottomBarItem(
        icon: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(4),
          child: Center(
            child: AppSvgViewer(
              iconPath,
              color: isSelected ? Colors.deepOrange : Colors.black,
              width: 18,
            ),
          ),
        ),
        title: Text(title),
        selectedColor: Colors.deepOrange,
      );
}
