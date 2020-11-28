import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/request_provider.dart';
import 'package:meta/meta.dart';

class RequestRepository {

final RequestProvider provider;

RequestRepository({@required this.provider}) : assert(provider != null);

  Future<Stream<QuerySnapshot>> getStream() => provider.getRequests();

//TODO: Implement request_rep
}