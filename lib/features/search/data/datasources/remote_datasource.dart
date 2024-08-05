

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:itunes_song_finder/core/utils/common_strings.dart';
import 'package:itunes_song_finder/features/search/domain/entities/artist.dart';
import 'package:itunes_song_finder/features/search/domain/entities/music_video.dart';
import 'package:itunes_song_finder/features/search/domain/entities/podcast.dart';
import 'package:itunes_song_finder/features/search/presentation/providers/entiity_provider.dart';

import '../../../../core/network/secure_http_client.dart';
import '../../domain/entities/album.dart';
import '../../domain/entities/ebook.dart';
import '../../domain/entities/song.dart';

class RemoteDataSource {

  final PinnedHttpClient _secureClient;

  RemoteDataSource(this._secureClient);

    Future<List> fetchSearchData(Set<ItemType> selectedEntities, String searchTerm) async {

      debugPrint('My search term $searchTerm');

    List entityList = [];
    Artist artist;
    Ebook ebook;
    Album album;
    MusicVideo musicVideo;
    Podcast podcast;
    Song song;

    for (ItemType entity in selectedEntities) {
      final response = await _secureClient.get(Uri.parse('${AppStrings.baseUrl}'
          '&term=$searchTerm&entity=${entity.name}&limit=25'));
      String responseBody;
      try{
        if (response.statusCode == 200) {
          responseBody = response.body;
          debugPrint('Response: $responseBody');
          Map<String,dynamic> responseJson = json.decode(responseBody);
          if(entity.name == ItemType.movieArtist.name) {
            artist = Artist.fromJson(responseJson);
            entityList.add(artist);
          }
          else if(entity.name == ItemType.ebook.name)  {
            ebook = Ebook.fromJson(responseJson);
            entityList.add(ebook);
          }
          else if(entity.name == ItemType.album.name)  {
            album = Album.fromJson(responseJson);
            entityList.add(album);
          }
          else if(entity.name == ItemType.musicVideo.name)  {
            musicVideo = MusicVideo.fromJson(responseJson);
            entityList.add(musicVideo);
          }
          else if(entity.name == ItemType.podcast.name)  {
            podcast = Podcast.fromJson(responseJson);
            entityList.add(podcast);
          }
          else if(entity.name == ItemType.song.name)  {
            song = Song.fromJson(responseJson);
            entityList.add(song);
          }
        } else {
          debugPrint('Request failed with status: ${response.statusCode}');
        }
      }
      catch (e) {
        debugPrint('An error occurred: $e');
      }
    }
    return entityList;
  }
}

