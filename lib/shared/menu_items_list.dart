import 'package:flutter/material.dart';
import 'package:widget_app/config/menu_items.dart';

final appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Home',
    subtitle: 'Go to home page',
    route: '/',
    icon: Icons.home,
  ),
  MenuItems(
    title: 'Snackbar',
    subtitle: 'Adjust your preferences',
    route: '/snackbar',
    icon: Icons.settings,
  ),
  MenuItems(
    title: 'Progress',
    subtitle: 'View your profile',
    route: '/progress',
    icon: Icons.bar_chart,
  ),
  MenuItems(
    title: 'Buttons',
    subtitle: 'Get assistance',
    route: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Cards',
    subtitle: 'View your cards',
    route: '/cards',
    icon: Icons.credit_card,
  ),
];
