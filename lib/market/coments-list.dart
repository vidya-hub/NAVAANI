import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:navaninew/market/colors.dart';

class CommentsList extends StatefulWidget {
  @override
  CommentsListState createState() => CommentsListState();
}

class CommentsListState extends State<CommentsList> {
  List comments = [
    {
      'title': 'Helen Morre',
      'rating': 3,
      'date': 'June 5, 2019',
      'comment':
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
    },
    {
      'title': 'Helen Morre',
      'rating': 3,
      'date': 'June 5, 2019',
      'comment':
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
    },
    {
      'title': 'Helen Morre',
      'rating': 3,
      'date': 'June 5, 2019',
      'comment':
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
    },
    {
      'title': 'Helen Morre',
      'rating': 3,
      'date': 'June 5, 2019',
      'comment':
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
    },
    {
      'title': 'Helen Morre',
      'rating': 3,
      'date': 'June 5, 2019',
      'comment':
          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."
    },
  ];

  List<Widget> createComents() {
    List<Widget> rets = [];
    comments.forEach((item) {
      rets.add(
        Card(
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.only(
                top: 23.35, left: 18.0, right: 18.0, bottom: 31.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item['title'],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: 8.86,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                RatingBar(
                  initialRating: 3,
                  itemSize: 15.0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: ThemeColor.FILL,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                ),
                Text(item['date'], style: TextStyle(color: ThemeColor.FILL)),
              ]),
              SizedBox(
                height: 11.0,
              ),
              Text(item['comment'],
                  style: Theme.of(context).textTheme.bodyText1),
            ]),
          ),
        ),
      );
    });
    return rets;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(createComents()),
      ),
    );
  }
}
