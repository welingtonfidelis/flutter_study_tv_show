import 'package:flutter/material.dart';
import 'package:tv_show_data/tv_show_card.dart';
import 'package:tv_show_data/tv_show_model.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key, required this.tvShows});

  final List<TvShow> tvShows;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tvShows.length,
      itemBuilder: (context, index) =>
          TvShowCard(tvShow: widget.tvShows[index], index: index),
    );
  }
}
