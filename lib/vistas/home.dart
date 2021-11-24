import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps in Flutter'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
            Align(alignment: Alignment.bottomCenter,
            child:
              Container(child:
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Image.asset('assets/images/user.png',
                              // width: 300,
                              height: 100,
                              fit:BoxFit.fill),
                          Text("NameUSer", style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                          ))

                        ],),
                      ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(children:  [
                         ToggleSwitch(
                           minWidth: 90.0,
                           cornerRadius: 20.0,
                           activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                           activeFgColor: Colors.white,
                           inactiveBgColor: Colors.grey,
                           inactiveFgColor: Colors.white,
                           initialLabelIndex: 1,
                           totalSwitches: 2,
                           labels: ['On', 'Off'],
                           radiusStyle: true,
                           onToggle: (index) {
                             print('switched to: $index');
                           },
                         ),
                       ],),
                     ),
                   ],),
                 ),
                  color: Colors.white,
                  width: double.infinity,
                  height: 220,
                  padding: EdgeInsets.all(20.0),
              )
            )
          ],
        ));
  }
}