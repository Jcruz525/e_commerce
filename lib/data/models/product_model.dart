import 'dart:math';

double get randomRating {
  final possibleRatings = [3.0, 3.5, 4.0, 4.5, 5.0];
  final random = Random();
  return possibleRatings[random.nextInt(possibleRatings.length)];
}


class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
}


class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? Rating(
              rate: (json['rating']['rate'] ?? 0).toDouble(),
              count: json['rating']['count'] ?? 0,
            )
          : Rating(rate: randomRating, count: Random().nextInt(100) + 1),
    );
  }
}
