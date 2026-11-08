import 'package:flutter/material.dart';
import 'home_item.dart';

class HomeItemWidget extends StatelessWidget {
  final HomeItem item;

  const HomeItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1DDF8),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: const Color(0xFF9215B5), size: 55),
            const SizedBox(height: 10),
            Text(item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
