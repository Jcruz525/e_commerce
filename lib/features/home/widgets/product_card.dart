import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
  elevation: 3,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(product.image ?? '', height: 120, width: double.infinity, fit: BoxFit.cover),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          product.title ?? 'No Title',
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis, 
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text('\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 8),
            RatingBarIndicator(
              rating: 3.5,
              itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 18.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Add to Cart'),
          ),
        ),
      ),
    ],
  ),
);

  }
}
