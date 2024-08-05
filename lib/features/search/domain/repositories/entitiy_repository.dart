

import '../../presentation/providers/entiity_provider.dart';

abstract class EntityRepository {

   deleteItem(ItemType item);

  Set<ItemType> getSelectedItem();

   addSelectedItem(ItemType item);

}
