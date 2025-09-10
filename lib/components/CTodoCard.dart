import 'package:flutter/material.dart';

class CTodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final VoidCallback? onDone;

  const CTodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.isDone,
    this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text("$description • $category"),
        trailing: isDone
            ? const Icon(Icons.check_circle, color: Colors.green)
            : IconButton(
                icon: const Icon(Icons.check, color: Colors.grey),
                onPressed: onDone,
              ),
      ),
    );
  }
}
