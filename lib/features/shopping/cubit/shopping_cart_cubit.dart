import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/services/product_service.dart';
import 'package:e_commerce/data/models/product_model.dart';
part 'shopping_cart_state.dart';

class CartFakeStoreCubit extends Cubit<CartFakeStoreState> {
  final ProductService _service;

  CartFakeStoreCubit(this._service) : super(const CartFakeStoreState());

  void fetchProducts() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final products = await _service.fetchAllProducts();
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void addToCart(ProductModel product) {
    final updatedCart = List<ProductModel>.from(state.cartItems)..add(product);
    emit(state.copyWith(cartItems: updatedCart));
  }

  void removeFromCart(ProductModel product) {
    final updatedCart = List<ProductModel>.from(state.cartItems)
      ..removeWhere((item) => item.id == product.id);
    emit(state.copyWith(cartItems: updatedCart));
  }

  void clearCart() {
    emit(state.copyWith(cartItems: []));
  }

  double get totalPrice =>
      state.cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
}
