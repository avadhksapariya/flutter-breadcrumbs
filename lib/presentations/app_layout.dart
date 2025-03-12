import 'package:flutter/material.dart';
import 'package:flutter_breadcrumbs/presentations/breadcrumbs.dart';
import 'package:flutter_breadcrumbs/presentations/navigation_menu.dart';
import 'package:go_router/go_router.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text("My App"),
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: NavigationMenu(
                onTap: (route) {
                  context.go(route);
                },
              ),
            )
          : null,
      body: Row(
        children: [
          // Side menu for web layout
          if (MediaQuery.of(context).size.width >= 600)
            SizedBox(
              width: 200,
              child: NavigationMenu(
                onTap: (route) => context.go(route),
              ),
            ),

          // Main Content Area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (MediaQuery.of(context).size.width >= 600) const Breadcrumbs(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
