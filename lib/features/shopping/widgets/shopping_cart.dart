import 'package:e_commerce/features/checkout/widgets/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/data/models/product_model.dart';
import '../cubit/shopping_cart_cubit.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});
  
Map<ProductModel, int> _groupCartItems(List<ProductModel> items) {
  final Map<ProductModel, int> groupedItems = {};

  for (var item in items) {
    if (groupedItems.containsKey(item)) {
      groupedItems[item] = groupedItems[item]! + 1;
    } else {
      groupedItems[item] = 1;
    }
  }

  return groupedItems;
}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartFakeStoreCubit, CartFakeStoreState>(
      builder: (context, state) {
        final cartCubit = context.read<CartFakeStoreCubit>();
final groupedCart = _groupCartItems(state.cartItems);
final groupedItemsList = groupedCart.entries.toList();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
    onPressed: () => Navigator.of(context).pop(),
  ),
            backgroundColor: const Color.fromARGB(255, 0, 43, 78),
            title: Text('Cart (${state.cartItems.length})', style: TextStyle(color: Colors.white) ,),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                tooltip: 'Clear Cart',
                onPressed: () => cartCubit.clearCart(),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
  itemCount: groupedItemsList.length,
  itemBuilder: (context, index) {
    final entry = groupedItemsList[index];
    final item = entry.key;
    final quantity = entry.value;

    return ListTile(
      leading: item.image != null
          ? Image.network(
              item.image!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
          : const SizedBox(width: 50, height: 50), 
      title: Text(item.title ?? 'No Title'),
      subtitle: Text('\$${item.price?.toStringAsFixed(2) ?? '0.00'}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => cartCubit.removeOne(item),
          ),
          Text(quantity.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => cartCubit.addOne(item),
          ),
        ],
      ),
    );
  }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Total: \$${cartCubit.totalPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 43, 78),
                      ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CheckoutPage(),
                      ),
                    );
                  },
                  child: const Text('Proceed to Checkout', style: TextStyle(color: Colors.white),),
                ),
                
                  ],
                ),
              ),
            ],
          ),
         
        );
      },
    );
  }

}
