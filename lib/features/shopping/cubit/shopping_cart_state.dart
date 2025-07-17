part of 'shopping_cart_cubit.dart';

sealed class ShoppingCartState extends Equatable {
  const ShoppingCartState();

  @override
  List<Object> get props => [];
}

final class ShoppingCartInitial extends ShoppingCartState {}
