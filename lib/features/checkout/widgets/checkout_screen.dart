import 'package:e_commerce/features/shopping/cubit/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartFakeStoreCubit>();
    final cartItems = cartCubit.state.cartItems;

    
    final Map<ProductModel, int> groupedItems = {};
    for (var item in cartItems) {
      groupedItems[item] = (groupedItems[item] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 43, 78),
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cartItems.isEmpty
            ? const Center(child: Text('Your cart is empty.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView(
                      children: groupedItems.entries.map((entry) {
                        final product = entry.key;
                        final quantity = entry.value;

                        return ListTile(
                          leading: product.image != null
                              ? Image.network(product.image!, width: 50, height: 50, fit: BoxFit.cover)
                              : const Placeholder(fallbackWidth: 50, fallbackHeight: 50),
                          title: Text(product.title ?? 'No Title'),
                          subtitle: Text('Quantity: $quantity'),
                          trailing: Text('\$${(product.price! * quantity).toStringAsFixed(2)}'),
                        );
                      }).toList(),
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 0, 43, 78)),
                  Text(
                    'Total: \$${cartCubit.totalPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 43, 78),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Order Placed'),
                            content: const Text('Thank you for your purchase!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); 
                                  Navigator.pop(context); 
                                  cartCubit.clearCart(); 
                                },
                                child: const Text('OK', style: TextStyle(color: Colors.black),),
                              )
                            ],
                          ),
                        );
                      },
                      child: const Text('Place Order', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
