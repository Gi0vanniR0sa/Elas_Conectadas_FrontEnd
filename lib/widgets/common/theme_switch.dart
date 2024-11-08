import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

//RESPONSAVEL POR MUDAR O TEMA DO APP
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = AdaptiveTheme.of(context).mode.isDark;
    return IconButton(
      icon: Icon(isDarkMode ? Icons.brightness_2 : Icons.brightness_5),
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
      onPressed: () {
        if (isDarkMode) {
          AdaptiveTheme.of(context).setLight();
        } else {
          AdaptiveTheme.of(context).setDark();
        }
      },
    );
  }
}