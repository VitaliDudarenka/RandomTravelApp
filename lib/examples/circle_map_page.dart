import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_travel_app/widgets/map_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CircleMapObjectExample extends StatefulWidget {
  const CircleMapObjectExample({super.key});

  @override
  _CircleMapObjectExampleState createState() => _CircleMapObjectExampleState();
}

class _CircleMapObjectExampleState extends State<CircleMapObjectExample> {
  final List<MapObject> mapObjects = [];

  final MapObjectId mapObjectId = MapObjectId('circle');

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: YandexMap(mapObjects: mapObjects)),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                    onPressed: () async {
                      if (mapObjects.any((el) => el.mapId == mapObjectId)) {
                        return;
                      }

                      final mapObject = CircleMapObject(
                        mapId: mapObjectId,
                        circle: Circle(
                            center: Point(
                                latitude: 55.781863, longitude: 37.451159),
                            radius: 1000000),
                        strokeColor: Colors.blue[700]!,
                        strokeWidth: 5,
                        fillColor: Colors.blue[300]!,
                        onTap: (CircleMapObject self, Point point) =>
                            print('Tapped me at $point'),
                      );

                      setState(() {
                        mapObjects.add(mapObject);
                      });
                    },
                    child: const Text('Add')),
                TextButton(
                    onPressed: () async {
                      if (!mapObjects.any((el) => el.mapId == mapObjectId)) {
                        return;
                      }

                      final mapObject =
                          mapObjects.firstWhere((el) => el.mapId == mapObjectId)
                              as CircleMapObject;
                      setState(() {
                        mapObjects[mapObjects.indexOf(mapObject)] =
                            mapObject.copyWith(
                          fillColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        );
                      });
                    },
                    child: const Text('Update')),
                TextButton(
                    onPressed: () async {
                      setState(() {
                        mapObjects.removeWhere((el) => el.mapId == mapObjectId);
                      });
                    },
                    child: const Text('Remove'))
              ],
            )
          ])))
        ]);
  }
}
