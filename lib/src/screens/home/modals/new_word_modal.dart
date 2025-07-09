import 'package:flutter/material.dart';
import 'package:wordgame/src/controllers/game_controller.dart';

class NewWordModal extends StatelessWidget {
  final GameController gameController;
  
  const NewWordModal({super.key, required this.gameController});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Digite uma nova palavra",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Palavra",
            ),
            onSubmitted: (value) {
              Navigator.of(context).pop(value);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              gameController.wordsList.add(controller.text);
              print(gameController.wordsList);
              Navigator.of(context).pop(controller.text);
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}
