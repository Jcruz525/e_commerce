import 'package:e_commerce/core/services/product_service.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductService productService;

  HomeCubit(this.productService) : super(HomeInitial());

  Future<void> loadProducts() async {
    try {
      emit(HomeLoading());
      final List<ProductModel> products = await productService.fetchAllProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError('Failed to load products: $e'));
    }
  }
}
