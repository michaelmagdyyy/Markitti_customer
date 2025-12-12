import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'extensions.dart';

class AppThemes {

  static const mainColor = Color(0xff38498D);
  static const blackColor = Color(0xff101010);
  static const greyColor = Color(0xffBDC1DF);
  static const secondaryColor = Color(0xff7A36CA);
  static const whiteColor = Color(0xffFFFFFF);
  static const greenColor = Color(0xff15B097);
  static const redColor = Color(0xffE04343);
  static const borderColor = Color(0xffD3D3DD);
  static const scaffoldBg = Color(0xffffffff);
  static const yellowColor = Color(0xffE9BA11);
  // static const primaryContainer = Color(0xffFCFAF5);
  // static const secondaryContainer = Color(0xffF4FCFA);
  // static const disabledColor = Color(0xffF1F1F1);
  static const focusColor = Color(0xffB61AA5);
  // static const highlightColor = Color(0xff0B8AC1);

  static ThemeData get lightTheme => ThemeData(
        indicatorColor: greenColor,
        primaryColor: mainColor,
        focusColor: focusColor,
        hoverColor: yellowColor,
        // highlightColor: highlightColor,
        splashColor: secondaryColor,
        scaffoldBackgroundColor: scaffoldBg,
        textTheme: arabicTextTheme,
        // hoverColor: borderColor,
        fontFamily: FontFamily.montserrat,
        hintColor: greyColor,
        primaryColorLight: Colors.white,
        primaryColorDark: blackColor,
        dialogTheme: DialogThemeData(
          elevation: 0,
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        disabledColor: whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: secondaryColor,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: whiteColor,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontFamily: FontFamily.montserrat,
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: whiteColor,
          selectedItemColor: mainColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          // selectedLabelStyle: const TextStyle(color: Colors.white),
          // unselectedLabelStyle: TextStyle(color: "#AED489".color),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: "#CBD1DB".color),
          unselectedItemColor: "#CBD1DB".color,
          enableFeedback: true,
        ),
        radioTheme: RadioThemeData(fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return secondaryColor;
          } else {
            return secondaryColor;
          }
        })),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000),
            borderSide: BorderSide.none,
          ),
          iconSize: 24.h,
          backgroundColor: mainColor,
          elevation: 1,
        ),
        colorScheme: ColorScheme.light(
          primaryContainer: '#F1F1F1'.color,
          secondary: secondaryColor,
          primary: mainColor,
          error: redColor,
        ),
        timePickerTheme: const TimePickerThemeData(
          elevation: 0,
          dialHandColor: mainColor,
          dialTextColor: Colors.black,
          backgroundColor: Colors.white,
          hourMinuteColor: whiteColor,
          dayPeriodTextColor: Colors.black,
          entryModeIconColor: Colors.transparent,
          dialBackgroundColor: whiteColor,
          hourMinuteTextColor: Colors.black,
          dayPeriodBorderSide: BorderSide(color: mainColor),
        ),
        dividerTheme: const DividerThemeData(color: borderColor),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: const TextStyle(
              fontFamily: FontFamily.montserrat, fontSize: 14, fontWeight: FontWeight.w400),
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: mainColor,
            fillColor: whiteColor,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: whiteColor),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.montserrat,
              color: greyColor,
              fontWeight: FontWeight.w400),
          hintStyle: const TextStyle(
              fontSize: 12,
              fontFamily: FontFamily.montserrat,
              color: greyColor,
              fontWeight: FontWeight.w400),
          fillColor: whiteColor,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color:borderColor ),
              borderRadius: BorderRadius.circular(10.r)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: redColor),
              borderRadius: BorderRadius.circular(10.r)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.r)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color:borderColor),
              borderRadius: BorderRadius.circular(10.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10.r)),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
              borderSide: BorderSide.none),
        ),
      );
  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    indicatorColor: greenColor,
    primaryColor: mainColor,
    focusColor: focusColor,
    hoverColor: yellowColor,
    splashColor: secondaryColor,
    scaffoldBackgroundColor: Colors.black, // Dark background
    textTheme: arabicTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    fontFamily: FontFamily.montserrat,
    hintColor: Colors.grey[400],
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    dialogTheme: DialogThemeData(
      elevation: 0,
      backgroundColor: const Color(0xFF1E1E1E),
      insetPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    ),
    disabledColor: Colors.grey[600],
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF1E1E1E),
      selectedItemColor: mainColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(color: mainColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey[500]!),
      unselectedItemColor: Colors.grey[500],
      enableFeedback: true,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(mainColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1000),
        borderSide: BorderSide.none,
      ),
      iconSize: 24.h,
      backgroundColor: mainColor,
      elevation: 1,
    ),
    colorScheme: ColorScheme.dark(
      primaryContainer: const Color(0xFF2C2C2C),
      secondary: secondaryColor,
      primary: mainColor,
      error: redColor,
    ),
    timePickerTheme: const TimePickerThemeData(
      elevation: 0,
      dialHandColor: mainColor,
      dialTextColor: Colors.white,
      backgroundColor: Color(0xFF1E1E1E),
      hourMinuteColor: Color(0xFF2C2C2C),
      dayPeriodTextColor: Colors.white,
      entryModeIconColor: Colors.transparent,
      dialBackgroundColor: Color(0xFF2C2C2C),
      hourMinuteTextColor: Colors.white,
      dayPeriodBorderSide: BorderSide(color: mainColor),
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        fontFamily: FontFamily.montserrat,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: mainColor,
        fillColor: const Color(0xFF2C2C2C),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontFamily: FontFamily.montserrat,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: const TextStyle(
        fontSize: 12,
        fontFamily: FontFamily.montserrat,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      fillColor: const Color(0xFF2C2C2C),
      filled: true,
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(10.r)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: redColor),
          borderRadius: BorderRadius.circular(10.r)),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(10.r)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static TextTheme get arabicTextTheme => const TextTheme(
        labelLarge: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
      );
}
