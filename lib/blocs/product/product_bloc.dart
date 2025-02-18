import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vazifa_1/blocs/product/product_event.dart';
import 'package:vazifa_1/blocs/product/product_state.dart';
import 'package:vazifa_1/data/repositores/product_repozitores.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  ProductsBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(InitialProductsState()) {
    on<GetProductsEvent>(_getProducts);
    on<DeleteProductEvent>(_deleteProduct);
  }

  void _getProducts(
    GetProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(LoadingProductsState());
    try {
      final response = await _productsRepository.getProducts();
      emit(LoadedProductsState(response));
    } catch (e) {
      emit(ErrorProductsState(e.toString()));
    }
  }

  void _deleteProduct(
    DeleteProductEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(DeletingProductState());
    GetProductsEvent();
    try {
      await _productsRepository.deleteProducts(event.productId);
      emit(DeletedProductState());
    } catch (e) {
      emit(ErrorDeletingProductState(e.toString()));
    }
  }
}
