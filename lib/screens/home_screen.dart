import 'package:chat_app/pages/call_page.dart';
import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/messages_page.dart';
import 'package:chat_app/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: pages[0],
      bottomNavigationBar: _BottomNavigationBar(
        onValueSelected: (index) {
          print(index);
        },
      ),
    ));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onValueSelected,
  }) : super(key: key);

  final ValueChanged<int> onValueSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            index: 0,
            lable: 'Messages',
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            onTap: onValueSelected,
          ),
          _NavigationBarItem(
            index: 1,
            lable: 'Notifications',
            icon: CupertinoIcons.bell_solid,
            onTap: onValueSelected,
          ),
          _NavigationBarItem(
            index: 2,
            lable: 'Calls',
            icon: CupertinoIcons.phone_fill,
            onTap: onValueSelected,
          ),
          _NavigationBarItem(
            index: 3,
            lable: 'Contacts',
            icon: CupertinoIcons.person_2_fill,
            onTap: onValueSelected,
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.lable,
      required this.icon,
      required this.index,
      required this.onTap})
      : super(key: key);

  final ValueChanged<int> onTap;

  final int index;
  final String lable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 20),
          SizedBox(
            height: 8,
          ),
          Text(
            lable,
            style: TextStyle(fontSize: 11),
          ),
        ]),
      ),
    );
  }
}
