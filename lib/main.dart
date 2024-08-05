import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_song_finder/core/utils/app_colors.dart';
import 'package:itunes_song_finder/core/utils/common_strings.dart';
import 'package:itunes_song_finder/core/utils/size_config.dart';
import 'package:itunes_song_finder/features/search/presentation/providers/entiity_provider.dart';
import 'package:itunes_song_finder/features/search/presentation/providers/search_provider.dart';
import 'package:itunes_song_finder/features/search/presentation/screens/entity_list_screen.dart';
import 'package:itunes_song_finder/features/search/presentation/screens/search_items_list_screen.dart';

import 'features/search/presentation/appwidgets/home_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(  const ProviderScope(
  child: MyApp(),
  ),);
}

/* Main widget that contains the Flutter starter app. */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //initialize singleton size config to support dynamic screen size
    SizeConfig.instance.init(context);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _jailbroken = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: detectIfDeviceIsRooted(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
           if(snapshot.requireData == false){
             return GestureDetector(
               onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
               child: const Scaffold(
                 resizeToAvoidBottomInset: false,
                 extendBodyBehindAppBar: true,
                 backgroundColor: Colors.transparent,
                 body: AppLogoContainer(),
               ),
             );
           }
           else {
             showDialog(
               context: context,
               barrierDismissible: false,
               builder: (_) => AlertDialog(
                 backgroundColor: Colors.white,
                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                 insetPadding: EdgeInsets.zero,
                 contentPadding: EdgeInsets.zero,
                 content: SizedBox(
                   height: SizeConfig.size300,
                   width: SizeConfig.size300,
                   child:  Text(AppStrings.rootedMsg,
                       style: TextStyle(
                           color: Colors.white70, fontSize: SizeConfig.size18)),
                 ),
               ),
             );
           }

         }
        return const SizedBox();
      },
    );
  }

  Future<bool> detectIfDeviceIsRooted() async{
    try {
      _jailbroken = await FlutterJailbreakDetection.jailbroken;
      debugPrint('jailbroken status $_jailbroken');
      return _jailbroken;
    } on PlatformException {
      _jailbroken = true;
      debugPrint('jailbroken status $_jailbroken');
      return _jailbroken;
    }
  }
}


class AppLogoContainer extends StatefulWidget {
  const AppLogoContainer({super.key});

  @override
  State<AppLogoContainer> createState() => _AppLogoContainerState();
}

class _AppLogoContainerState extends State<AppLogoContainer> {
  static final _text = TextEditingController();
  bool _error = false;
  bool isAlbumSelected = false;
  bool isMovieSelected = false;
  bool isMusicVideoSelected = false;
  bool isSongSelected = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void validateText() {
    setState(() {
      _text.text.isEmpty ? _error = true : _error = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white12, Colors.black26],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp),
      ),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.size150,
            left: SizeConfig.size20,
            right: SizeConfig.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(SizeConfig.ra38)),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'images/logo.png',
                colorBlendMode: BlendMode.darken,
                width: SizeConfig.size72,
                height: SizeConfig.size72,
                fit: BoxFit.cover,
              ),
            ),
            Text(AppStrings.appTitle,
                style: TextStyle(
                    color: Colors.white70, fontSize: SizeConfig.size20)),
            SizedBox(
              height: SizeConfig.size20,
            ),
            Text(AppStrings.appDesc,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: SizeConfig.size18,
                    height: 1.2)),
            SizedBox(
              height: SizeConfig.size20,
            ),
            buildSearchField(),
            SizedBox(
              height: SizeConfig.size20,
            ),
            Text(AppStrings.searchDesc,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: SizeConfig.size16,
                    height: 1.2)),
            SizedBox(
              height: SizeConfig.size30,
            ),
         const ChipViewContainer(),
            SizedBox(
              height: SizeConfig.size30,
            ),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.size50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    )
                ),
               onPressed: () {
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context) => const SearchItemsListScreen()
                       ));
               },
               child: Text(AppStrings.submit,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: SizeConfig.size16,
                    height: 1.2)),
                            ),
            )
          ],
        ),
      ),
    );
    return titleSection;
  }

  Consumer buildSearchField() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return TextField(
          controller: _text,
          cursorColor: AppColors.focusColor,
          onEditingComplete: () => validateText(),
          onChanged: (value) => {
          ref.read(searchTermProvider.notifier).setSearchTermToProvider(value)
          },
          style: const TextStyle(color: Colors.white70, height: 1.2),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(SizeConfig.size20)),
                  borderSide: const BorderSide(color: AppColors.bgColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(SizeConfig.size20)),
                  borderSide: const BorderSide(color: AppColors.bgColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(SizeConfig.size20)),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(SizeConfig.size20)),
                  borderSide: const BorderSide(color: Colors.red)),
              // <-- change color
              hintText: 'Type to search',
              hintStyle: const TextStyle(color: Colors.white30),
              errorText: _error ? 'search item cannot be empty' : null,
              errorStyle: const TextStyle(color: Colors.white, height: 1.2)),
        );
      },
    );
  }

}


class ChipViewContainer extends ConsumerWidget {
  const ChipViewContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsProvider);

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => const EntityListScreen()
            ));
      },
      child: Container(
        width: double.infinity,
        height: SizeConfig.size150,
        padding: const EdgeInsets.all(5),
        color: Colors.white10,
        child: Wrap(
          children: [
            Wrap(
              runSpacing: 10,
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children:
              selectedItems.map((item) {
                return ParameterSelectionChip(
                  title: item.toString().split('.').last,
                  deleteFunction: () => ref.read(selectedItemsProvider.notifier).deleteEntityItem(item),
                );
              }).toList(),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const EntityListScreen()
                    ));
              },

              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.size2Width, right:  SizeConfig.size2Width),
                child: Text(selectedItems.isNotEmpty? AppStrings.viewMore : AppStrings.addEntities,
                    style: TextStyle(
                        decoration: selectedItems.isNotEmpty? TextDecoration.underline: null,
                        decorationColor: selectedItems.isNotEmpty? Colors.white70: null,
                        color: Colors.white70,
                        fontSize: SizeConfig.size18,
                        height: 1.2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
