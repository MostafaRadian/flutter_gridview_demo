import 'package:flutter/material.dart';
import 'home_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<HomeItem> items = const [
    HomeItem(title: 'Home', icon: Icons.home),
    HomeItem(title: 'Contact', icon: Icons.contact_page),
    HomeItem(title: 'Map', icon: Icons.map),
    HomeItem(title: 'Phone', icon: Icons.phone),
    HomeItem(title: 'Camera', icon: Icons.camera_alt),
    HomeItem(title: 'Settings', icon: Icons.settings),
    HomeItem(title: 'Album', icon: Icons.photo_library),
    HomeItem(title: 'WiFi', icon: Icons.wifi),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9215B5),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Flutter GridView Demo'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
      ),
      drawer: Drawer(
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF9215B5)),
            child: Align(alignment: Alignment.bottomLeft, child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24))),
          ),
          for (final item in items)
            ListTile(leading: Icon(item.icon), title: Text(item.title), onTap: () => Navigator.pop(context)),
        ]),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: const Color(0xFFF1DDF8),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item.title} selected'))),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(item.icon, size: 52, color: const Color(0xFF9215B5)),
                const SizedBox(height: 10),
                Text(item.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF251033))),
              ]),
            ),
          );
        },
      ),
    );
  }
}
