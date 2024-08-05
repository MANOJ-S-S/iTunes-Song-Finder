

import 'package:itunes_song_finder/features/search/domain/usecases/search_usecase.dart';
import 'package:itunes_song_finder/main.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/network/secure_http_client.dart';
import '../../../../core/utils/common_strings.dart';
import '../../data/datasources/remote_datasource.dart';
import '../../data/repositories/search_repository_impl.dart';
import 'entiity_provider.dart';


final secureClientProvider = Provider((ref) => PinnedHttpClient(AppStrings.pinnedPublicKeyBase64));
final remoteDataSourceProvider = Provider((ref) => RemoteDataSource(ref.watch(secureClientProvider)));
final repositoryProvider = Provider((ref) => SearchRepositoryImpl(ref.watch(remoteDataSourceProvider)));
final searchUseCaseProvider = Provider((ref) => SearchUseCase(ref.watch(repositoryProvider)));


class SearchTermNotifier extends StateNotifier<String> {
  SearchTermNotifier() : super('');


  void setSearchTermToProvider(String searchTerm) {
    state = searchTerm;
  }
}

final searchTermProvider = StateNotifierProvider<SearchTermNotifier,String>(
      (ref) {
    return SearchTermNotifier();
  },
);

final someDataProvider = FutureProvider((ref) async {
  final selectedEntities = ref.watch(selectedItemsProvider);
  final searchUseCase = ref.watch(searchUseCaseProvider);
  final searchTermString = ref.watch(searchTermProvider);
  return await searchUseCase.execute(selectedEntities, searchTermString);
});