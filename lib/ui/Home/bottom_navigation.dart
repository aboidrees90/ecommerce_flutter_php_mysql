import 'package:ecommerce_php/ui/admin/upload_items/new_product_screen.dart';
import 'package:ecommerce_php/ui/user/favorites/favorites_screen.dart';
import 'package:ecommerce_php/ui/user/orders/orders_screen.dart';
import 'package:ecommerce_php/ui/user/products/products_screen.dart';
import 'package:ecommerce_php/ui/user/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> userScreensList = [
  ProductsScreen(),
  const FavoritesScreen(),
  const OrdersScreen(),
  ProfileScreen(),
];

const List<Map<String, dynamic>> userNavBtnPropsList = [
  {
    'active_icon': Icons.shopping_cart,
    'non_active_icon': Icons.shopping_cart_outlined,
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

List<Widget> adminScreensList = [
  NewProductScreen(),
  ProfileScreen(),
];

const List<Map<String, dynamic>> adminNavBtnPropsList = [
  {
    'active_icon': Icons.shopping_cart,
    'non_active_icon': Icons.shopping_cart_outlined,
    'label': 'Upload Items',
  },
  {
    'active_icon': Icons.person,
    'non_active_icon': Icons.person_outline,
    'label': 'Profile',
  },
];
