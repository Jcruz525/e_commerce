part of 'shopping_cart_cubit.dart';

class ShoppingCartState extends Equatable {
  final List<CartItem> items;

  const ShoppingCartState({this.items = const []});

  @override
  List<Object> get props => [items];
}

final class ShoppingCartInitial extends ShoppingCartState {}
