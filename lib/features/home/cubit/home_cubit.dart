import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../../../data/models/product_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadProducts() async {
    emit(HomeLoading());
    try {
final products = [
        ProductModel(id: 1, name: 'Product 1', price: 29.99, imageUrl: 'https://picsum.photos/200/300'),
        ProductModel(id: 2, name: 'Product 2', price: 49.99, imageUrl: 'https://picsum.photos/200/300'),
        ProductModel(id: 3, name: 'Product 3', price: 19.99, imageUrl: 'https://picsum.photos/200/300'),
      ];
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError('Failed to load products.'));
    }
  }
}
