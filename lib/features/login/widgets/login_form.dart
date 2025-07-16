import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginPressed() {
    final email = _emailController.text;
    final password = _passwordController.text;
    context.read<LoginCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
        TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
        SizedBox(height: 20),
        ElevatedButton(onPressed: _onLoginPressed, child: Text('Login')),
      ],
    );
  }
}
