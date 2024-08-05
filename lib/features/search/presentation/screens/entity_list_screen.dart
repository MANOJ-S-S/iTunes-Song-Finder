

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_song_finder/core/utils/constants.dart';

import '../../../../core/utils/size_config.dart';
import '../providers/entiity_provider.dart';


class EntityListScreen extends ConsumerWidget {
  const EntityListScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70,), onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text('Media',
            style:
                TextStyle(color: Colors.white70, fontSize: SizeConfig.size20)),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white12, Colors.black26],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp),
          ),
          child: ListView(
          children: ItemType.values.map((item) {
              final isSelected = selectedItems.contains(item);
              return ListTile(
                title: Text(item.toString().split('.').last.captitalize(), style: const TextStyle(color: Colors.white70),),
                trailing: Icon(isSelected ? Icons.check_box : Icons.check_box_outline_blank,color: Colors.white70,),
              onTap: () => ref.read(selectedItemsProvider.notifier).toggleItem(item),
              );
            }).toList(),
          ),
      ),
    );
  }
}
