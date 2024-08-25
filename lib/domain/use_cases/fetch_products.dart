import '../entities/product_entity.dart';
import '../repositories/product_repository_interface.dart';

class FetchProducts {
  final ProductRepository repository;

  FetchProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
