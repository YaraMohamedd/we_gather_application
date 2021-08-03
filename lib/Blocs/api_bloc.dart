import 'package:rxdart/rxdart.dart';
import 'package:we_gather_application/Models/most_sharing_model.dart';
import 'package:we_gather_application/Repositories/wander_guide_repository.dart';

class SharingBlock{
  final _repository = Repository();
  final _sharingFetcher = PublishSubject<MostSharing>();

  Stream<MostSharing> get topsharing=> _sharingFetcher.stream;
  getTopsharing() async {
    MostSharing data = await _repository.getTopSharing();
    _sharingFetcher.sink.add(data);
  }
  dispose() {
    _sharingFetcher.close();
  }
}
final bloc = SharingBlock();