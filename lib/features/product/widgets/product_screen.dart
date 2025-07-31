import 'package:e_commerce/features/shopping/cubit/shopping_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartFakeStoreCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? 'Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: product.image != null
                    ? Image.network(
                        product.image!,
                        height: 250,
                        fit: BoxFit.contain,
                      )
                    : const Placeholder(fallbackHeight: 250),
              ),
              const SizedBox(height: 16),
              Text(
                product.title ?? 'No Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              if (product.category != null)
                Chip(
                  label: Text(product.category!, style: const TextStyle(color: Colors.white)),
                  backgroundColor: const Color.fromARGB(255, 0, 43, 78),
                ),
              const SizedBox(height: 12),
              if (product.rating != null)
                Row(
                  
                  children: [
                    RatingBarIndicator(
                      rating: product.rating?.rate ?? 0.0,
                      itemBuilder: (context, index) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      '${product.rating!.rate} (${product.rating!.count} reviews)',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Text(
                product.description ?? 'No Description Available',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                  onPressed: () {
                    cartCubit.addOne(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: const Color.fromARGB(255, 0, 43, 78),
                        content: Text('Added to Cart!', textAlign: TextAlign.center,),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 43, 78),
                  ),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
