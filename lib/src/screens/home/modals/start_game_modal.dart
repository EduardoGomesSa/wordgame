import 'package:flutter/material.dart';

class StartGameModal extends StatelessWidget {
  const StartGameModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Text("Escolha o nível"),
    );
  }
}
