import 'package:flutter/material.dart';
import 'package:news/models/article.dart';
import 'package:news/widgets/custom_tag.dart';

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({

    Key? key,
    required this.article
  }) : super(key: key);

final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15 ,),

          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  'News',
                  style: Theme.of (context).textTheme.bodyMedium!. copyWith(
                    color: Colors.white,
                  ),
                ), // Text
              ]

          ),

          Text(
            article.title,
            style: Theme.of (context).textTheme.headlineSmall!. copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),

          ),

          SizedBox(height: 20,),





        ],

      ),
    );
  }
}
