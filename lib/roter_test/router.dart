// import 'package:expantiontitle_test/main.dart';
// import 'package:expantiontitle_test/roter_test/fourth_page.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:expantiontitle_test/roter_test/swipeable_route.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>();
// final goRouter = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   debugLogDiagnostics: true,
//   routes: [
//     ShellRoute(
//         navigatorKey: _shellNavigatorKey,
//         builder: (context, state, child) {
//           return Scaffold(body: child);
//         },
//         routes: [
//           GoRoute(
//             path: '/',
//             pageBuilder: (context, state) =>
//                 SlideTransitionPage(child: FirstPage()),
//           ),
//           GoRoute(
//             path: '/page2',
//             pageBuilder: (context, state) =>
//                 SlideTransitionPage(child: SecondPage()),
//           ),
//           GoRoute(
//             path: '/page3',
//             pageBuilder: (context, state) => SlideTransitionPage(
//               child: ThirdPage(),
//             ),
//             routes: [
//               GoRoute(
//                   path: 'page4',
//                   name: 'page4',
//                   pageBuilder: (context, state) => SwipeablePage(
//                         builder: (context) => FourthPage(),
//                       ),
//                   routes: [
//                     GoRoute(
//                       path: 'page5',
//                       name: 'page5',
//                       pageBuilder: (context, state) => SwipeablePage(
//                         builder: (context) => FivePage(),
//                       ),
//                     ),
//                   ]),
//             ],
//           ),
//         ])
//   ],
// );

// class SlideTransitionPage extends Page<dynamic> {
//   final Widget child;

//   SlideTransitionPage({required this.child});

//   @override
//   Route createRoute(BuildContext context) {
//     return PageRouteBuilder(
//       settings: this,
//       pageBuilder: (context, animation, secondaryAnimation) => child,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(1.0, 0.0),
//             end: Offset.zero,
//           ).animate(animation),
//           child: child,
//         );
//       },
//     );
//   }
// }
