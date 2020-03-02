import 'package:flutter/material.dart';
import 'package:healthui/detail_meal.dart';
import 'package:healthui/models/dietmeal.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _tiklanmaSay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          double _height = constraint.maxHeight;
          double _width = constraint.maxWidth;
          return Stack(
            children: <Widget>[
              Container(
                height: _height * 0.4,
                width: _width,
                color: Color.fromARGB(255, 11, 193, 191),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 25, bottom: 0, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 27,
                          ),
                          SizedBox(
                            width: _width * 0.5,
                          ),
                          Transform.rotate(
                            angle: 1.57,
                            child: Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.zoom_out_map,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 45),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Healthy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat")),
                          TextSpan(
                              text: " Food",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: "MontSerrat"))
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: _height * 0.73,
                    width: _width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(100, 100)))),
              ),
              Positioned(
                top: _height * 0.32,
                left: _width * 0.00,
                child: Container(
                  height: _height * 0.5,
                  width: _width,
                  child: ListView(
                      itemExtent: 150,
                      children: List.generate(meals.length, (index) {
                        return _buildMealsList(index);
                      })),
                ),
              ),
              Positioned(
                top: _height * 0.85,
                left: _width * 0.10,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_basket,
                            ),
                            iconSize: 24,
                            onPressed: () {},
                            highlightColor: Colors.blueGrey,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 10,
                          child: Text(
                            _tiklanmaSay == 0 ? "" : _tiklanmaSay.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 185,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.85),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Montserrat"
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  _buildMealsList(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>DetailofMeal(dietMeal: meals[index],)
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Material(
                    elevation: 20.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: CircleAvatar(
                      child: Hero(
                        tag: meals[index].imagePath,
                        child: Image.asset(
                          meals[index].imagePath,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    meals[index].mealName,
                    style: TextStyle(
                        fontFamily: "MontSerrat",
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                    meals[index].price,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.indigo,
              ),
            ),
            alignment: Alignment.center,
            child: InkWell(
              child: Icon(Icons.add),
              onTap: () {
                setState(() {
                  _tiklanmaSay++;
                });
              },
              splashColor: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
