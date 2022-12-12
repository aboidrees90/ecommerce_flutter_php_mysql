import 'package:ecommerce_php/core/constants/routes.dart';
import 'package:ecommerce_php/ui/Home/home_screen.dart';
import 'package:ecommerce_php/ui/admin/authentication/admin_sign_in_screen.dart';
import 'package:ecommerce_php/ui/user/authentication/sign_in_screen.dart';
import 'package:ecommerce_php/ui/user/authentication/sign_up_screen.dart';
import 'package:ecommerce_php/ui/user/product_details/product_details_screen.dart';
import 'package:get/route_manager.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
  GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),
  GetPage(name: AppRoutes.adminSignIn, page: () => AdminSignInScreen()),

  //
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  GetPage(name: AppRoutes.productDetails, page: () => ProductDetailsScreen()),
];
