import 'package:flutter/material.dart';
import 'hamburgers_list_mini.dart';

class BurgerPage extends StatefulWidget {
  static const tag = "burger_page";
  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  Widget baconImage = Container(
    height: 160,
    child: Image.asset("images/cheeseburger.png"),
  );

  Widget chickenImage = Container(
    height: 120,
    child: Image.asset("images/chicken_burger.png"),
  );

  int number = 0;

  @override
  Widget build(BuildContext context) {
    bool light = Theme.of(context).brightness == Brightness.light;
    Size size = MediaQuery.of(context).size;
    String nameArgument = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/carlinPP.jpg"),
                radius: 13,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameArgument,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Deliver Me Burger. Fast Delivery & Great Service !",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    nameArgument == "Chicken Burger"
                        ? chickenImage
                        : baconImage,
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                            "15,95 \€",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                            Icon(Icons.star, color: Colors.white),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            child: Container(
              width: size.width,
              color: light
                  ? Color.fromRGBO(240, 240, 240, 1)
                  : Color.fromRGBO(20, 20, 20, 1),
              height: size.height / 1.6,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 28),
                        Text(
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  HamburgersListMini(),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number = number - 1;
                                  });
                                },
                              ),
                              Text(number.toString()),
                              IconButton(
                                icon: Icon(Icons.add_circle),
                                color: Theme.of(context).accentColor,
                                onPressed: () {
                                  setState(() {
                                    number = number + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: MaterialButton(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                              onPressed: () {},
                              child: Text("Buy Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
