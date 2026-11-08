import 'package:flutter/material.dart';
import 'home_item.dart';
import 'home_item_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<HomeItem> items = const [
    HomeItem(name: 'Home', icon: Icons.home),
    HomeItem(name: 'Contact', icon: Icons.contact_page),
    HomeItem(name: 'Map', icon: Icons.map),
    HomeItem(name: 'Phone', icon: Icons.phone),
    HomeItem(name: 'Camera', icon: Icons.camera_alt),
    HomeItem(name: 'Settings', icon: Icons.settings),
    HomeItem(name: 'Album', icon: Icons.photo_library),
    HomeItem(name: 'WiFi', icon: Icons.wifi),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9215B5),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Flutter GridView Demo'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) => HomeItemWidget(item: items[index]),
        itemCount: items.length,
      ),
    );
  }
}
