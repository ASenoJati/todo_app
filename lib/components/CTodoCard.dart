import 'package:flutter/material.dart';

class CTodoCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final bool isDone;
  final String? date;
  final String? dueDate;
  final VoidCallback? onDone;
  final VoidCallback? onDelete;

  const CTodoCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.isDone,
    this.onDone,
    this.onDelete,
    this.date,
    this.dueDate,
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
            fontWeight: FontWeight.bold,
          ),
        ),

          

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),

             SizedBox(height: 4,),
            // Text("kategori: $category"),
             Row(
              children: [
                const Icon(Icons.category, size: 20,),
                const SizedBox(width: 4,),
                Text("$category"),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                const Icon(Icons.event, size: 20,),
                const SizedBox(width: 4,),
                Text(date != null ? date! : '-'),
              ],
            ),
            
            SizedBox(height: 5,),

            Row(
              children: [
                const Icon(Icons.schedule, size: 20,),
                const SizedBox(width: 4,),
                Text("${dueDate != null ? dueDate! : '-'}")
              ],
            ),

          ],
        ) ,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isDone && onDone != null)
             IconButton(
              icon: const Icon(
                Icons.check,
                color: Colors.grey,
              ),
              onPressed: onDone,
              ),

            if (onDelete != null)
            IconButton(
              icon:const Icon(Icons.delete, 
              color: Colors.red,),
              onPressed: onDelete,
              ),
            
            // else
            //   IconButton(
            //     icon: const Icon(Icons.check, color: Colors.grey,),
            //     onPressed: onDone,
            //   ),
            //   IconButton(
            //     icon: const Icon(Icons.delete, color: Colors.red),
            //     onPressed: onDelete,
            //   )
          ],
        )
              
      ),
    );
  }
}
