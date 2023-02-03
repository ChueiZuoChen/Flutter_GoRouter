import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const App());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'page1',
          builder: (BuildContext context, GoRouterState state) {
            return const Page1();
          },
        ),
        GoRoute(
          path: 'page2',
          builder: (BuildContext context, GoRouterState state) {
            return const Page2();
          },
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router,
      );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("123"),
          ElevatedButton(
            onPressed: () {
              context.go("/page1");
            },
            child: const Text("1"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go("/page2");
            },
            child: const Text("2"),
          )
        ],
      )),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text("Page 1"),
        ElevatedButton(
            onPressed: () {
              context.go("/");
            },
            child: Text("back home")),
      ],
    ));
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text("Page2"),
        ElevatedButton(onPressed: () {
          context.go("/");
        }, child: Text("bach home"))
      ],
    ));
  }
}
