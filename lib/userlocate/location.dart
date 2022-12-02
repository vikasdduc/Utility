import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocateUser extends StatefulWidget {
  const LocateUser({Key? key}) : super(key: key);

  @override
  State<LocateUser> createState() => _LocateUserState();
}

class _LocateUserState extends State<LocateUser> {
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Geolocation App"),
      ),
      body: Center(
        child: _position != null ? Text('Current Location: ' + _position.toString()) : Text('No Location Data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
