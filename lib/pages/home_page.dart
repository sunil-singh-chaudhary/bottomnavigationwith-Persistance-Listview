import 'package:bottomnavigationbar_persistance/controller/navController.dart';
import 'package:bottomnavigationbar_persistance/pages/accountpage.dart';
import 'package:bottomnavigationbar_persistance/pages/blog_plage.dart';
import 'package:bottomnavigationbar_persistance/pages/favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var PageList = [BlogPage(), FavPage(), AccountPage()];
  var _pageController = PageController();
  var controller_nav = Get.put(NavController());

  void _onItemTab(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    controller_nav.SetIndexis(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: controller_nav.index,
        physics: const AlwaysScrollableScrollPhysics(),
        children: PageList,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: _onItemTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color:
                      (controller_nav.index == 0) ? Colors.blue : Colors.grey),
              label: "Blog",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                    color: (controller_nav.index == 1)
                        ? Colors.blue
                        : Colors.grey),
                label: "Fav"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: (controller_nav.index == 2)
                        ? Colors.blue
                        : Colors.grey),
                label: "Account")
          ],
        ),
      ),
    );
  }
}
