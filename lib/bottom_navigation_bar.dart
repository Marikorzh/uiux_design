import 'package:flutter/material.dart';
import 'package:uiux_design/favorite_page.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorSchemeSeed: Colors.orange.shade700),
      home:  StartNew(),
    );
  }
}

class StartNew extends StatefulWidget {
  const StartNew({Key? key}) : super(key: key);

  @override
  State<StartNew> createState() => _StartNewState();
}

class _StartNewState extends State<StartNew> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final pages = [
    MyHomePage(title: "kdfjk"),
    FavoritePage(),
    Scaffold(body: Center(child: Text("working..."),)),
    Center(child: Text("working..."),),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset("assets/mainPage/mainTittle.png", scale: 2),
      ),
      body: pages[currentIndex],
    );
  }

  Widget bottomBar(){
      final Size size = MediaQuery.of(context).size;
      Color colorIcon = Colors.redAccent.shade200;
      return Stack(
        children: [
          Container(
            width: size.width,
            height: 80,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(backgroundColor: colorIcon, child: Icon(Icons.shopping_basket), elevation: 0.1, onPressed: () {}),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home_outlined,
                          color: currentIndex == 0 ? colorIcon : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: currentIndex == 1 ? colorIcon : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          }),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            color: currentIndex == 2 ? colorIcon : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: currentIndex == 3 ? colorIcon : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.lineTo(size.width * 0.40, 20);


    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.lineTo( size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


