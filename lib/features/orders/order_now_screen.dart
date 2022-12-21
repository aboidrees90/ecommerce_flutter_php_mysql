import 'dart:developer';

import 'package:ecommerce_php/features/cart/cart_list_controller.dart';
import 'package:ecommerce_php/features/orders/order_now_controller.dart';
import 'package:ecommerce_php/features/product/product_details/widget/selectable_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderNowScreen extends StatelessWidget {
  final orderNowController = Get.put(OrderNowController());
  final controller = Get.find<CartListController>();
  final List<String> deliverySysList = ['QPost', 'DHL', 'FedX', 'UPS'];
  final List<String> paymentSysList = ['Apple Pay', 'Google Pay', 'COD'];
  OrderNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(controller.selectedItemsInCartList.toString());
    log(controller.cartList.toString());
    log(controller.total.toString());

    //
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: AppBar(),
          ),
        ),
        body: Container(
          color: Get.theme.colorScheme.primaryContainer,
          child: ListView(
            children: [
              //delivery system
              Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableTile(
                  width: (Get.size.width - 24) / 5,
                  items: deliverySysList,
                  itemFontSize: 16,
                  onPress: orderNowController.setDeliverySys,
                  label: "Delivery System",
                ),
              ),
              //payment system
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableTile(
                  width: (Get.size.width - 24) / 3.5,
                  items: paymentSysList,
                  itemFontSize: 16,
                  onPress: orderNowController.setPaymentSys,
                  label: "Payment System",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
