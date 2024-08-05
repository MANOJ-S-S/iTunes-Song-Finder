
import 'package:itunes_song_finder/features/search/presentation/providers/entiity_provider.dart';

import '../../domain/repositories/entitiy_repository.dart';

class EntityRepositoryImpl implements  EntityRepository {
 late Set<ItemType> selectedItemType;

 EntityRepositoryImpl(){
   selectedItemType = <ItemType>{};
 }

  @override
  Set<ItemType> addSelectedItem(ItemType item) {
    selectedItemType.contains(item)
        ? selectedItemType.difference({item})
        : selectedItemType.union({item});
   return selectedItemType;
  }

  @override
  deleteItem(ItemType item) {
  selectedItemType.difference({item});
  }

  @override
  Set<ItemType> getSelectedItem() {
    return selectedItemType;
  }


}
