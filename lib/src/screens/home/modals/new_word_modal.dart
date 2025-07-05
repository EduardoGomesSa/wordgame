import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewWordModal extends StatelessWidget {
  const NewWordModal({super.key});

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
              Navigator.of(context).pop(controller.text);
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}
