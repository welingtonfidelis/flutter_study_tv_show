import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_data/tv_show_card.dart';
import 'package:tv_show_data/tv_show_model.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    // var model = Provider.of<TvShowModel>(context, listen: false);
    var model = context.watch<TvShowModel>();
    var tvShows = model.tvShows;

    return ListView.builder(
      itemCount: tvShows.length,
      itemBuilder: (context, index) => Consumer<TvShowModel>(
        builder: (context, model, child) =>
            TvShowCard(tvShow: model.tvShows[index], index: index),
      ),
    );
  }
}
