

class Results {
  Results({
    String? wrapperType,
    String? kind,
    num? artistId,
    num? collectionId,
    String? description,
    num? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? feedUrl,
    String? trackViewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    num? collectionPrice,
    num? trackPrice,
    num? collectionHdPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    num? trackCount,
    num? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    String? contentAdvisoryRating,
    String? artworkUrl600,
    List<String>? genreIds,
    List<String>? genres,}){
    _wrapperType = wrapperType;
    _kind = kind;
    _artistId = artistId;
    _collectionId = collectionId;
    _description = description;
    _trackId = trackId;
    _artistName = artistName;
    _collectionName = collectionName;
    _trackName = trackName;
    _collectionCensoredName = collectionCensoredName;
    _trackCensoredName = trackCensoredName;
    _artistViewUrl = artistViewUrl;
    _collectionViewUrl = collectionViewUrl;
    _feedUrl = feedUrl;
    _trackViewUrl = trackViewUrl;
    _artworkUrl30 = artworkUrl30;
    _artworkUrl60 = artworkUrl60;
    _artworkUrl100 = artworkUrl100;
    _collectionPrice = collectionPrice;
    _trackPrice = trackPrice;
    _collectionHdPrice = collectionHdPrice;
    _releaseDate = releaseDate;
    _collectionExplicitness = collectionExplicitness;
    _trackExplicitness = trackExplicitness;
    _trackCount = trackCount;
    _trackTimeMillis = trackTimeMillis;
    _country = country;
    _currency = currency;
    _primaryGenreName = primaryGenreName;
    _contentAdvisoryRating = contentAdvisoryRating;
    _artworkUrl600 = artworkUrl600;
    _genreIds = genreIds;
    _genres = genres;
  }

  Results.fromJson(dynamic json) {
    _wrapperType = json['wrapperType'];
    _kind = json['kind'];
    _artistId = json['artistId'];
    _collectionId = json['collectionId'];
    _description = json['description'];
    _trackId = json['trackId'];
    _artistName = json['artistName'];
    _collectionName = json['collectionName'];
    _trackName = json['trackName'];
    _collectionCensoredName = json['collectionCensoredName'];
    _trackCensoredName = json['trackCensoredName'];
    _artistViewUrl = json['artistViewUrl'];
    _collectionViewUrl = json['collectionViewUrl'];
    _feedUrl = json['feedUrl'];
    _trackViewUrl = json['trackViewUrl'];
    _artworkUrl30 = json['artworkUrl30'];
    _artworkUrl60 = json['artworkUrl60'];
    _artworkUrl100 = json['artworkUrl100'];
    _collectionPrice = json['collectionPrice'];
    _trackPrice = json['trackPrice'];
    _collectionHdPrice = json['collectionHdPrice'];
    _releaseDate = json['releaseDate'];
    _collectionExplicitness = json['collectionExplicitness'];
    _trackExplicitness = json['trackExplicitness'];
    _trackCount = json['trackCount'];
    _trackTimeMillis = json['trackTimeMillis'];
    _country = json['country'];
    _currency = json['currency'];
    _primaryGenreName = json['primaryGenreName'];
    _contentAdvisoryRating = json['contentAdvisoryRating'];
    _artworkUrl600 = json['artworkUrl600'];
    _genreIds = json['genreIds'] != null ? json['genreIds'].cast<String>() : [];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
  }
  String? _wrapperType;
  String? _kind;
  num? _artistId;
  num? _collectionId;
  num? _trackId;
  String? _artistName;
  String? _collectionName;
  String? _description;
  String? _trackName;
  String? _collectionCensoredName;
  String? _trackCensoredName;
  String? _artistViewUrl;
  String? _collectionViewUrl;
  String? _feedUrl;
  String? _trackViewUrl;
  String? _artworkUrl30;
  String? _artworkUrl60;
  String? _artworkUrl100;
  num? _collectionPrice;
  num? _trackPrice;
  num? _collectionHdPrice;
  String? _releaseDate;
  String? _collectionExplicitness;
  String? _trackExplicitness;
  num? _trackCount;
  num? _trackTimeMillis;
  String? _country;
  String? _currency;
  String? _primaryGenreName;
  String? _contentAdvisoryRating;
  String? _artworkUrl600;
  List<String>? _genreIds;
  List<String>? _genres;
  Results copyWith({  String? wrapperType,
    String? kind,
    num? artistId,
    num? collectionId,
    String? description,
    num? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? feedUrl,
    String? trackViewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    num? collectionPrice,
    num? trackPrice,
    num? collectionHdPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    num? trackCount,
    num? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    String? contentAdvisoryRating,
    String? artworkUrl600,
    List<String>? genreIds,
    List<String>? genres,
  }) => Results(  wrapperType: wrapperType ?? _wrapperType,
    kind: kind ?? _kind,
    artistId: artistId ?? _artistId,
    collectionId: collectionId ?? _collectionId,
    description: description ?? _description,
    trackId: trackId ?? _trackId,
    artistName: artistName ?? _artistName,
    collectionName: collectionName ?? _collectionName,
    trackName: trackName ?? _trackName,
    collectionCensoredName: collectionCensoredName ?? _collectionCensoredName,
    trackCensoredName: trackCensoredName ?? _trackCensoredName,
    artistViewUrl: artistViewUrl ?? _artistViewUrl,
    collectionViewUrl: collectionViewUrl ?? _collectionViewUrl,
    feedUrl: feedUrl ?? _feedUrl,
    trackViewUrl: trackViewUrl ?? _trackViewUrl,
    artworkUrl30: artworkUrl30 ?? _artworkUrl30,
    artworkUrl60: artworkUrl60 ?? _artworkUrl60,
    artworkUrl100: artworkUrl100 ?? _artworkUrl100,
    collectionPrice: collectionPrice ?? _collectionPrice,
    trackPrice: trackPrice ?? _trackPrice,
    collectionHdPrice: collectionHdPrice ?? _collectionHdPrice,
    releaseDate: releaseDate ?? _releaseDate,
    collectionExplicitness: collectionExplicitness ?? _collectionExplicitness,
    trackExplicitness: trackExplicitness ?? _trackExplicitness,
    trackCount: trackCount ?? _trackCount,
    trackTimeMillis: trackTimeMillis ?? _trackTimeMillis,
    country: country ?? _country,
    currency: currency ?? _currency,
    primaryGenreName: primaryGenreName ?? _primaryGenreName,
    contentAdvisoryRating: contentAdvisoryRating ?? _contentAdvisoryRating,
    artworkUrl600: artworkUrl600 ?? _artworkUrl600,
    genreIds: genreIds ?? _genreIds,
    genres: genres ?? _genres,
  );
  String? get wrapperType => _wrapperType;
  String? get kind => _kind;
  num? get artistId => _artistId;
  num? get collectionId => _collectionId;
  String? get description => _description;
  num? get trackId => _trackId;
  String? get artistName => _artistName;
  String? get collectionName => _collectionName;
  String? get trackName => _trackName;
  String? get collectionCensoredName => _collectionCensoredName;
  String? get trackCensoredName => _trackCensoredName;
  String? get artistViewUrl => _artistViewUrl;
  String? get collectionViewUrl => _collectionViewUrl;
  String? get feedUrl => _feedUrl;
  String? get trackViewUrl => _trackViewUrl;
  String? get artworkUrl30 => _artworkUrl30;
  String? get artworkUrl60 => _artworkUrl60;
  String? get artworkUrl100 => _artworkUrl100;
  num? get collectionPrice => _collectionPrice;
  num? get trackPrice => _trackPrice;
  num? get collectionHdPrice => _collectionHdPrice;
  String? get releaseDate => _releaseDate;
  String? get collectionExplicitness => _collectionExplicitness;
  String? get trackExplicitness => _trackExplicitness;
  num? get trackCount => _trackCount;
  num? get trackTimeMillis => _trackTimeMillis;
  String? get country => _country;
  String? get currency => _currency;
  String? get primaryGenreName => _primaryGenreName;
  String? get contentAdvisoryRating => _contentAdvisoryRating;
  String? get artworkUrl600 => _artworkUrl600;
  List<String>? get genreIds => _genreIds;
  List<String>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wrapperType'] = _wrapperType;
    map['kind'] = _kind;
    map['artistId'] = _artistId;
    map['collectionId'] = _collectionId;
    map['description'] = _description;
    map['trackId'] = _trackId;
    map['artistName'] = _artistName;
    map['collectionName'] = _collectionName;
    map['trackName'] = _trackName;
    map['collectionCensoredName'] = _collectionCensoredName;
    map['trackCensoredName'] = _trackCensoredName;
    map['artistViewUrl'] = _artistViewUrl;
    map['collectionViewUrl'] = _collectionViewUrl;
    map['feedUrl'] = _feedUrl;
    map['trackViewUrl'] = _trackViewUrl;
    map['artworkUrl30'] = _artworkUrl30;
    map['artworkUrl60'] = _artworkUrl60;
    map['artworkUrl100'] = _artworkUrl100;
    map['collectionPrice'] = _collectionPrice;
    map['trackPrice'] = _trackPrice;
    map['collectionHdPrice'] = _collectionHdPrice;
    map['releaseDate'] = _releaseDate;
    map['collectionExplicitness'] = _collectionExplicitness;
    map['trackExplicitness'] = _trackExplicitness;
    map['trackCount'] = _trackCount;
    map['trackTimeMillis'] = _trackTimeMillis;
    map['country'] = _country;
    map['currency'] = _currency;
    map['primaryGenreName'] = _primaryGenreName;
    map['contentAdvisoryRating'] = _contentAdvisoryRating;
    map['artworkUrl600'] = _artworkUrl600;
    map['genreIds'] = _genreIds;
    map['genres'] = _genres;
    return map;
  }

}