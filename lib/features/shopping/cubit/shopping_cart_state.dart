part of 'shopping_cart_cubit.dart';


class CartFakeStoreState {
  final List<ProductModel> products;
  final bool isLoading;
  final String? error;

  const CartFakeStoreState({
    this.products = const [],
    this.isLoading = false,
    this.error,
  });

  CartFakeStoreState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
  }) {
    return CartFakeStoreState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}