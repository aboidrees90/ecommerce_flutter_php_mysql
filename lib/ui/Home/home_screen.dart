import 'package:ecommerce_php/controller/auth.dart';
import 'package:ecommerce_php/ui/Home/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Auth _auth = Get.put(Auth());

  final Rx _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Auth(),
      initState: (currentState) => _auth,
      builder: (controller) {
        var screenList = controller.isAdmin ? adminScreensList : userScreensList;
        var navBtnPropsList = controller.isAdmin ? adminNavBtnPropsList : userNavBtnPropsList;

        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 27, 27, 27),
            body: Obx(() => screenList[_indexNumber.value]),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                currentIndex: _indexNumber.value,
                onTap: (value) => _indexNumber.value = value,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white24,
                items: List.generate(screenList.length, (index) {
                  var navBtnProps = navBtnPropsList[index];
                  return BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(navBtnProps['non_active_icon']),
                    activeIcon: Icon(navBtnProps['active_icon']),
                    label: navBtnProps['label'],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
