import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository_interface.dart';
import '../data_sources/product_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> getProducts() async {
    return await dataSource.fetchProducts();
  }
}
