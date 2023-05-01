import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapMarker {
  final String? image;
  final String? title;
  final LatLng? location;
  final String? address;
  final int? rating;

  MapMarker({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.address,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/map/hotels/phlox.jpg',
      title: 'The phlox hubli',
      address: 'Contact: 9864535382',
      location: LatLng(15.37152, 75.12128),
      rating: 4),
  MapMarker(
      image: 'assets/map/hotels/pres.jpg',
      title: 'The President Hotel',
      address: '9274838399',
      location: LatLng(15.38286, 75.11557),
      rating: 5),
  MapMarker(
      image: 'assets/map/hotels/ana.jpg',
      title: 'Ananth the grand',
      address: '7863534325',
      location: LatLng(15.32353377261934, 75.02806851447238),
      rating: 3),
  MapMarker(
      image: 'assets/map/hotels/met.jpg',
      title: 'Metropolis hotel',
      address: '6261525332',
      location: LatLng(15.35777, 75.15523),
      rating: 5),
  MapMarker(
    image: 'assets/map/hotels/den.jpg',
    title: 'Denissons hotel',
    address: '7864535382',
    location: LatLng(15.35277, 75.11767),
    rating: 3,
  ),
  MapMarker(
      image: 'assets/map/hotels/om.jpg',
      title: 'Omatra the bliss hotele',
      address: '6364537382',
      location: LatLng(15.35689, 75.10970),
      rating: 3),
      MapMarker(
      image: 'assets/map/hotels/oak.jpg ',
      title: 'The Oaks restaurant ',
      address: '9764535384',
      location: LatLng(15.36458, 75.13495),
      rating: 2),
      MapMarker(
      image: 'assets/map/hotels/sha.jpg',
      title: 'Shaahi family restaurant',
      address: '7864535382',
      location: LatLng(15.34939, 75.14326),
      rating: 3),
      MapMarker(
      image: 'assets/map/hotels/leela.jpg',
      title: 'Leelavati palace',
      address: '7764535382',
      location: LatLng(15.35172, 75.11209),
      rating: 3),
      
];


class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1Ijoidml2YWFuIiwiYSI6ImNsaDFobGVoczEzbzgzaXF2ZXVzYXRibm8ifQ.3dipErYWeZ0DPtoD04PNmw';

  static const String mapBoxStyleId = 'clh1wpg3c00mp01qy59hd7u7j';

  static final myLocation = LatLng(15.392543505030979, 75.02528508513441);
}

class MapBox_hotel extends StatefulWidget {
  const MapBox_hotel({super.key});

  @override
  State<MapBox_hotel> createState() => _MapBoxState_hotel();
}

class _MapBoxState_hotel extends State<MapBox_hotel> with TickerProviderStateMixin {
  int selectedIndex = 0;
  final PageController pageController = PageController();
  ScrollController _controller = ScrollController();
  var currentLocation = AppConstants.myLocation;

  late final MapController mapController;
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: currentLocation,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/vivaan/clh1wpg3c00mp01qy59hd7u7j/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml2YWFuIiwiYSI6ImNsaDFobGVoczEzbzgzaXF2ZXVzYXRibm8ifQ.3dipErYWeZ0DPtoD04PNmw",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: [
                  if(currentLocation!=null)
                  Marker(point: currentLocation, builder: (BuildContext context){ return Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30.0,
              );}),
                  
                  for (int i = 0; i < mapMarkers.length; i++)
                    Marker(
                        height: 40,
                        width: 30,
                        point:
                            mapMarkers[i].location ?? AppConstants.myLocation,
                        builder: (_) {
                          return GestureDetector(
                            onTap: () {
                              pageController.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                              selectedIndex = i;
                              setState(() {});
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 500),
                              scale: selectedIndex == i ? 1 : 0.7,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: selectedIndex == i ? 1 : 0.5,
                                child: SvgPicture.asset(
                                  'assets/map/green.svg',
                                ),
                              ),
                            ),
                          );
                        })
                ],
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation =
                    mapMarkers[value].location ?? AppConstants.myLocation;
                _animatedMapMove(currentLocation, 11.5);
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 30, 29, 29),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.rating,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 254, 254, 251)
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.address ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    var controller = AnimationController(
        duration: const Duration(milliseconds: 1000),vsync: this );
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }
}


