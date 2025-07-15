import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  const StarRating({super.key, required this.onRatingChanged});

  final Function(int)? onRatingChanged;

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int rating = 0;
  final int starCount = 10;

  Widget buildStar(int index) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton(
        onPressed: () {

         setState(() {
          rating = index + 1;
        });

        if(widget.onRatingChanged != null) {
          widget.onRatingChanged!(rating);
        }
        },
        icon: Icon(
          Icons.star,
          size: 18,
          color: index < rating ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(starCount, (index) => buildStar(index)),
    );
  }
}
