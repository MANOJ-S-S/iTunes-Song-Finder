import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes_song_finder/core/utils/common_strings.dart';
import 'package:itunes_song_finder/features/search/domain/entities/album.dart';
import 'package:itunes_song_finder/features/search/domain/entities/artist.dart';
import 'package:itunes_song_finder/features/search/domain/entities/music_video.dart';
import 'package:itunes_song_finder/features/search/domain/entities/podcast.dart';
import 'package:itunes_song_finder/features/search/domain/entities/results.dart';
import 'package:itunes_song_finder/features/search/domain/entities/song.dart';
import 'package:itunes_song_finder/features/search/presentation/screens/detail_screen.dart';
import '../../../../core/utils/size_config.dart';
import '../../domain/entities/ebook.dart';
import '../providers/search_provider.dart';

class SearchItemsListScreen extends StatelessWidget {
  const SearchItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    home: DefaultTabController(
    length: 2,
      child: Scaffold(

          appBar: AppBar(
              leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70,), onPressed: () {
                Navigator.pop(context);
              },),
              centerTitle: true,
              title: Text('iTunes',
                  style:
                  TextStyle(color: Colors.white70, fontSize: SizeConfig.size20)),
          backgroundColor: Colors.black45,
          bottom: const TabBar(
            labelColor: Colors.black45,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.white,
            dividerHeight: 2,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Tab(text: '  List Layout  '),
              Tab(text: '  Grid Layout  '),
            ],
          ),
        ),
        backgroundColor: Colors.black45,
        body: const TabBarView(
              children: [
              ListViewScreen(), // List View tab
              GridViewScreen(), // Grid View tab
        ],
      ),
      ),
    ));
  }
}

class GridViewScreen extends ConsumerWidget{
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchDataAsyncValue = ref.watch(someDataProvider);

    return searchDataAsyncValue.when(
      data: (searchData) {
        if (searchData.isNotEmpty) {
          var artist = searchData.firstWhere((item) => item is Artist,
              orElse: () => null) as Artist?;
          var ebook = searchData.firstWhere((item) => item is Ebook,
              orElse: () => null) as Ebook?;
          var song = searchData.firstWhere((item) => item is Song,
              orElse: () => null) as Song?;
          var podcast = searchData.firstWhere((item) => item is Podcast,
              orElse: () => null) as Podcast?;
          var musicVideo = searchData.firstWhere((item) => item is MusicVideo,
              orElse: () => null) as MusicVideo?;
          var album = searchData.firstWhere((item) => item is Album,
              orElse: () => null) as Album?;
        return SingleChildScrollView(
          child: Column(
            children: [
              if (album != null)
                Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.white38,
                  child: Text('Albums',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: SizeConfig.size16,
                          height: 1.2)),
                ),
              if (album != null)
                SizedBox(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size300
                    ),
                    shrinkWrap: true,
                    itemCount: album.resultCount,
                    itemBuilder: (context, index) {
                      return ContentTileGridView(results: album.results![index]);
                    },
                  ),
                ),
           if (artist != null)
          Container(
          padding: EdgeInsets.all(6),
          width: double.infinity,
          color: Colors.white38,
          child: Text('Artists',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize:  SizeConfig.size16,
                  height: 1.2)),
        ),
          if (artist != null)
           SizedBox(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size65
                      ),
                      shrinkWrap: true,

                      itemCount: artist.resultCount,
                      itemBuilder: (context, index) {
                        return ContentTileGridView(results: artist.results![index]);
                      },
                   ),
                   ),
              if (ebook != null)
              Container(
                padding: EdgeInsets.all(6),
                width: double.infinity,
                color: Colors.white38,
                child: Text('Ebooks',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: SizeConfig.size16,
                        height: 1.2)),
              ),
              if (ebook != null)
              SizedBox(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size300
                      ),
                      shrinkWrap: true,
                      itemCount: ebook.resultCount,
                      itemBuilder: (context, index) {
                        return ContentTileGridView(results: ebook.results![index]);
                      },
                    ),
                  ),
              if (musicVideo != null)
                Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.white38,
                  child: Text('Music Videos',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: SizeConfig.size16,
                          height: 1.2)),
                ),
              if (musicVideo != null)
                SizedBox(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size300
                    ),
                    shrinkWrap: true,
                    itemCount: musicVideo.resultCount,
                    itemBuilder: (context, index) {
                      return ContentTileGridView(results: musicVideo.results![index]);
                    },
                  ),
                ),
              if (podcast != null)
                Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.white38,
                  child: Text('Podcasts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: SizeConfig.size16,
                          height: 1.2)),
                ),
              if (podcast != null)
                SizedBox(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size300
                    ),
                    shrinkWrap: true,
                    itemCount: podcast.resultCount,
                    itemBuilder: (context, index) {
                      return ContentTileGridView(results: podcast.results![index]);
                    },
                  ),
                ),
              if (song != null)
                Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  color: Colors.white38,
                  child: Text('Songs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: SizeConfig.size16,
                          height: 1.2)),
                ),
              if (song != null)
                SizedBox(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: SizeConfig.size5,
                        mainAxisSpacing: SizeConfig.size5,
                        mainAxisExtent: SizeConfig.size300
                    ),
                    shrinkWrap: true,
                    itemCount: song.resultCount,
                    itemBuilder: (context, index) {
                      return ContentTileGridView(results: song.results![index]);
                    },
                  ),
                ),
         ] ),
        );


        } else {
          return Text('No data available',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize:  SizeConfig.size16,
              height: 1.2));
        }
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(AppStrings.internetError, style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
            fontSize:  SizeConfig.size16,
            height: 1.2)),
      ),
    );
  }
}

class ListViewScreen extends ConsumerWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchDataAsyncValue = ref.watch(someDataProvider);

    return searchDataAsyncValue.when(
      data: (searchData) {
        if (searchData.isNotEmpty) {
          var artist = searchData.firstWhere((item) => item is Artist,
              orElse: () => null) as Artist?;
          var ebook = searchData.firstWhere((item) => item is Ebook,
              orElse: () => null) as Ebook?;
          var musicVideo = searchData.firstWhere((item) => item is MusicVideo,
              orElse: () => null) as MusicVideo?;
          var podcast = searchData.firstWhere((item) => item is Podcast,
              orElse: () => null) as Podcast?;
          var song = searchData.firstWhere((item) => item is Song,
              orElse: () => null) as Song?;
          var album = searchData.firstWhere((item) => item is Album,
              orElse: () => null) as Album?;

          return ListView(
            children: [
              if(album != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Albums',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize: SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...album.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
              if (artist != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Artists',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize: SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...artist.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
              if (ebook != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConfig.size5),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Ebooks',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize:  SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...ebook.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
              if (musicVideo != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConfig.size5),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Music Videos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize:  SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...musicVideo.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
              if (podcast != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConfig.size5),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Podcasts',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize:  SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...podcast.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
              if (song != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(SizeConfig.size5),
                      width: double.infinity,
                      color: Colors.white38,
                      child: Text('Songs',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize:  SizeConfig.size16,
                              height: 1.2)),
                    ),
                    ...song.results!.map((result) => ContentTile(results: result)),
                  ],
                ),
            ],
          );
        } else {
          return Text(AppStrings.noDataAvailable,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize:  SizeConfig.size16,
              height: 1.2));
        }
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(AppStrings.internetError,style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
            fontSize:  SizeConfig.size16,
            height: 1.2)),
      ),
    );
  }
}

class ContentTile extends StatelessWidget {

  final Results results;

  const ContentTile({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var type = results.wrapperType;
    var kind = results.kind;

    if (type == 'artist') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.size5),
        child: Column(children: [
          Text('${results.artistName}', style: TextStyle(
            color: Colors.yellow.shade300,
            fontSize:  SizeConfig.size16,
            height: 1.2)),
          Text('${results.primaryGenreName}',  style: TextStyle(
            color: Colors.white70,
            fontSize:  SizeConfig.size16,
            height: 1.2))
        ]),
      );
    }
    else {
      if (results.artworkUrl100 == null || results.artworkUrl100!.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Placeholder(
                fallbackWidth: SizeConfig.size100,
                fallbackHeight: SizeConfig.size150,
              ),
            ],
          ),
        );
      }
      else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>  DetailScreen(result: results)
                  ));
            },
            child: Row(
              children: [
                Image.network(
                  results.artworkUrl100!,
                  width: SizeConfig.size100,
                  height: SizeConfig.size150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Optional: Handle error when image fails to load
                    return Icon(Icons.error,
                        size: SizeConfig.size18, color: Colors.red);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      width: SizeConfig.size200,
                      child: Text('${results.trackName}',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: SizeConfig.size16,
                              height: 1.2),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,),
                    ),
                    Container(
                      width: SizeConfig.size200,
                      child: Text('${results.artistName}',
                          style: TextStyle(
                              color: Colors.yellow.shade300,
                              fontSize: SizeConfig.size16,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,),
                    )
                  ]),
                )
              ],
            ),
          ),
        );
      }
    }
  }
}

class ContentTileGridView extends StatelessWidget {

  final Results results;

  const ContentTileGridView({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var type = results.wrapperType;
    var kind = results.kind;

    if (type == 'artist') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          Text('${results.artistName}', style: TextStyle(
              color: Colors.yellow.shade300,
              fontSize:  SizeConfig.size16,
              height: 1.2)),
          Text('${results.primaryGenreName}',  style: TextStyle(
              color: Colors.white70,
              fontSize:  SizeConfig.size16,
              height: 1.2))
        ]),
      );
    }
    else  {
      if (results.artworkUrl100 == null || results.artworkUrl100!.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Placeholder(
            fallbackWidth: SizeConfig.size100,
            fallbackHeight: SizeConfig.size150,
          ),
        );
      }
      else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>  DetailScreen(result: results)
                      ));
                },
                child: Image.network(
                  results.artworkUrl100!,
                  width: SizeConfig.size100,
                  height: SizeConfig.size150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Optional: Handle error when image fails to load
                    return Icon(Icons.error,
                        size: SizeConfig.size18, color: Colors.red);
                  },
                ),
              ),
              Text('${results.trackName}',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: SizeConfig.size16,
                    height: 1.2),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
              Text('${results.artistName}',
                  style: TextStyle(
                      color: Colors.yellow.shade300,
                      fontSize: SizeConfig.size16,
                      fontWeight: FontWeight.bold,
                      height: 1.2),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,)
            ],
          ),
        );
      }
    }
  }
}
