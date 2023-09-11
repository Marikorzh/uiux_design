import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // big star
        Container(
          height: 170,
          child: Stack(alignment: Alignment.topCenter, children: [
            Image.asset(
              "assets/favoritePage/star.png",
            ),
            Center(
                child: Text(
              "My\nfavorite\nrestaurants",
              textAlign: TextAlign.center,
            ))
          ]),
        ),

        //empty place
        SizedBox(height: 20,),

        //list with restaurants
        ItemList("assets/favoritePage/rest1.png", "Pizza Italiano", "★4\\5"),
        ItemList("assets/favoritePage/rest2.png", "Traditional Kebab ", "★2\\5"),
        ItemList("assets/favoritePage/rest3.png", "Star Fish", "★4\\5"),
        ItemList("assets/favoritePage/rest4.png", "Boston Burger’s", "★3\\5"),
      ],
    );
  }

  Widget ItemList(String path, String name, String mark){
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          leading: Container(
              padding: EdgeInsets.only(left: 20),
              child: Image.asset(path)),
          title: Text(
            name,
          ),
          trailing: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.lightGreenAccent.shade200,
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              mark,
              style: TextStyle(color: Colors.green.shade900),
            ),
          ),
        ),
      ),
    );
  }
}
