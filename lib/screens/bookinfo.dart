import 'package:event_mng_app/common/common_widget.dart';
import 'package:event_mng_app/controller/packgeList_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class PackageListPage extends StatefulWidget {

  const PackageListPage({super.key});

  @override
  State<PackageListPage> createState() => _PackageListPageState();
}

class _PackageListPageState extends State<PackageListPage> {
  final PackageListController _packageListController = Get.put(PackageListController());

  // // List of packages
  // final List<Package> packages = [
  //   Package(
  //     name: 'Package A',
  //     price: '\$499.99',
  //     description: 'Package A includes...',
  //   ),
  //   Package(
  //     name: 'Package B',
  //     price: '\$699.99',
  //     description: 'Package B includes...',
  //   ),
  //   Package(
  //     name: 'Package C',
  //     price: '\$899.99',
  //     description: 'Package C includes...',
  //   ),
  //   Package(
  //     name: 'Package D',
  //     price: '\$899.99',
  //     description: 'Package D includes...',
  //   ),
  //   Package(
  //     name: 'Package E',
  //     price: '\$899.99',
  //     description: 'Package E includes...',
  //   ),
  //   // Add more packages as needed
  // ];
  @override
  void initState() {
    _packageListController.getAllAssessmentsBy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Packages'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: GetX<PackageListController>(
        init: PackageListController(),
        builder: (controller) {
          return LoadingStateWidget(
            isLoading: controller.isLoading.value,
            child: ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.productList[index].pName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: ${controller.productList[index].pPrice}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${controller.productList[index].pDescription}',
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
              },
            ),
          );
        },
      ),
    );
  }
}

