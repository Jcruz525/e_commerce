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
  void updateItems(List<ProductModel> items) => emit(state.copyWith(products: items));
  
}