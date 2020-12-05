import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductProvider provider;

  ProductRepository({@required this.provider}) : assert(provider != null);

  Future<List<ProductModel>> getAll() => provider.getProductList();

  add(ProductModel product) => provider.addProduct(product);

  getProducts() => provider.getProductList();

  //TODO: Implement ProductRepository
}
