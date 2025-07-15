import 'package:flutter/material.dart';
import 'package:tv_show_data/star_rating.dart';
import 'package:tv_show_data/tv_show_model.dart';

class AddTvShowScreen extends StatefulWidget {
  const AddTvShowScreen({
    super.key,
    required this.addNewTvShow,
    required this.backToHome,
  });

  final Function(TvShow value) addNewTvShow;
  final Function() backToHome;

  @override
  State<AddTvShowScreen> createState() => _AddTvShowScreenState();
}

class _AddTvShowScreenState extends State<AddTvShowScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final streamController = TextEditingController();
  final summaryController = TextEditingController();
  var rating = 0;

  @override
  Widget build(BuildContext context) {
    void submit() {
      if (formKey.currentState!.validate()) {
        final newTvShow = TvShow(
          title: titleController.text,
          stream: streamController.text,
          rating: rating,
          summary: summaryController.text,
        );

        widget.addNewTvShow(newTvShow);
        widget.backToHome();
      }
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Adicionar série',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Título é obrigatório';
                    }

                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: streamController,
                  decoration: InputDecoration(
                    labelText: 'Streamer',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Streamer é obrigatório';
                    }

                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),

                TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  controller: summaryController,
                  decoration: InputDecoration(
                    labelText: 'Resumo',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Resumo é obrigatório';
                    }

                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nota', style: TextStyle(fontSize: 16)),
                      StarRating(
                        onRatingChanged: (internalRating) {
                          setState(() {
                            rating = internalRating;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: submit,
                  child: Text(
                    'SALVAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
