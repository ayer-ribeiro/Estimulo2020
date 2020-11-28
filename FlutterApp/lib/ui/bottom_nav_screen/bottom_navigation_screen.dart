import 'package:estimulo2020/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:estimulo2020/ui/home/home.dart';
import 'package:estimulo2020/ui/mentoria/inicio_mentoria.dart';
import 'package:estimulo2020/ui/trilha/inicio_trilha.dart';
import 'package:estimulo2020/ui/acompanhamento/inicio_acompanhamento.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryIconColor,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        buildNavItem(Icons.home, 'Home', 0),
        //buildNavItem(Icons.supervised_user_circle, 'Mentoria', 1),
        buildNavItem(Icons.supervisor_account, 'Mentoria', 1),
        buildNavItem(Icons.ondemand_video, 'Trilha', 2),
        buildNavItem(Icons.library_books, 'Feedback', 3),
      ],
    );
    final List<Widget> _children = [
      HomePage(
        onTapTrilha: () => {
          setState(() {
            _currentIndex = 2;
          })
        },
        onTapAcompanhamento: () => {
          setState(() {
            _currentIndex = 3;
          })
        },
        onTapMentoria: () => {
          setState(() {
            _currentIndex = 1;
          })
        },
      ),
      InicioMentoriaPage(),
      InicioTrilhaPage(),
      InicioAcompanhamentoPage(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  BottomNavigationBarItem buildNavItem(IconData icon, String text, int index) {
    Color iconColor = _currentIndex == index
        ? AppColors.primaryColor
        : AppColors.secondaryIconColor;
    // Color textColor = _currentIndex == index
    //     ? AppColors.primaryColor
    //     : AppColors.secondaryTextColor;

    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: text,
    );
  }
}
