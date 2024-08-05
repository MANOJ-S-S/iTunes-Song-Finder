import 'package:itunes_song_finder/features/search/domain/entities/results.dart';

class Podcast {
  Podcast({
      int? resultCount,
      List<Results>? results,}){
    _resultCount = resultCount;
    _results = results;
}

  Podcast.fromJson(dynamic json) {
    _resultCount = json['resultCount'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  int? _resultCount;
  List<Results>? _results;
Podcast copyWith({  int? resultCount,
  List<Results>? results,
}) => Podcast(  resultCount: resultCount ?? _resultCount,
  results: results ?? _results,
);
  int? get resultCount => _resultCount;
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCount'] = _resultCount;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}