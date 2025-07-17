import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tv_show_data/rating_widget.dart';
import 'package:tv_show_data/tv_show_model.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({super.key, required this.tvShow, required this.index});

  final TvShow tvShow;
  final int index;

  @override
  Widget build(BuildContext context) {
    var colorSchema = Theme.of(context).colorScheme;
    var model = context.read<TvShowModel>();

    void handleRemoveTvShow() {
      model.removeTvShow(tvShow);
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${tvShow.title} removido'),
          duration: Duration(seconds: 4),
          action: SnackBarAction(
            label: 'DEFAZER',
            onPressed: () {
              model.addNewTvShowOnIndex(tvShow, index);
            },
          ),
        ),
      );
    }

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorSchema.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(
              color: colorSchema.onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          tvShow.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tvShow.stream,
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        trailing: ratingWidget(number: tvShow.rating),
        onTap: () => {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(tvShow.title),
              content: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Streaming: ${tvShow.stream}'),
                  Text('Rating: ${tvShow.rating}'),
                  Text(tvShow.summary),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: handleRemoveTvShow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorSchema.onError,
                    // foregroundColor: colorSchema.onPrimary,
                  ),
                  child: Text(
                    'Remover',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorSchema.primary,
                    foregroundColor: colorSchema.onPrimary,
                  ),
                  child: Text(
                    'Fechar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        },
      ),
    );
  }
}
