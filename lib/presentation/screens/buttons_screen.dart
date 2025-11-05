import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: //const Center(child: Text('Buttons Screen')),
          ButtonView(),
    );
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            const ElevatedButton(onPressed: null, child: Text('Procesar')),
            ElevatedButton.icon(
              icon: Icon(Icons.access_alarms_rounded),
              onPressed: () {},
              label: Text('Elevation icon'),
            ),
            FilledButton(onPressed: () {}, child: Text('Filled')),
            FilledButton.icon(
              icon: Icon(Icons.accessibility_new),
              onPressed: () {},
              label: Text('Filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Outlined')),
            OutlinedButton.icon(
              icon: Icon(Icons.account_balance),
              onPressed: () {},
              label: Text('Outlined icon'),
            ),
            TextButton(onPressed: () {}, child: Text('Text Button')),
            TextButton.icon(
              icon: Icon(Icons.adb),
              onPressed: () {},
              label: Text('Text Button icon'),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_outlined),
              style: IconButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
            ),
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
