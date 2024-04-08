import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecondPage(),
    );
  }
}

class SecondPage extends StatelessWidget {
  final List<Event> eventsList = [
    Event(name: 'Event 1', description: 'Description 1'),
    Event(name: 'Event 2', description: 'Description 2'),

    Event(name: 'Event 3', description: 'Description 3'),
    Event(name: 'Event 4', description: 'Description 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SecondPage"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: eventsList.map((event) {
            return Card(
              child: ListTile(
                title: Text(event.name),
                subtitle: Text(event.description),
                leading: Icon(Icons.event),
                trailing: LikeButton(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Event {
  final String name;
  final String description;

  Event({required this.name, required this.description});
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      color: _isLiked ? Colors.red : null,
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
    );
  }
}
