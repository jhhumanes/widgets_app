import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Occaecat enim mollit et minim anim. Officia sit adipisicing id ad ut commodo ullamco velit. Lorem mollit sint amet ut proident et anim magna veniam exercitation qui consectetur.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Consectetur officia aliquip ex consectetur mollit esse nostrud voluptate labore aliqua tempor nulla dolor. Ipsum fugiat aliqua officia adipisicing sunt mollit in ex labore eiusmod exercitation eu. Tempor excepteur dolor aute consectetur pariatur aute occaecat ad magna. Proident ullamco anim occaecat voluptate excepteur dolor pariatur veniam non. Lorem veniam commodo adipisicing aute sunt officia et.')
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
    );
  }
}
