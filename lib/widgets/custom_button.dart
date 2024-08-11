import 'package:flutter/material.dart';

class TCustomActionButton extends StatelessWidget {
  const TCustomActionButton({
    super.key,
    this.action,
  });
  final String? action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle delete
      },
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: action == 'DELETE' ? Colors.red : Colors.blue,
          width: 2,
        ),
        backgroundColor: action == 'DELETE' ? Colors.white : Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          '$action',
          style: TextStyle(
            color: action == 'DELETE' ? Colors.red : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
