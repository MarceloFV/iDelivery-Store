import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

main() {
  final firestore = MockFirestoreInstance();
  ProductProvider provider = ProductProvider(firestore: firestore);
  
  group('Product Provider: ', () {

    test('Create product', () async {
      
    }, skip: true);

    test('Read product', () async {
      
    }, skip: true);

    test('Read all products', () async {
      
    }, skip: true);

    test('Edit product', () async {
     
    }, skip: true);

    test('Delete product', () async {
      
    }, skip: true);
  });
}
