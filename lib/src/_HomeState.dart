import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeMain> {
  int _currentIndex = 0;
  final List<Widget> _children = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const<Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue
              ), child:Text("Drawer Header",style: TextStyle(
                color: Colors.red,fontSize: 24
            ),
            ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Message"),
            )

          ],
        ),
      ),

      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const<BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/image/order.png')),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/image/notification.png')),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/image/profile.png')),
            label: 'Profile',
          ),

        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,

      ),

    );

  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}