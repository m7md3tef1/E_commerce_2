import 'package:flutter/material.dart';
import 'package:untitled1/data/cacheHelper.dart';
import 'package:untitled1/presentation/Modules/Account%20Info.dart';
import 'package:untitled1/presentation/Modules/AddressInfoScreen.dart';
import 'package:untitled1/presentation/Modules/BMRScreen.dart';
import 'package:untitled1/presentation/Modules/ChangeEmail.dart';
import 'package:untitled1/presentation/Modules/ChangePassword.dart';
import 'package:untitled1/presentation/Modules/DeleteProduct.dart';
import 'package:untitled1/presentation/Modules/Favscreen.dart';
import 'package:untitled1/presentation/Modules/HomeScreen.dart';
import 'package:untitled1/presentation/Modules/IntroductionScreen.dart';
import 'package:untitled1/presentation/Modules/MyOrders.dart';
import 'package:untitled1/presentation/Modules/OrderDetails.dart';
import 'package:untitled1/presentation/Modules/OtbPhoneScreen.dart';
import 'package:untitled1/presentation/Modules/SettingScreen.dart';
import 'package:untitled1/presentation/Modules/SignInScreen.dart';
import 'package:untitled1/presentation/Modules/SignWithPhone.dart';
import 'package:untitled1/presentation/Modules/SignupScreen.dart';
import 'package:untitled1/presentation/Modules/mapScreen.dart';
import 'package:untitled1/presentation/Modules/splash.dart';
import 'constant/Screens.dart';


class AppRoute {
  Route? onGenerateRoute(RouteSettings? routeSettings) {
    switch (routeSettings!.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          bool onBoard = CacheHelper.getkey('onBoarding');
          if (onBoard){
            return const SplashScreen(
              nextScreen: SigninScreen(),
            );
          }
          else{
            return SplashScreen(
              nextScreen: IntroScreen(),
            );
          }
        });
      case introPath:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case signinPath:
        return MaterialPageRoute(builder: (_) =>const SigninScreen());
      case signwithphone:
        return MaterialPageRoute(builder: (_) => SignWithPhone());
      case signupPath:
        return MaterialPageRoute(builder: (_) =>const SignupScreen());
      case HomeScreenPath:
        return MaterialPageRoute(builder: (_) =>const HomeScreen());
      case OtbPhoneScreenPath:
        return MaterialPageRoute(builder: (_)=>const OtpPhoneScreen());
      case MapScreenPath:
        return MaterialPageRoute(builder: (_)=>const MapScreen());
      case FavScreenPath:
        return MaterialPageRoute(builder: (_)=>const FavScreen());
      case OrderDetailsPath:
        return MaterialPageRoute(builder: (_)=>  OrderDetails());
      case SettingScreenPath:
        return MaterialPageRoute(builder: (_)=>const SettingScreen());
      case AccontInfoPath:
        return MaterialPageRoute(builder: (_)=>const AccountInfoScreen());
      case AddressInfoPath:
        return MaterialPageRoute(builder: (_)=>const AddressDetailsScreen());
      case BMRScreenPath:
        return MaterialPageRoute(builder: (_)=>const BMRScreen());
      case ChangeEmailPath:
        return MaterialPageRoute(builder: (_)=>const ChangeEmail());
      case ChangePasswordPath:
        return MaterialPageRoute(builder: (_)=>const ChangePassword());
      case MyOrdersPath:
        return MaterialPageRoute(builder: (_)=>const MyOrdersScreen());
      case DeleteProductScreenPath:
        return MaterialPageRoute(builder: (_)=>const DeleteProductScreen());
    }
  }
}
