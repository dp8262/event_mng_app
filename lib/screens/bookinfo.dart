import 'package:flutter/material.dart';
import 'booking.dart';

// Define a class to represent a package
class Package {
  final String name;
  final String price;
  final String description;

  Package({
    required this.name,
    required this.price,
    required this.description,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PackageListPage(),
    );
  }
}

class PackageListPage extends StatelessWidget {
  // List of packages
  final List<Package> packages = [
    Package(
      name: 'Package A',
      price: '\$499.99',
      description: 'Package A includes...',
    ),
    Package(
      name: 'Package B',
      price: '\$699.99',
      description: 'Package B includes...',
    ),
    Package(
      name: 'Package C',
      price: '\$899.99',
      description: 'Package C includes...',
    ),
    Package(
      name: 'Package D',
      price: '\$899.99',
      description: 'Package D includes...',
    ),
    Package(
      name: 'Package E',
      price: '\$899.99',
      description: 'Package E includes...',
    ),
    // Add more packages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packages'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          return PackageCard(package: packages[index]);
        },
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final Package package;

  const PackageCard({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: ${package.price}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${package.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingForm()),
                  );
              },
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.orange,
              //   onPrimary: Colors.black,
              // ),
              child: Text('Book Event'),
            ),
          ],
        ),
      ),
    );
  }
}
