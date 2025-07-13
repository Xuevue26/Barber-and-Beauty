import 'package:barber_and_beauty_salon_booking_app/core/gen/fonts.gen.dart';
import 'package:barber_and_beauty_salon_booking_app/core/theme/colors.dart';
import 'package:barber_and_beauty_salon_booking_app/features/home_feature/presentation/screens/home_screen.dart';
import 'package:barber_and_beauty_salon_booking_app/features/auth/login_page.dart'; // 👈 เพิ่มตรงนี้
import 'package:firebase_auth/firebase_auth.dart'; // 👈 เพิ่มตรงนี้
import 'package:firebase_core/firebase_core.dart'; // 👈 เพิ่มตรงนี้
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 👈 ต้องรันก่อนใช้ Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber and beauty salon booking app',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ),
        fontFamily: FontFamily.aksharLight,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          titleTextStyle: TextStyle(
            fontFamily: FontFamily.aksharBold,
            color: AppColors.blackColor,
            fontSize: 18,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(elevation: 0),
        scaffoldBackgroundColor: AppColors.whiteColor,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData) {
            return const HomeScreen(); // ✅ ถ้า login แล้ว
          } else {
            return const LoginPage(); // ✅ ถ้ายังไม่ได้ login
          }
        },
      ),
    );
  }
}
