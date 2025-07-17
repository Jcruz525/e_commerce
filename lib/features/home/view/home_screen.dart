import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/shopping_cart'), icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: state.products[index]);
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
