import 'package:flutter/material.dart';
import 'package:instagram_application/screens/activity_screen.dart';
import 'package:instagram_application/screens/add_content_screen.dart';
import 'package:instagram_application/screens/home_screen.dart';
import 'package:instagram_application/screens/search_screen.dart';
import 'package:instagram_application/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff1C1F2E),
            currentIndex: _selectedBottomNavigationItem,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            // selectedFontSize: 20,
            // selectedIconTheme: IconThemeData(color: Colors.red),
            // selectedItemColor: Colors.red,
            // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

            // //
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_active_home.png'),
                label: 'item1',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: 'item2',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: 'item3',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: 'item4',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xffC5C5C5),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/ben2.jpg'),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xffF35383),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/ben2.jpg'),
                    ),
                  ),
                ),
                label: 'item4',
              ),
            ],
          ),
        ),
      ),
      // body: getLayOut().elementAt(_selectedBottomNavigationItem)
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayOut(),
      ),
    );
  }

  List<Widget> getLayOut() {
    return <Widget>[
      HomeScreeen(),
      const SearchScreen(),
      const AddContentScreen(),
      const ActivityScreen(),
      const UserProfileScreen(),
    ];
  }
}
