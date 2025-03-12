import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    final segments = currentLocation.split('/').where((s) => s.isNotEmpty).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          // Add the root "Dashboard" breadcrumb only if the current location contains "dashboard".
          if (segments.isNotEmpty && segments.first == 'dashboard') ...[
            InkWell(
              onTap: () => context.go('/'),
              child: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
          for (int i = 0; i < segments.length; i++) ...[
            const Text(" > "),
            InkWell(
              onTap: () {
                final path = '/${segments.sublist(0, i + 1).join('/')}';
                context.go(path);
              },
              child: Text(
                segments[i].capitalize(),
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}
