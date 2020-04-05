import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _selectedIndex = 0;
  int favValue = 0;
  GlobalKey<ScaffoldState> _drawerKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          //currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                padding: EdgeInsets.only(top: 10),
                icon: Image.asset('assets/images/dumbbell-2.png'),
                onPressed: () {},
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                child: Image.asset('assets/images/dish.png'),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Container(
                    height: 25,
                    width: 30,
                    child: Image.asset('assets/images/diamond.png'),
                  ),
                  _badge(favValue),
                ],
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  _drawerKey.currentState.openEndDrawer();
                },
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              title: Text(''),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: CustomDrawer(),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'TRAIN LIKE ROBERT BLAZEVIC',
                  style: TextStyle(
                    color: Color(0xFF4CDA63),
                    fontSize: 13,
                    wordSpacing: 2,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  'Exercises',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 27,
                  color: Colors.black,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ExerciseSearch(),
                  );
                },
              ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                height: mq.height * 0.77,
                width: mq.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: exercises.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 15,
                        ),
                        height: mq.height * 0.3,
                        width: mq.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Color(0xFFF1F1F1),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(exercises[i].imageUrl),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                exercises[i].level,
                                style: TextStyle(
                                  color: Color(0xFF4CDA63),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                exercises[i].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: mq.height * 0.09,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    exercises[i].equipment,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    exercises[i].category,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        'Total Time: ${exercises[i].duration} minutes',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF4CDA63),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              favValue += 1;
                                            });
                                          },
                                          child: Center(
                                            child: Text(
                                              'TRY',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(int value) {
    return Positioned(
      top: 1,
      right: 1,
      child: Container(
        height: 13,
        width: 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF4CDA63),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class ExerciseSearch extends SearchDelegate<Exercise> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Color(0xFF4CDA63),
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Color(0xFF4CDA63),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Expanded(child: ListView());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Color(0xFF4CDA63),
      child: Text(
        query,
        style: TextStyle(color: Colors.white, fontSize: 27),
      ),
    );
  }
}

//              Text(
//                'TRAIN LIKE ROBERT BLAZEVIC',
//                style: TextStyle(
//                  color: Color(0xFF4CDA63),
//                  fontSize: 15,
//                  wordSpacing: 2,
//                  letterSpacing: 2,
//                ),
//              ),
//              Row(
//                mainAxisSize: MainAxisSize.max,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Text(
//                    'Exercises',
//                    style: TextStyle(
//                      color: Colors.black,
//                      fontSize: 27,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                  Icon(
//                    Icons.search,
//                    size: 27,
//                  )
//                ],
//              ),
