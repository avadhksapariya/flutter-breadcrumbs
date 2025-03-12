import 'package:flutter_breadcrumbs/extensions.dart';
import 'package:flutter_breadcrumbs/presentations/app_layout.dart';
import 'package:flutter_breadcrumbs/presentations/dialogs/dialog_as_a_page.dart';
import 'package:flutter_breadcrumbs/presentations/dialogs/dialog_as_a_route.dart';
import 'package:flutter_breadcrumbs/presentations/tabs/screen_circular.dart';
import 'package:flutter_breadcrumbs/presentations/tabs/screen_contactus.dart';
import 'package:flutter_breadcrumbs/presentations/tabs/screen_dashboard.dart';
import 'package:flutter_breadcrumbs/presentations/tabs/screen_homework.dart';
import 'package:flutter_breadcrumbs/presentations/tabs/screen_message.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // Parent route for the dashboard
    ShellRoute(
      builder: (context, state, child) => AppLayout(child: child),
      routes: [
        // Child routes for Dashboard
        GoRoute(
          path: '/',
          builder: (context, state) => const ScreenDashboard(),
        ),
        GoRoute(
          path: '/dashboard/homework',
          builder: (context, state) => const ScreenHomework(),
        ),
        GoRoute(
          path: '/dashboard/messages',
          builder: (context, state) => const ScreenMessage(),
        ),
        GoRoute(
          path: '/dashboard/circular',
          builder: (context, state) => const ScreenCircular(),
          routes: [
            //dialog route
            GoRoute(
              path: '/dialog',
              pageBuilder: (context, state) => DialogPage(
                width: context.width * 0.3,
                height: context.width * 0.3,
                builder: (context) => const DialogAsARoute(),
              ),
            ),
          ],
        ),
      ],
    ),
    // Independent route for Contact Us
    GoRoute(
      path: '/contactus',
      builder: (context, state) => const AppLayout(child: ScreenContactUs()),
    ),
  ],
);
