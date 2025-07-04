import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_notes/screens/notes_screen.dart';

import 'firebase_options.dart';
import 'cubit/authentication/auth_cubit.dart';
import 'data/auth_repository.dart';
import 'screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthRepository())..checkAuthStatus(),
      child: MaterialApp(
        title: 'Flutter Firebase Notes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.indigo,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? const AuthScreen()
            : const NotesScreen(),
        routes: {
          '/notes': (_) => const NotesScreen(),
          '/auth': (_) => const AuthScreen(),
        },
      ),
    );
  }
}
