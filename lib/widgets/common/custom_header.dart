import 'package:conectadas_app/widgets/common/theme_switch.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {

  final Color backgroundColor;
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;
  final bool showBackButton;

  const AppHeader({
    super.key,
    required this.title,
    required this.appBar,
    required this.widgets,
    this.backgroundColor = const Color(0xFF6441a5),
    this.showBackButton = true, // Make the back button optional
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null, // Show or hide the back button based on `showBackButton`
      iconTheme: const IconThemeData(color: Colors.white),
      title: title,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        ...widgets,
        const ThemeSwitch(),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
