import 'package:ecommerce_php/controller/auth.dart';
import 'package:ecommerce_php/ui/dashboard/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final Auth _auth = Get.put(Auth());

  final Rx _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    _auth.loadCachedUserInfo();

    return GetBuilder(
      init: Auth(),
      initState: (currentState) => _auth,
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 27, 27, 27),
            body: Obx(() => screensList[_indexNumber.value]),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                currentIndex: _indexNumber.value,
                onTap: (value) => _indexNumber.value = value,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white24,
                items: List.generate(4, (index) {
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
