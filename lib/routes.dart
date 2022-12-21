import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/Home/home_screen.dart';
import 'package:ecommerce_php/features/account/authentication/sign_in_screen.dart';
import 'package:ecommerce_php/features/account/authentication/sign_up_screen.dart';
import 'package:ecommerce_php/features/cart/cart_list_screen.dart';
import 'package:ecommerce_php/features/orders/order_now_screen.dart';
import 'package:ecommerce_php/features/product/new_product/new_product_screen.dart';
import 'package:ecommerce_php/features/product/product_details/product_details_screen.dart';
import 'package:get/route_manager.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
  GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),

  //
  GetPage(name: AppRoutes.newProduct, page: () => const NewProductScreen()),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),

  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetailsScreen()),
  GetPage(name: AppRoutes.cart, page: () => const CartListScreen()),

  GetPage(name: AppRoutes.orderNow, page: () => OrderNowScreen()),
];
