import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth/auth_cubit.dart';
import '../cubit/auth/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Sign Up')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Success!'), backgroundColor: Colors.green),
            );
            // Navigate to notes screen (placeholder for now)
            Navigator.pushReplacementNamed(context, '/notes');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
                TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    if (isLogin) {
                      context.read<AuthCubit>().signIn(email, password);
                    } else {
                      context.read<AuthCubit>().signUp(email, password);
                    }
                  },
                  child: Text(isLogin ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() => isLogin = !isLogin);
                    context.read<AuthCubit>().reset();
                  },
                  child: Text(isLogin ? 'Don\'t have an account? Sign Up' : 'Already have an account? Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
