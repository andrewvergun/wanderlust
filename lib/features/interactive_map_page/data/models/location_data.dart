// models/location_data.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationData {
  final String id;
  final String name;
  final String description;
  final LatLng position;
  final String imageUrl;
  final String coordinates;

  const LocationData({
    required this.id,
    required this.name,
    required this.description,
    required this.position,
    required this.imageUrl,
    required this.coordinates,
  });
}

// Дані локацій
class LocationsData {
  static const List<LocationData> locations = [
    LocationData(
      id: '1',
      name: 'Rakocz Cave (Rückersdorf, Hesse)',
      description: 'This underground cave, formed by ancient volcanic processes, resembles a fantastic labyrinth. Stalactites and stalagmites here shine in the reflections of light, creating the atmosphere of a magical underground temple. Legends say that the cave was a place of refuge for alchemists who were looking for the "philosopher\'s stone". Today, tourists can walk through stone halls that change color depending on the lighting. It is not a popular spot, so it retains a sense of mystery and authenticity.',
      position: LatLng(50.8705, 9.1766),
      imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800',
      coordinates: '50.8705, 9.1766',
    ),
    LocationData(
      id: '2',
      name: 'Rakotzbrücke Bridge (Saxony)',
      description: 'Known as the "Devil\'s Bridge," this stone arch bridge creates a perfect circle in the reflection of the water. Built in the 19th century, it is striking in its harmony with nature and seems to have fallen into a frame from a fantasy film. Although it is forbidden to walk on it, the view from the side is so magical that it attracts artists and photographers from all over the world. Legend has it that the bridge was built with the help of evil spirits, and anyone who crosses it during a full moon can be transported to another dimension.',
      position: LatLng(51.5382, 14.6460),
      imageUrl: 'https://images.unsplash.com/photo-1544552866-d3ed42536cfd?w=800',
      coordinates: '51.5382, 14.6460',
    ),
    LocationData(
      id: '3',
      name: 'Hameln Village (Lower Saxony)',
      description: 'This medieval town became famous thanks to the legend of the Pied Piper of Hameln. Narrow streets are decorated with half-timbered houses, and melodies reminiscent of the story of a fairy-tale hero can still be heard on the streets. Local actors recreate ancient events in open-air performances. Hemeln is a living fairy tale, where every cobblestone breathes history, and the shop windows of cafes combine modernity with the magic of legends.',
      position: LatLng(52.1030, 9.3565),
      imageUrl: 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=800',
      coordinates: '52.1030, 9.3565',
    ),
    LocationData(
      id: '4',
      name: 'Bastei Rocks (Sächsische Schweiz)',
      description: 'These majestic sandstone cliffs rise above the Elbe River and form bizarre towers and bridges made of stone. The most famous among them is the Basteibrücke, a bridge connecting mountain formations. This place is a source of inspiration for Romantic artists who painted it in the 19th century. The landscape is so dramatic that it seems like the set of an adventure film. The observation decks offer an incredible panorama of the Elbe Valley.',
      position: LatLng(50.9634, 14.0706),
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      coordinates: '50.9634, 14.0706',
    ),
    LocationData(
      id: '5',
      name: 'Lorelei Rock (Rhine)',
      description: 'The Lorelei Rock rises above the Rhine and has powerful energy. According to legend, a mermaid with long golden hair sat here, who drove river captains crazy with her singing. Many ships have crashed on the underwater rocks, and today the place attracts romantics and travelers. The view of the Rhine winding between the mountains is impressive with its grandeur and calm power. This is one of the most mystical places in Germany.',
      position: LatLng(50.1369, 7.7281),
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800',
      coordinates: '50.1369, 7.7281',
    ),
    LocationData(
      id: '6',
      name: 'Eltz Castle (Rhineland-Palatinate)',
      description: 'Eltz Castle rises amidst a dense forest, as if from a Grimm Brothers fairy tale. Its architecture combines different styles, from Romanesque to Baroque. The castle has never been destroyed, so it has retained its authenticity for over 850 years. Inside are furniture, jewelry and tapestries that belonged to the noble Eltz family. Here you can feel the true spirit of medieval Germany.',
      position: LatLng(50.2009, 7.3383),
      imageUrl: 'https://images.unsplash.com/photo-1520637836862-4d197d17c0aa?w=800',
      coordinates: '50.2009, 7.3383',
    ),
    LocationData(
      id: '7',
      name: 'Rügen Island (Baltic Sea)',
      description: 'Germany\'s largest island impresses with its white chalk cliffs, which contrast with the dark blue sea. The Jasmund Nature Park with its dense beech forests is included in the UNESCO list. This is a place where you can feel the harmony of nature: sunrises over the sea, walks along chalk cliffs and old fishing villages that have retained their charm. The atmosphere of the island is inspiring and calming.',
      position: LatLng(54.4249, 13.4196),
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      coordinates: '54.4249, 13.4196',
    ),
    LocationData(
      id: '8',
      name: 'Geierlay Bridge (Moselle)',
      description: 'This is one of the longest suspension pedestrian bridges in Europe, over 360 meters long. It stretches over a deep gorge, giving visitors a feeling of flying. The wind here creates a slight vibration, adding to the adventurous mood. The view of the forests and hills is incredible, especially in autumn, when the trees are covered in gold and crimson. This is a place for those who love extreme and beauty at the same time.',
      position: LatLng(50.1037, 7.3367),
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      coordinates: '50.1037, 7.3367',
    ),
    LocationData(
      id: '9',
      name: 'Harz Mountains',
      description: 'The Harz is known for its fairy-tale landscapes, deep forests and ancient legends about witches. The highest mountain, the Brocken, is often shrouded in fog, creating an atmosphere of mystery. The "Witches\' Path" runs here, which, according to legend, witches walked during the Sabbats. In winter, the Harz turns into a ski resort, and in summer it attracts tourists with trekking routes. This is the heart of mythological Germany.',
      position: LatLng(51.7990, 10.6181),
      imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800',
      coordinates: '51.7990, 10.6181',
    ),
    LocationData(
      id: '10',
      name: 'Bavarian Forest (Bayerischer Wald)',
      description: 'One of the oldest national parks in Europe, preserving pristine nature. Lynxes, bears and wild boars live here. Tourists can take a special route "Treetop Path" - a suspended structure that leads high above the forest. The view of the endless sea of green peaks is impressive. This is a place for those who are looking for true unity with nature.',
      position: LatLng(49.0340, 13.2101),
      imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800',
      coordinates: '49.0340, 13.2101',
    ),
    LocationData(
      id: '11',
      name: 'Speyerbach Street (Landau)',
      description: 'This is one of the longest straight streets in Germany, stretching through picturesque villages and vineyards. It resembles an endless road in a movie. Along the route you can see wineries with centuries-old history. Tourists stop to taste local wines and feel the true Palatinate spirit. It is a unique combination of road, culture and gastronomy.',
      position: LatLng(49.2000, 8.1167),
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      coordinates: '49.2000, 8.1167',
    ),
    LocationData(
      id: '12',
      name: 'Eibsee Lake (Bavaria)',
      description: 'Located at the foot of Germany\'s highest mountain, the Zugspitze, this lake impresses with its turquoise water. Surrounded by the Alpine mountains, it has several small islands that make you feel like you\'re in Switzerland or Norway. On sunny days, the water is so clear that you can see the bottom. This is one of the most photogenic places in the country.',
      position: LatLng(47.4766, 10.9751),
      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      coordinates: '47.4766, 10.9751',
    ),
    LocationData(
      id: '13',
      name: 'Heidelberg Philosophenweg',
      description: 'The "Philosopher\'s Path" in Heidelberg is not just a walking route, but a place where thinkers and poets have been inspired for centuries. The path runs above the city and offers views of the castle and the Neckar River. There is a calmness here that seems to encourage reflection. The atmosphere of harmony and beauty makes this place unique among tourist locations.',
      position: LatLng(49.4124, 8.7106),
      imageUrl: 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?w=800',
      coordinates: '49.4124, 8.7106',
    ),
    LocationData(
      id: '14',
      name: 'Atta Caves (Attendorn)',
      description: 'This is one of the largest stalactite caves in Germany, discovered in the 20th century. The length of the explored passages reaches 6 km, and each hall looks like a different world. The humidity, coolness and shimmering of illuminated crystals create the impression of being in a fantastic kingdom. The atmosphere is so unique that the cave is called the "underground cathedral".',
      position: LatLng(51.1272, 7.9050),
      imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800',
      coordinates: '51.1272, 7.9050',
    ),
  ];
}