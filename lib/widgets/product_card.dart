import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_ecommerce_backend/controllers/controllers.dart';
import 'package:max_ecommerce_backend/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;

  ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: product.price,
                        min: 0,
                        max: 25,
                        // divisions: 10,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        onChanged: (value) {
                          productController.updateProductPrice(
                            index,
                            product,
                            value,
                          );
                        },
                        onChangeEnd: (value) {
                          productController.saveNewProductPrice(
                            product,
                            'price',
                            value,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.quantity.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: product.quantity.toDouble(),
                        min: 0,
                        max: 100,
                        // divisions: 10,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        onChanged: (value) {
                          productController.updateProductQuantity(
                            index,
                            product,
                            value.toInt(),
                          );
                        },
                        onChangeEnd: (value) {
                          productController.saveNewProductQuantity(
                            product,
                            'quantity',
                            value.toInt(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
