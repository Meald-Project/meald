import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({ Key? key }) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  void _onHomeTap() {
    print('Home icon tapped!');
    // Navigate to the home screen or perform any action
  }

  void _onListTap() {
    print('List icon tapped!');
    // Navigate to the list screen or perform any action
  }

  void _onAddTap() {
    print('Add icon tapped!');
    // Open add item dialog or perform any action
  }

  void _onNotifTap() {
    print('Notification icon tapped!');
    // Navigate to notifications screen or perform any action
  }

  void _onProfileTap() {
    print('Profile icon tapped!');
    // Navigate to profile screen or perform any action
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: _onHomeTap,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/home.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: _onListTap,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/list.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: _onAddTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(49, 255, 70, 3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(203, 255, 70, 3),
                  width: 4,
                ),
              ),
              child: Image.asset(
                'assets/add.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: _onNotifTap,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/notif.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: _onProfileTap,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'assets/profile.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
