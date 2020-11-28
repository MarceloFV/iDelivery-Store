import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentReference extends Mock implements DocumentReference {}

main() {
  group('Product Provider', () {
    MockFirestore firestore;
    ProductProvider provider;
    MockCollectionReference collectionReference;
    MockDocumentReference documentReference;
    ProductModel mockedProduct;
    String docId;

    setUp(() {
      firestore = MockFirestore();
      provider = ProductProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      documentReference = MockDocumentReference();
      docId = 'xxxxx';
    });

    setUp(() {
      when(firestore.collection('products')).thenReturn(collectionReference);
      when(documentReference.id).thenReturn(docId);
      when(collectionReference.doc(docId)).thenReturn(documentReference);
      mockedProduct = ProductModel(reference: documentReference);

    });

    test('Add new product', () async {
      when(collectionReference.add(any))
          .thenAnswer((_) async => documentReference);
      ProductModel mockedProduct = ProductModel();
      var actual = await provider.addProduct(mockedProduct);
      var matcher = documentReference; //DocumentReference(ou id);
      expect(actual, matcher);
    });

    test('Edit product', () async {
      var actual = await provider.editProduct(mockedProduct);
      var matcher = documentReference;
      expect(actual, matcher);
    });

    test('Delete product', () async {
      var actual = await provider.deleteProduct(mockedProduct);
      var matcher = documentReference;
      expect(actual, matcher);
    });
  });
}


