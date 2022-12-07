import 'package:ecommerce_php/ui/favorites/favorites_screen.dart';
import 'package:ecommerce_php/ui/home/home_screen.dart';
import 'package:ecommerce_php/ui/orders/orders_screen.dart';
import 'package:ecommerce_php/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> screensList = [
  const HomeScreen(),
  const FavoritesScreen(),
  const OrdersScreen(),
  ProfileScreen(),
];

const List<Map<String, dynamic>> navBtnPropsList = [
  {
    'active_icon': Icons.home,
    'non_active_icon': Icons.home_outlined,
    'label': 'home',
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
