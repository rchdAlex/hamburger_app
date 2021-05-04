import 'package:flutter/material.dart';

class HamburgersListMini extends StatefulWidget {
  @override
  _HamburgersListMiniState createState() => _HamburgersListMiniState();
}

class _HamburgersListMiniState extends State<HamburgersListMini> {
  Widget baconImage = Container(
    height: 110,
    child: Image.asset("images/cheeseburger.png"),
  );

  Widget chickenImage = Container(
    height: 80,
    child: Image.asset("images/chicken_burger.png"),
  );
  int items = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items,
        itemBuilder: (context, index) {
          bool reverse = index.isEven;
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: index == items ? 20 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      reverse ? "Chicken Burger" : "Bacon Burger",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: reverse ? 20 : 5,
                left: reverse ? 10 : 15,
                child: GestureDetector(
                  onTap: () {},
                  child: reverse ? chickenImage : baconImage,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
