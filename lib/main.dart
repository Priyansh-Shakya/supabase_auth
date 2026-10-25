import 'package:authentication_supabase/Supabase_Auth/Helpers/initilizeSupabase.dart';
import 'package:authentication_supabase/Supabase_Auth/Logic/authProvider.dart';
import 'package:authentication_supabase/Supabase_Auth/Screens/authGate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await initSupabase();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthGate(),
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Authentication"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signOut();
              },
              child: Text("log out"),
            ),
          ],
        ),
      ),
    );
  }
}
