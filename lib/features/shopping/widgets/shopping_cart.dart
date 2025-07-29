import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/services/product_service.dart';
import 'package:e_commerce/data/models/product_model.dart';
import '../cubit/shopping_cart_cubit.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartFakeStoreCubit, CartFakeStoreState>(
      builder: (context, state) {
        final cartCubit = context.read<CartFakeStoreCubit>();

        return Scaffold(
          appBar: AppBar(
            title: Text('Cart (${state.cartItems.length})'),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Clear Cart',
                onPressed: () => cartCubit.clearCart(),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = state.cartItems[index];
                    return ListTile(
                      title: Text(item.title ?? 'No Title'),
                      subtitle:
                          Text('\$${item.price?.toStringAsFixed(2) ?? '0.00'}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () => cartCubit.removeFromCart(item),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Total: \$${cartCubit.totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddProductDialog(context, state.products),
            tooltip: 'Add Item',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _showAddProductDialog(
      BuildContext context, List<ProductModel> products) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (_, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.title ?? 'No Title'),
              subtitle: Text(
                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
              onTap: () {
                context.read<CartFakeStoreCubit>().addToCart(product);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
