import 'package:flutter/material.dart';

import '../models/article.dart';
import '../screens/article_screen.dart';
import 'custom_tag.dart';
import 'image_container.dart';

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    Key? key,
    required this.article


  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of (context). size.height * 0.45,
      width: double.infinity,
      imageUrl: article.imageUrl,
      padding: const EdgeInsets.all (20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
                backgroundColor: Colors.grey.withAlpha(150),
                children: [
                  Text(
                    'News of the Day',
                    style: Theme.of (context).textTheme.bodyMedium!. copyWith(
                      color: Colors.white,
                    ),
                  ), // Text
                ]

            ),


            const SizedBox (height: 10),
            Text (
              article.title,
              style: Theme.of (context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                  color: Colors.white
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    ArticleScreen.routeName,
                    arguments: article
                );


              },
              child: Row(
                children: [
                  Text(
                    'learn More',

                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white
                    ),




                  ),
                  const SizedBox (width: 10),
                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  )
                ],
              ),

            )

          ]

      ), // Column


    );
  }
}
