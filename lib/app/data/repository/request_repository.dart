import 'package:delivery_store/app/data/model/request.dart';
import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/provider/request_provider.dart';
import 'package:meta/meta.dart';

class RequestRepository {

final RequestProvider provider;

RequestRepository({@required this.provider}) : assert(provider != null);

Stream<List<RequestModel>> getStream(StoreModel store) => provider.requestStream(store);

}