import 'package:flutter/material.dart';
import 'package:tv_show_data/tv_show_data.dart';

class TvShow {
  String title;
  String stream;
  int rating;
  String summary;

  TvShow({
    required this.title,
    required this.stream,
    required this.rating,
    required this.summary,
  });
}

class TvShowModel extends ChangeNotifier {
  final List<TvShow> _tvShows = favTvShowList;

  List<TvShow> get tvShows => _tvShows;

  void addNewTvShow(TvShow newTvShow) {
    tvShows.add(newTvShow);
    notifyListeners();
  }

    void addNewTvShowOnIndex(TvShow newTvShow, int index) {
    tvShows.insert(index, newTvShow);
    notifyListeners();
  }

  void removeTvShow(TvShow tvShowToRemove) {
    tvShows.remove(tvShowToRemove);
    notifyListeners();
  }
}
