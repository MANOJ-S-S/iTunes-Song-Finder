
import 'package:itunes_song_finder/features/search/domain/repositories/search_repository.dart';

import '../../presentation/providers/entiity_provider.dart';
import '../datasources/remote_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final RemoteDataSource _remoteDataSource;

  SearchRepositoryImpl(this._remoteDataSource);

  @override
  Future<List> getSearchData(Set<ItemType> selectedEntities, String searchTerm) async {
    final searchData = await _remoteDataSource.fetchSearchData(selectedEntities, searchTerm);
    return searchData;
  }
}