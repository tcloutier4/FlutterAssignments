import 'package:flutter/material.dart';

class MyButtonPage extends StatefulWidget {
  @override
  _MyButtonPageState createState() => _MyButtonPageState();
}

class _MyButtonPageState extends State<MyButtonPage> {
  bool _enabled = false;
  String _msgclick = '';
  String _msgreset = '';
  int _msgcounter = 0;
  @override
  Widget build(BuildContext context) {
    Object onPressedReset() {
      if (_enabled) {
        return () {
          setState(() {
            _msgcounter = 0;
            _msgclick = 'Drink Me';
            _msgreset = 'Need more beer';

            print('reset working, counter 0');
          });
        };
      } else {
        return (null);
      }
    }

    Object onPressedClickMe() {
      if (_enabled) {
        return () {
          setState(() {
            _msgcounter++;
            _msgclick = 'Beers Drank $_msgcounter';
            _msgreset = 'Vomit';
          });

          print('click me working, counter up');
        };
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          print('_enabled is true');

                          if (_msgcounter == 0) {
                            _msgclick = 'Drink Me';
                            _msgreset = 'Need more beer';
                          } else {
                            _msgclick = 'Beers Dranks $_msgcounter';
                            _msgreset = 'Vomit';
                          }
                        } else {
                          _msgreset = '';
                          _msgclick = '';

                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Colors.red.shade100,
                      color: Colors.redAccent,
                      highlightColor: Colors.blueGrey,
                      splashColor: Colors.green.shade300,
                      padding: EdgeInsets.all(20.0),
                      onPressed: onPressedClickMe(),
                      child: Text(_msgclick),
                    ),
                  ]),
                  Column(children: [
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.red.shade100,
                        color: Colors.blueAccent,
                        highlightColor: Colors.grey,
                        splashColor: Colors.green.shade300,
                        padding: EdgeInsets.all(20.0),
                        onPressed: onPressedReset(),
                        child: Text(_msgreset)),
                  ]),
                ]),
          ],
        ),
      ),
    );
  }
}
