import 'package:get/get.dart';

import 'package:max_ecommerce_backend/models/models.dart';
import 'package:max_ecommerce_backend/services/services.dart';

class ProductController extends GetxController {
  final DatabaseService database = DatabaseService();

  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void saveNewProductPrice(
    Product product,
    String field,
    double value,
  ) {
    database.updateField(product, field, value);
  }

  void saveNewProductQuantity(
    Product product,
    String field,
    int value,
  ) {
    database.updateField(product, field, value);
  }

  void updateProductPrice(
    int index,
    Product product,
    double value,
  ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
    int index,
    Product product,
    int value,
  ) {
    product.quantity = value;
    products[index] = product;
  }
}
