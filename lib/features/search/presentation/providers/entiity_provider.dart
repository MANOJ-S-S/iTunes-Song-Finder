


import 'package:flutter_riverpod/flutter_riverpod.dart';



enum ItemType { album, podcast, song, ebook , musicVideo, movieArtist }


class SelectedItemsNotifier extends StateNotifier<Set<ItemType>> {
  SelectedItemsNotifier() : super(<ItemType>{});


  void toggleItem(ItemType item) {
    state = state.contains(item) ? state.difference({item}) : state.union({item});
  }


  void deleteEntityItem(ItemType item) {
    state =   state.difference({item});
  }
}


final selectedItemsProvider = StateNotifierProvider<SelectedItemsNotifier, Set<ItemType>>(
      (ref) {
    return SelectedItemsNotifier();
  },
);

