import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/shared/menu_items_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(appMenuItems[index].icon, color: colors.primary),
          trailing: Icon(Icons.arrow_forward_ios, color: colors.primary),
          title: Text(appMenuItems[index].title),
          subtitle: Text(appMenuItems[index].subtitle),
          onTap: () {
            print('Tapped on ${appMenuItems[index].title}');
            print('Indice: $index');
            // Navigate to the route if it's not empty
            if (appMenuItems[index].route.isNotEmpty) {
              //Navigator.pushNamed(context, appMenuItems[index].route);

              if (appMenuItems[index].route == '/') {
                context.go('/');
                return;
              }

              context.push(appMenuItems[index].route);
            }
          },
        );
      },
    );
  }
}
