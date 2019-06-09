import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_bar_code/pages/Favorite.dart';
import 'package:qr_bar_code/pages/History.dart';
import 'package:qr_bar_code/pages/Setting.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedTabIndex = 0;

  _selectedTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR BarCode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Barcode'),
        ),
        body: [
          History(),
          Favorite(),
          Setting(),
        ].elementAt(_selectedTabIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text('Favorite'),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              backgroundColor: Colors.deepPurple,
            ),
          ],
          onTap: _selectedTabChanged,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.photo_camera),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
