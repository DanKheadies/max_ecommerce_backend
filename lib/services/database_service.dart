import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:max_ecommerce_backend/models/models.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Order>> getOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Future<List<OrderStats>> getOrderStats() {
    return _firebaseFirestore
        .collection('order_stats')
        .orderBy('dateTime')
        .get()
        .then(
          (querySnapshot) => querySnapshot.docs.asMap().entries.map(
            (entry) {
              return OrderStats.fromSnapshot(
                entry.value,
                entry.key,
              );
            },
          ).toList(),
        );
  }

  Stream<List<Order>> getPendingOrders() {
    return _firebaseFirestore
        .collection('orders')
        .where('isDelivered', isEqualTo: false)
        .where('isCancelled', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Product>> getProducts() {
    return _firebaseFirestore
        .collection('products')
        .orderBy('category')
        .orderBy('name')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return _firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
    Product product,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore.collection('products').doc(product.id).update({
      field: newValue,
    });
  }

  Future<void> updateOrder(
    Order order,
    String field,
    dynamic newValue,
  ) {
    return _firebaseFirestore.collection('orders').doc(order.id).update({
      field: newValue,
    });
  }
}
