import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthui/models/dietmeal.dart';

class DetailofMeal extends StatefulWidget {
  DietMeal dietMeal;

  DetailofMeal({this.dietMeal});

  @override
  _DetailofMealState createState() => _DetailofMealState();
}

class _DetailofMealState extends State<DetailofMeal>
    with SingleTickerProviderStateMixin {
  int quantity = 1;
  int _selectedBar = 0;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 124, 160, 248),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Details",
          style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 32,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          double _height = constraint.maxHeight;
          double _width = constraint.maxWidth;
          return Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: _height * 0.85,
                  width: _width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(75, 90),
                          topRight: Radius.elliptical(75, 90))),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              //Image placed
              Container(
                height: _height * 0.4,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  new BoxShadow(color: Colors.white70, blurRadius: 40)
                ]),
                child: Hero(
                  tag: widget.dietMeal.imagePath,
                  child: Image.asset(
                    widget.dietMeal.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Meal name placed
              Positioned(
                top: MediaQuery.of(context).size.height * 0.38,
                left: MediaQuery.of(context).size.width * 0.20,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: widget.dietMeal.mealName.split(" ")[0],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: widget.dietMeal.mealName.split(" ")[1] != null
                            ? " " + widget.dietMeal.mealName.split(" ")[1]
                            : "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontFamily: "Montserrat",
                        )),
                  ]),
                ),
              ),
              //Price and Increment Buttons
              Positioned(
                top: _height * 0.46,
                left: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: _width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "\$${double.parse(widget.dietMeal.price.substring(1, widget.dietMeal.price.length - 1)) * quantity}",
                        style: TextStyle(fontSize: 27, color: Colors.grey),
                      ),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.grey,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.070,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Color.fromARGB(255, 126, 157, 247)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (quantity == 0) {
                                    quantity = 0;
                                    return null;
                                  } else {
                                    quantity--;
                                  }
                                });
                              },
                              color: Colors.white,
                            ),
                            Text(
                              "$quantity",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 22,
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 126, 157, 247),
                                ),
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Information
              Positioned(
                bottom: 50,
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width,
                child: _buildMealInfo(widget.dietMeal.weight,
                    widget.dietMeal.calorie, widget.dietMeal.vitamins),
              ),
              Positioned(
                bottom: 5,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width-100,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.elliptical(30, 20),
                          bottomRight: Radius.elliptical(30, 20))),
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(
                         "Pay Out  : ",
                         style: TextStyle(
                           color:Colors.white,
                           fontSize: 22,
                           fontFamily: "Montserrat"
                         ),
                       ),
                       AnimatedDefaultTextStyle(
                         duration: Duration(milliseconds: 2000),
                         curve: Curves.easeIn,
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 22,
                           fontFamily: "Montserrat"
                         ),
                         child: Text("\$${double.parse(widget.dietMeal.price.substring(1, widget.dietMeal.price.length - 1)) * quantity}"),
                       )
                     ],
                  ),
                ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  _buildMealInfo(int weight, int calorie, List<String> vitamins) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _selectedBar = 0;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              height: _selectedBar==0?MediaQuery.of(context).size.height * 0.24:MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: _selectedBar == 0
                      ? Color.fromARGB(255, 120, 154, 238)
                      : Colors.white,
                  border: Border.all(
                      color: _selectedBar == 0
                          ? Color.fromARGB(255, 120, 154, 238)
                          : Colors.grey,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 500),
                    style: TextStyle(
                        color: _selectedBar == 0 ? Colors.white : Colors.grey,
                        fontFamily: "Montserrat",
                        fontSize: _selectedBar == 0 ? 22 : 19),
                    child: Text(
                      "WEIGHT",
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                          style: TextStyle(
                              color: _selectedBar == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "Montserrat",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "$weight",
                          )),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                            color:
                                _selectedBar == 0 ? Colors.white : Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 22),
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "Gram",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedBar = 1;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              height:  _selectedBar==1?MediaQuery.of(context).size.height * 0.24:MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: _selectedBar == 1
                      ? Color.fromARGB(255, 120, 154, 238)
                      : Colors.white,
                  border: Border.all(
                      color: _selectedBar == 1
                          ? Color.fromARGB(255, 120, 154, 238)
                          : Colors.grey,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 500),
                    style: TextStyle(
                        color: _selectedBar == 1 ? Colors.white : Colors.grey,
                        fontFamily: "Montserrat",
                        fontSize: _selectedBar == 1 ? 22 : 19),
                    child: Text(
                      "CALORIES",
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                          style: TextStyle(
                              color: _selectedBar == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "Montserrat",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "$calorie",
                          )),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                            color:
                                _selectedBar == 1 ? Colors.white : Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 22),
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "CAL",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _selectedBar = 2;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeOut,
              height:  _selectedBar==2?MediaQuery.of(context).size.height * 0.24:MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: _selectedBar == 2
                      ? Color.fromARGB(255, 120, 154, 238)
                      : Colors.white,
                  border: Border.all(
                      color: _selectedBar == 2
                          ? Color.fromARGB(255, 120, 154, 238)
                          : Colors.grey,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 500),
                    style: TextStyle(
                        color: _selectedBar == 2 ? Colors.white : Colors.grey,
                        fontFamily: "Montserrat",
                        fontSize: _selectedBar == 1 ? 22 : 19),
                    child: Text(
                      "VITAMINS",
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                          style: TextStyle(
                              color: _selectedBar == 2
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "Montserrat",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            "${vitamins.join(",")}",
                          )),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                            color:
                                _selectedBar == 2 ? Colors.white : Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 22),
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "VIT",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
