import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    Key? key,
  required this.text,
  required this.onTap,
  required this.onDelete,
  required this.onEdit
  }) : super(key: key);
  final String text;
  final VoidCallback  onTap;
  final VoidCallback  onDelete;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: onDelete,
              child: const Icon(
              Icons.delete,
            ),
            ),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: onEdit,
              child: const Icon(
              Icons.edit
            ),
            )
        ]),
      ),
    );
  }
}