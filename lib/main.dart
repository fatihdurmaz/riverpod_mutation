import 'package:flutter/material.dart';
import 'package:flutter_application_1/post_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'observer.dart';

void main() {
  runApp(
    ProviderScope(observers: [AppProviderObserver()], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PostView(),
    );
  }
}
