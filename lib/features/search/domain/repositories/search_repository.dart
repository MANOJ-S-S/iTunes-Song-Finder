

import 'package:itunes_song_finder/features/search/presentation/providers/entiity_provider.dart';


abstract class SearchRepository {

  Future<List> getSearchData(Set<ItemType> selectedEntities, String searchTerm);
}