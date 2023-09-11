import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  int countBrgs = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, initialIndex: 0, vsync: this); // Додайте vsync: this
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Burgers", style: TextStyle(fontSize: 26)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 35,
                  ))
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  iconSize: 35, // Змініть розмір іконки тут
                );
              },
            ),
            bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.redAccent.shade200,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.redAccent.shade200,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: 'All Items'),
                Tab(text: 'New Items'),
                Tab(text: 'Recommended'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              allItems(),

              // Вміст для вкладки 2
              Center(child: Text('Вкладка 2')),

              // Вміст для вкладки 3
              Center(child: Text('Вкладка 3')),
            ],
          )),
    );
  }

  Widget allItems() {
    String path = "";
    switch (index) {
      case 0:
        path = "assets/choosePageBurgers/burger1.png";
        break;
      case 1:
        path = "assets/choosePageBurgers/burger2.png";
        break;
      case 2:
        path = "assets/choosePageBurgers/chesseBurger.png";
        break;
      case 3:
        path = "assets/choosePageBurgers/burger3.png";
        break;
    }
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.only(left: 20, right: 20),
                child:
                    Container(child: Image.asset(path, fit: BoxFit.fitHeight))),
            Column(
              children: [
                chooseBurger("assets/choosePageBurgers/burger1.png", index, 0),
                chooseBurger("assets/choosePageBurgers/burger2.png", index, 1),
                chooseBurger("assets/choosePageBurgers/burger3.png", index, 2),
                chooseBurger("assets/choosePageBurgers/burger3.png", index, 3),
              ],
            ),
          ],
        ),

        //main name
        Padding(
          padding: const EdgeInsets.only(left: 41, top: 20, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cheese Burger\nWhopper",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.favorite_border,
                size: 40,
                color: Colors.redAccent.shade400,
              ),
            ],
          ),
        ),

        //ingredients
        Container(
          margin: EdgeInsets.only(left: 45, right: 95, top: 20),
          width: 300,
          child: Text("Ham, Cheddar Cheese, Onion, Cornichon, Salad, Tomato"),
        ),

        //price
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 41, top: 35),
          child: Text(
            "\$8.99",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),

        SizedBox(height: 43,),

        Row(

          children: [
            //COUNT BURGERS
            Container(
              margin: EdgeInsets.only(left: 36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400,
              ),
              height: 33,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //BUTTON +
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      minimumSize:  MaterialStateProperty.all<Size>(Size(24, 24)),
                      //alignment: Alignment.centerLeft
                    ),
                    onPressed: () {setState(() {
                      countBrgs++;
                    });},
                    child: Text("+"),
                  ),

                  Text(countBrgs.toString()),

                  //BUTTON -
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      minimumSize:  MaterialStateProperty.all<Size>(Size(24, 24)),
                      //alignment: Alignment.centerLeft
                    ),
                    onPressed: () {setState(() {
                      if(countBrgs > 0) countBrgs--;
                    });},
                    child: Text("-"),
                  ),
                ],
              ),
            ),

            SizedBox(width: 50,),

            //BUTTON ADD TO CART
            Container(
              height: 46,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.redAccent.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 20),)),
            )
          ],
        ),
      ],
    );
  }

  Widget chooseBurger(String path, int ind, int must) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = must;
        });
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: ind == must ? Colors.red : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          path,
          scale: 1.8,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
