import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola, mensaje desde Snackbar!'),
      action: SnackBarAction(
        label: 'Deshacer',
        onPressed: () {
          // Acción al presionar "Undo"
        },
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar Screen')),
      body: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showCustomSnackbar(context),
              child: const Text('Mostrar Snackbar'),
            ),
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Este es un ejemplo de diálogo de información.'),
                  ],
                );
              },
              child: const Text('Mostrar Licencias'),
            ),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Diálogo de alerta'),
                    content: const Text('Este es el contenido del diálogo.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
    );
  }
}
