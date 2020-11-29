import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentReference extends Mock implements DocumentReference {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

main() {
  group('Store Provider > CRUD:', () {
    StoreProvider provider;
    MockFirestore firestore;
    MockDocumentReference documentReference;
    MockCollectionReference collectionReference;
    MockDocumentSnapshot documentSnapshot;
    StoreModel storeModel;
    StoreModel updatedStoreModel;
    StoreModel storeModelWithoutReference;
    String uid;

    setUp(() {
      firestore = MockFirestore();
      provider = StoreProvider(firestore: firestore);
      collectionReference = MockCollectionReference();
      documentReference = MockDocumentReference();
      documentSnapshot = MockDocumentSnapshot();

      storeModelWithoutReference = StoreModel(title: 'teste');
      storeModel = StoreModel(title: 'teste', reference: documentReference);
      updatedStoreModel =
          StoreModel(title: 'naoteste', reference: documentReference);
    });

    setUp(() {
      when(firestore.collection('stores')).thenReturn(collectionReference);
    });

    test('Create store', () async {
      when(collectionReference.add(any))
          .thenAnswer((_) async => documentReference);
      var actual = await provider.createStore(storeModelWithoutReference);
      var matcher = storeModel;
      var actualStatus = provider.status;
      var matcherStatus = StoreStatus.Created;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });

    test('Read store (Get Store)', () async {
      when(collectionReference.doc(uid)).thenReturn(documentReference);
      when(documentReference.get()).thenAnswer((_) async => documentSnapshot);
      when(documentSnapshot.data()).thenReturn(storeModel.toJson());
      when(documentSnapshot.reference).thenReturn(documentReference);
      var actual = await provider.readStore(uid);
      var matcher = storeModel;
      var actualStatus = provider.status;
      var matcherStatus = StoreStatus.Active;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });

    test('Update store', () async {
      var actual = await provider.updateStore(updatedStoreModel);
      var matcher = storeModel.copyWith(title: 'naoteste');
      var actualStatus = provider.status;
      var matcherStatus = StoreStatus.Updated;
      expect(actualStatus, matcherStatus);
      expect(actual, matcher);
    });

    test('Delete store', () async {
      var actual = await provider.deleteStore(storeModel);
      var matcher = StoreStatus.Deleted;
      var actualStatus = provider.status;
      var matcherStatus = StoreStatus.Deleted;
      expect(actualStatus, matcherStatus);
      expectLater(actual, matcher);
    });
  }, skip: false);

  group('Store Provider > Product CRUD', () {

  });
}
