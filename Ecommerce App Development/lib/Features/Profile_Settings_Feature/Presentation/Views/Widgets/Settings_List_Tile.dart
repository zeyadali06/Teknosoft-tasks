import 'package:e_commerce_app_development/Core/Utils/App_Router.dart';
import 'package:e_commerce_app_development/Core/Utils/Styles.dart';
import 'package:e_commerce_app_development/constants.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({super.key, required this.listTileText, required this.toView, required this.icon});

  final String listTileText;
  final Widget toView;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(AppRouter.goTo(context, toView)),
      child: ListTile(
        title: Text(listTileText, style: Styles.black21w500(context)),
        leading: Icon(icon, color: kPrimaryColor),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
