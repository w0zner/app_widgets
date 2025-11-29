import 'package:flutter/material.dart';
import 'package:widget_app/theme/app_theme.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls Screen')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Topics { Granola, Banana, Durazno, Chispas, Confetis }

class _UiControlsViewState extends State<_UiControlsView> {
  bool swith = false;
  bool esDesayuno = false;
  Topics selectedTopic = Topics.Granola;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile.adaptive(
          value: swith,
          title: const Text('Agrandar combos'),
          onChanged: (value) {
            setState(() {
              swith = value;
            });
          },
        ),
        const Divider(),
        CheckboxListTile.adaptive(
          value: esDesayuno,
          title: const Text('Quiere desayuno?'),
          onChanged: (value) {
            setState(() {
              esDesayuno = !esDesayuno;
              print(esDesayuno);
            });
          },
        ),
        const Divider(),
        ExpansionTile(
          title: const Text('Topics'),
          subtitle: Text(
            selectedTopic.name,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          children: [
            for (final topic in Topics.values)
              RadioListTile<Topics>(
                value: topic,
                groupValue: selectedTopic,
                title: Text(topic.name),
                onChanged: (value) {
                  setState(() {
                    selectedTopic = value!;
                    print(selectedTopic.name);
                  });
                },
              ),
          ],
        ),
        // RadioListTile<int>(
        //   value: Topics.granola.index,
        //   groupValue: selectedTopic.index,
        //   title: const Text('Radio List Tile'),
        //   onChanged: (value) {},
        // ),
        const Divider(),
        const AboutListTile(
          applicationName: 'Flutter Widget',
          applicationVersion: '1.0.0',
          applicationLegalese: '© 2024 Widget App',
        ),
      ],
    );
  }
}
