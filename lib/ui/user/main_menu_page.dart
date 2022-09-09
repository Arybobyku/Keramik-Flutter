import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keramik/helper/color_palette.dart';
import 'package:keramik/helper/constants.dart';
import 'package:keramik/provider/keramik.dart';
import 'package:keramik/service/notification.dart';
import 'package:keramik/ui/user/form/user_form_page.dart';
import 'package:keramik/ui/user/home/user_home_page.dart';
import 'package:keramik/ui/user/profile/user_profile_page.dart';
import 'package:keramik/ui/user/riwayat/user_riwayat_page.dart';
import 'package:provider/provider.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);


  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;
  bool getData = true;

  @override
  void initState() {
    if(getData){
      Provider.of<KeramikProvider>(context, listen: false).doGetAllKeramik();
      getData = false;



    }
    super.initState();
  }



  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pageption = <Widget>[
    UserHomePage(),
    UserFormPage(),
    UserProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.generalPrimaryColor,
        selectedItemColor: ColorPalette.generalWhite,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          _onItemTap(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview_rounded),
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
      body: SafeArea(
        child: _pageption[_selectedIndex],
      ),
    );
  }
}
