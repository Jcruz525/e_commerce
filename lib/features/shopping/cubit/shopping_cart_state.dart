part of 'shopping_cart_cubit.dart';


class CartFakeStoreState {
  final List<ProductModel> products;
  final List<ProductModel> cartItems;
  final bool isLoading;
  final String? error;

  const CartFakeStoreState({
    this.products = const [],
    this.cartItems = const [],
    this.isLoading = false,
    this.error,
  });

  CartFakeStoreState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? cartItems,
    bool? isLoading,
    String? error,
  }) {
    return CartFakeStoreState(
      products: products ?? this.products,
      cartItems: cartItems ?? this.cartItems,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}