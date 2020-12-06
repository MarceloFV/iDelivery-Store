import 'package:delivery_store/app/data/provider/request_provider.dart';
import 'package:meta/meta.dart';

class RequestRepository {

final RequestProvider provider;

RequestRepository({@required this.provider}) : assert(provider != null);

getStream(String uid) => provider.requestListStream(uid);

//TODO: Implement request_rep
}