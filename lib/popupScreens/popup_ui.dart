import 'package:firebase_deneme/popupScreens/password_update.dart';
import 'package:firebase_deneme/popupScreens/profile_update.dart';
import 'package:firebase_deneme/screens/login/log_out.dart';
import 'package:flutter/material.dart';

import '../color.dart';

class PopupUi extends StatelessWidget {
  const PopupUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: kDarkPrimaryColor,
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 0,
          child: Text('Profili Güncelle'),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Şifre Değiştir'),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: const [
              Icon(Icons.logout),
              SizedBox(width: 8),
              Text('Çıkış Yap'),
            ],
          ),
        ),
      ],
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProfileUpdate()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PasswordUpdate()),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Logout()),
        );
        break;
    }
  }
}
