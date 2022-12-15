import 'package:ecommerce_php/features/account/profile/profile_screen.dart';
import 'package:ecommerce_php/features/product/display_products/products_screen.dart';
import 'package:ecommerce_php/features/user/favorites/favorites_screen.dart';
import 'package:ecommerce_php/features/user/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> screensList = [
  const ProductsScreen(),
  const FavoritesScreen(),
  const OrdersScreen(),
  ProfileScreen(),
];

const List<Map<String, dynamic>> navBtnPropsList = [
  {
    'active_icon': Icons.dashboard,
    'non_active_icon': Icons.dashboard_outlined,
    'label': 'Products',
  },
  {
    'active_icon': Icons.favorite,
    'non_active_icon': Icons.favorite_border,
    'label': 'Favorite',
  },
  {
    'active_icon': FontAwesomeIcons.boxOpen,
    'non_active_icon': FontAwesomeIcons.box,
    'label': 'Orders',
  },
  {
    'active_icon': Icons.person,
    'non_active_icon': Icons.person_outline,
    'label': 'Profile',
  },
];
