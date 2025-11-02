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
    title: 'Settings',
    subtitle: 'Adjust your preferences',
    route: '/settings',
    icon: Icons.settings,
  ),
  MenuItems(
    title: 'Profile',
    subtitle: 'View your profile',
    route: '/profile',
    icon: Icons.person,
  ),
  MenuItems(
    title: 'buttons',
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
