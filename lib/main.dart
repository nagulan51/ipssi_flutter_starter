import 'package:flutter/material.dart';
import 'package:flutter_ipssi/common_widgets/AnonymousPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel List',
      home: HotelListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HotelListPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotels = [
    {
      'name': 'Hotel Luxe',
      'location': 'Webley, Londres',
      'distance': '2km',
      'price': '170€',
      'reviews': '36 avis',
      'image': 'https://picsum.photos/300/200?3',
    },
    {
      'name': 'Hotel Budget',
      'location': 'Webley, Londres',
      'distance': '6km',
      'price': '80€',
      'reviews': '21 avis',
      'image': 'https://picsum.photos/300/200?2',
    },
    {
      'name': 'Hotel Classic',
      'location': 'Webley, Londres',
      'distance': '4km',
      'price': '120€',
      'reviews': '28 avis',
      'image': 'https://picsum.photos/300/200?1',
    },
  ];

  // Removed 'const' from the constructor
  HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('550 hotels trouvés'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              debugPrint('Filter button pressed');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          return _buildHotelCard(context, hotel);
        },
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, Map<String, dynamic> hotel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AnonymousPage(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
              child: Image.network(
                hotel['image'],
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildHotelDetails(hotel),
                  ),
                  _buildPriceAndActions(hotel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelDetails(Map<String, dynamic> hotel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel['name'],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          hotel['location'],
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
            const SizedBox(width: 4.0),
            Text(
              hotel['distance'],
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          hotel['reviews'],
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndActions(Map<String, dynamic> hotel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          hotel['price'],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'par nuit',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8.0),
        const Icon(Icons.favorite_border, color: Colors.grey),
      ],
    );
  }
}
