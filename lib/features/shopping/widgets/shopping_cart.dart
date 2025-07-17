import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<String> cartItems = [];

  void _addItem() {
    setState(() {
      cartItems.add('Item ${cartItems.length + 1}');
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart (${cartItems.length})'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => _removeItem(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}