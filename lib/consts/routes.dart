import 'package:flutter/material.dart';
import 'package:hekkathon/model/hotel_model.dart';
import 'package:hekkathon/model/room_model.dart';
import 'package:hekkathon/screens/check_out_screen.dart';
import 'package:hekkathon/screens/detail_hotel_screen.dart';
import 'package:hekkathon/screens/guest_and_room_booking_screen.dart';
import 'package:hekkathon/screens/hotel_booking_screen.dart';
import 'package:hekkathon/screens/hotel_screen.dart';
import 'package:hekkathon/screens/intro_screen.dart';
import 'package:hekkathon/screens/main_screen.dart';
import 'package:hekkathon/screens/rooms_screen.dart';
import 'package:hekkathon/screens/select_date_screen.dart';
import 'package:hekkathon/screens/splash_screen.dart';
import 'package:hekkathon/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) => GuestAndRoomBookingScreen(),
  RoomsScreen.routeName: (context) => RoomsScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailHotelScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => DetailHotelScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
