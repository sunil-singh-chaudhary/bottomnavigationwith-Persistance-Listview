import 'package:bottomnavigationbar_persistance/pages/accountpage.dart';
import 'package:bottomnavigationbar_persistance/pages/blog_plage.dart';
import 'package:bottomnavigationbar_persistance/pages/favourite_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var PageList = [BlogPage(), FavPage(), AccountPage()];
  PageController _pageController = PageController();

  void _onItemTab(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  var selectedIndex = 0;
  void _onpageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onpageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: PageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: (selectedIndex == 0) ? Colors.green : Colors.grey),
            label: "Blog",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color: (selectedIndex == 1) ? Colors.green : Colors.grey),
              label: "Fav"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: (selectedIndex == 2) ? Colors.green : Colors.grey),
              label: "Account")
        ],
      ),
    );
  }
}
