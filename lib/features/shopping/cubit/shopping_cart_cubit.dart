import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_state.dart';

class CartItem {
  final String id;
  final String name;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
  });
}

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartInitial());
 
}
