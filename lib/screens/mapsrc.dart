import 'package:flutter/material.dart';
import 'package:hekkathon/maps/map_hotel.dart';
import 'package:hekkathon/maps/map_places.dart';

class Mapsrc extends StatefulWidget {
  const Mapsrc({super.key});

  @override
  State<Mapsrc> createState() => _MapsrcState();
}

class _MapsrcState extends State<Mapsrc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        backgroundColor: Color.fromARGB(255, 99, 87, 204),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapBox_hotel()),
              );
            },
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/map/hot.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Hotels',
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 11, 11),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapBox()),
              );
            },
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/map/tour.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Tourist spots',
                  style: TextStyle(
                    color: Color.fromARGB(255, 11, 11, 11),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          ],
        ),
      ),

      );
    
  }
}


