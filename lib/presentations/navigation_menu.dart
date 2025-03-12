import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, required this.onTap});

  final Function(String route) onTap;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  bool isDashboardExpanded = false; // To toggle the Dashboard submenu

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Dashboard with submenu toggle
        ListTile(
          title: const Text("Dashboard"),
          trailing: Icon(isDashboardExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: () {
            setState(() {
              isDashboardExpanded = !isDashboardExpanded;
            });
          },
        ),

        if (isDashboardExpanded) ...[
          ListTile(
            onTap: () {
              widget.onTap('/dashboard/homework');
              closeDrawer(context);
            },
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Homework"),
            ),
          ),
          ListTile(
            onTap: () {
              widget.onTap('/dashboard/messages');
              closeDrawer(context);
            },
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Messages"),
            ),
          ),
          ListTile(
            onTap: () {
              widget.onTap('/dashboard/circular');
              closeDrawer(context);
            },
            title: const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Circular"),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              widget.onTap('/contactus');
              closeDrawer(context);
            },
            title: const Text("Contact Us"),
          ),
        ]
      ],
    );
  }

  void closeDrawer(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      Navigator.of(context).pop(); // Close the drawer on mobile.
    }
  }
}
