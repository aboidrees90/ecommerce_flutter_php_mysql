import 'package:ecommerce_php/controller/auth_controller.dart';
import 'package:ecommerce_php/ui/Home/bottom_app_bar_button.dart';
import 'package:ecommerce_php/ui/Home/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth auth = Get.put(Auth());
    final Rx indexNumber = 1.obs;
    final PageStorageBucket bucket = PageStorageBucket();

    return GetBuilder(
      init: Auth(),
      initState: (currentState) => auth,
      builder: (controller) {
        return SafeArea(
          bottom: false,
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white24,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: PageStorage(
                bucket: bucket,
                child: Obx(() => screensList[indexNumber.value]),
              ),
            ),
            floatingActionButton: auth.isAdmin
                ? FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black,
                    child: const Icon(Icons.add),
                    onPressed: () => indexNumber.value = 0,
                  )
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Obx(
              () => BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                color: Colors.black,
                elevation: 0,
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BottomAppBarItem(
                            index: 1,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 1,
                            activeIcon: navBtnPropsList[1]["active_icon"],
                            nonActiveIcon: navBtnPropsList[1]["non_active_icon"],
                            label: navBtnPropsList[1]["label"],
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.white38,
                          ),
                          BottomAppBarItem(
                            index: 2,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 2,
                            activeIcon: navBtnPropsList[2]["active_icon"],
                            nonActiveIcon: navBtnPropsList[2]["non_active_icon"],
                            label: navBtnPropsList[2]["label"],
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.white38,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BottomAppBarItem(
                            index: 3,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 3,
                            activeIcon: navBtnPropsList[3]["active_icon"],
                            nonActiveIcon: navBtnPropsList[3]["non_active_icon"],
                            label: navBtnPropsList[3]["label"],
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.white38,
                          ),
                          BottomAppBarItem(
                            index: 4,
                            currentIndex: indexNumber.value,
                            onTap: () => indexNumber.value = 4,
                            activeIcon: navBtnPropsList[4]["active_icon"],
                            nonActiveIcon: navBtnPropsList[4]["non_active_icon"],
                            label: navBtnPropsList[4]["label"],
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.white38,
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
