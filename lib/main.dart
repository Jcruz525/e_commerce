import 'package:e_commerce/features/home/view/home_screen.dart';
import 'package:e_commerce/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/shopping/widgets/shopping_cart.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    routes: {
      '/home': (_) => HomeScreen(),
      '/shopping_cart': (_) => ShoppingCartPage(),
    },
  ));
}
