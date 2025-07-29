import 'package:e_commerce/core/services/product_service.dart';
import 'package:e_commerce/features/home/view/home_screen.dart';
import 'package:e_commerce/features/login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'features/shopping/widgets/shopping_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/shopping/cubit/shopping_cart_cubit.dart';
void main() {
  runApp(
    BlocProvider(
      create: (_) => CartFakeStoreCubit(ProductService())..fetchProducts(),
      child: MaterialApp(
        home: LoginScreen(),
        routes: {
          '/home': (_) => HomeScreen(),
          '/shopping_cart': (_) => const ShoppingCartPage(),
        },
      ),
    ),
  );
}
