import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_ecommerce_backend/controllers/controllers.dart';
import 'package:max_ecommerce_backend/screens/screens.dart';
import 'package:max_ecommerce_backend/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: InkWell(
                  onTap: () => Get.to(() => NewProductScreen()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add a New Product',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 250,
                      child: ProductCard(
                        product: productController.products[index],
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
