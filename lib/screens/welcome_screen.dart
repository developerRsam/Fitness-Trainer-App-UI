import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../screens/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var _deviceHeight;

  var _deviceWidth;

  int _selectedTrainer;

  @override
  void initState() {
    _selectedTrainer = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (int index) {
                setState(() {
                  _selectedTrainer = index;
                });
              },
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg1.jpg'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg2.jpg'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg3.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: _deviceHeight * .4,
                width: _deviceWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.6),
                    Colors.transparent,
                  ],
                  stops: [0.45, 1.0],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
              ),
            ),
            Positioned(
              bottom: 36,
              child: Container(
                padding: EdgeInsets.only(
                  left: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text(
                        'CHOOSE YOUR TRAINER',
                        style: TextStyle(
                          color: Color(0xFFF4CDA63),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: trainers.map((_game) {
                          bool _isActive = _game == trainers[_selectedTrainer];
                          double _circleRadius = _deviceHeight * 0.005;
                          return Container(
                            margin:
                                EdgeInsets.only(right: _deviceWidth * 0.018),
                            height: _circleRadius * 2,
                            width: _circleRadius * 2,
                            decoration: BoxDecoration(
                              color:
                                  _isActive ? Color(0xFF4CDA63) : Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      trainers[_selectedTrainer],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Multi-year judo contestant and a member \nof the croatian'
                      'judo team, winner of many\nnational and international prices.',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.72),
                        fontSize: 18,
                        wordSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF4CDA63),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
