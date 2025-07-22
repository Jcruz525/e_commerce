import 'package:e_commerce/core/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/shopping_cart_cubit.dart';


class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final productService = ProductService();
        final cubit = CartFakeStoreCubit(productService);
        cubit.fetchProducts(); 
        return cubit;         
      },
      child: BlocBuilder<CartFakeStoreCubit, CartFakeStoreState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Shopping Cart (${state.products.length})'),
            ),
            body: ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //title: Text(state.products[index].product),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      
                    },
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                
              },
              tooltip: 'Add Item',
              child: const Icon(Icons.add_shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
