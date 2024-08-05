


import 'package:itunes_song_finder/features/search/domain/repositories/search_repository.dart';
import 'package:itunes_song_finder/features/search/presentation/providers/entiity_provider.dart';

class SearchUseCase {

  final SearchRepository _repository;

  SearchUseCase(this._repository);

  Future<List> execute(Set<ItemType> selectedEntities, String searchTerm) async {
    return await _repository.getSearchData(selectedEntities, searchTerm);
  }
}