import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../screens/search_screen.dart';

class DiscoverNews extends StatefulWidget {
  const DiscoverNews({
    Key? key,
    required this.front_text,
  }) : super(key: key);

  final front_text;

  @override
  State<DiscoverNews> createState() => _DiscoverNewsState();
}

class _DiscoverNewsState extends State<DiscoverNews> {

  Color selected_background_color = Colors.white;
  Color selected_text_color = Colors.black;

  @override
  Widget build(BuildContext context) {

    if(globals.isDarkMode){
      selected_background_color = globals.dark_mode_background;
      selected_text_color = globals.dark_mode_text_color;

    }else{
      selected_background_color = Colors.white;
      selected_text_color = Colors.black;

    }



    return SizedBox(

      height: MediaQuery.of(context).size.height * 0.25,

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            widget.front_text,

            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: selected_text_color
            ),
          ),
          SizedBox(height: 5,),

          Text(
            'News in categories from around the world',

            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: selected_text_color
            ),
          ),

          SizedBox(height: 20,),

          TextFormField(


            onTap: (){
              Navigator.pushNamed(
                  context,
                  SearchScreen.routeName,

              );
              
              // showSearch(context: context, delegate: CustomSearchDelegate());
            },
            decoration: InputDecoration(
                hintText: 'search',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: RotatedBox(

                  quarterTurns: 1,
                  child: const Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none



                )
            ),
          )
        ],

      ),
    );
  }
}
