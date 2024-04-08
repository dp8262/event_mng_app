import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking Form',
      theme: ThemeData(
        primaryColor: Colors.white,
        // accentColor: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: BookingForm(),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _location = '';
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('NAME', style: TextStyle(color: Colors.orange)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
                style: TextStyle(fontSize: 18.0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('EMAIL', style: TextStyle(color: Colors.orange)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
                style: TextStyle(fontSize: 18.0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('LOCATION', style: TextStyle(color: Colors.orange)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter location',
                ),
                style: TextStyle(fontSize: 18.0),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('DATE', style: TextStyle(color: Colors.orange)),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Select date',
                    ),
                    style: TextStyle(fontSize: 18.0),
                    controller: TextEditingController(
                        text: _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : ''),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process form data
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Location: $_location');
                    print('Date: $_selectedDate');
                    // You might want to send the data to a server or database here.
                  }
                },
                child: Text('Send'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor: Colors.orange, // Background color
                  foregroundColor: Colors.white, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
