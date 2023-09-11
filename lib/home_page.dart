import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:uiux_design/choose_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String placeClient = "Ukraine, Poltava";
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          //button menu, location and photoUser
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu_sharp),
                  iconSize: 40,
                ),
                Row(
                  children: [
                    Icon(Icons.place_outlined, color: Colors.red.shade700),
                    Text(placeClient),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.red.shade700,
                    )
                  ],
                ),
                Image.asset(
                  "assets/mainPage/icons.png",
                  scale: 2,
                ),
              ],
            ),
          ),

          //text with font change
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Delicious Food?\nGo Ahead...",
              style: TextStyle(fontSize: 20),
            ),
          ),

          //row with search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list_sharp),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.orange)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: "Search for your favourite food",
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
          ),

          //logo with promocode
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent.shade200),
            alignment: Alignment.center,
            child: Text(
              "30% Off on your first purchase",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),

          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20),
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              InkWell(
                splashColor: Colors.redAccent.shade200,
                borderRadius: BorderRadius.circular(15),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ChoosePage(); // Замість SecondPage() вставте віджет вашої наступної сторінки.
                    },
                  ));
                },
                child: Image.asset(
                  "assets/mainPage/foodForRectangle/burger.png",
                ),
              ),
              Image.asset(
                "assets/mainPage/foodForRectangle/pizza.png",
              ),
              Image.asset(
                "assets/mainPage/foodForRectangle/pasta.png",
              ),
              Image.asset(
                "assets/mainPage/foodForRectangle/sandwich.png",
              ),
              Image.asset(
                "assets/mainPage/foodForRectangle/fries.png",
              ),
              Image.asset(
                "assets/mainPage/foodForRectangle/kebab.png",
              ),
            ],
          ),

          Column(
            children: <Widget>[
              Text(
                "See more...",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 3), // Додайте простір між текстом і лінією
              Container(
                height: 2, // Товщина лінії
                width: 100, // Довжина лінії
                color: Colors.blue, // Колір лінії
              ),
            ],
          ),

          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20),
            crossAxisCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              circleAndText("assets/mainPage/foodForCircle/vegan.png", "Vegan"),
              circleAndText(
                  "assets/mainPage/foodForCircle/seaFood.png", "Sea Food"),
              circleAndText(
                  "assets/mainPage/foodForCircle/fastFood.png", "Fast Food"),
              circleAndText("assets/mainPage/foodForCircle/kebab.png", "Kebab"),
              circleAndText("assets/mainPage/foodForCircle/salad.png", "Salad"),
              circleAndText(
                  "assets/mainPage/foodForCircle/dessert.png", "Dessert"),
              circleAndText("assets/mainPage/foodForCircle/cake.png", "Cake"),
              circleAndText("assets/mainPage/foodForCircle/coffe.png", "Coffe"),
            ],
          ),

          Container(height: 20,),
        ]),
    );
  }

  Widget circleAndText(String path, String name) {
    return Column(
      children: [
        Stack(children: [
          Image.asset(path),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(name),
            ),
          ),
        ]),
      ],
    );
  }
}
