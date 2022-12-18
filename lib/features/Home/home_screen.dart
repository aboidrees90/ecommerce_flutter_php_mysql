import 'package:ecommerce_php/core/constants/routes_names.dart';
import 'package:ecommerce_php/features/Home/bottom_app_bar_button.dart';
import 'package:ecommerce_php/features/Home/bottom_navigation.dart';
import 'package:ecommerce_php/features/account/authentication/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Auth auth = Get.put(Auth());
  final Rx indexNumber = 0.obs;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Get.theme.colorScheme;

    return GetBuilder(
      init: Auth(),
      initState: (currentState) => auth,
      builder: (controller) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.black,
            body: Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PageStorage(
                  bucket: bucket,
                  child: Obx(() => screensList[indexNumber.value]),
                ),
              ),
            ),
            floatingActionButton: auth.isAdmin
                ? FloatingActionButton(
                    tooltip: "Add New Item",
                    shape: const CircleBorder(),
                    // backgroundColor: Colors.black,
                    child: Icon(Icons.add, color: colorScheme.primary),
                    onPressed: () => Get.toNamed(AppRoutes.newProduct),
                  )
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(
              () => BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                elevation: 5,
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BottomAppBarItem(
                            index: 0,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 0,
                            activeIcon: navBtnPropsList[0]["active_icon"],
                            nonActiveIcon: navBtnPropsList[0]["non_active_icon"],
                            label: navBtnPropsList[0]["label"],
                            selectedColor: colorScheme.primary,
                            unSelectedColor: colorScheme.onSecondary,
                          ),
                          BottomAppBarItem(
                            index: 1,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 1,
                            activeIcon: navBtnPropsList[1]["active_icon"],
                            nonActiveIcon: navBtnPropsList[1]["non_active_icon"],
                            label: navBtnPropsList[1]["label"],
                            selectedColor: colorScheme.primary,
                            unSelectedColor: colorScheme.onSecondary,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BottomAppBarItem(
                            index: 2,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 2,
                            activeIcon: navBtnPropsList[2]["active_icon"],
                            nonActiveIcon: navBtnPropsList[2]["non_active_icon"],
                            label: navBtnPropsList[2]["label"],
                            selectedColor: colorScheme.primary,
                            unSelectedColor: colorScheme.onSecondary,
                          ),
                          BottomAppBarItem(
                            index: 3,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 3,
                            activeIcon: navBtnPropsList[3]["active_icon"],
                            nonActiveIcon: navBtnPropsList[3]["non_active_icon"],
                            label: navBtnPropsList[3]["label"],
                            selectedColor: colorScheme.primary,
                            unSelectedColor: colorScheme.onSecondary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
