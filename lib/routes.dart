import 'package:ecommerce_php/constants/routes.dart';
import 'package:ecommerce_php/ui/admin/upload_items/upload_items_screen.dart';
import 'package:ecommerce_php/ui/authentication/admin_signIn_screen.dart';
import 'package:ecommerce_php/ui/authentication/authentication.dart';
import 'package:ecommerce_php/ui/dashboard/dashboard_screen.dart';
import 'package:get/route_manager.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
  GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),
  GetPage(name: AppRoutes.userDashboard, page: () => DashboardScreen()),
  GetPage(name: AppRoutes.adminSignIn, page: () => AdminSignInScreen()),
  GetPage(name: AppRoutes.uploadItems, page: () => const UploadItems()),
  GetPage(name: AppRoutes.adminDashboard, page: () => DashboardScreen()),
];
