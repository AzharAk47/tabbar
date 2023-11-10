import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabBar Example'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Date Picker'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Tab 1 content
              Center(child: Text('Tab 1 Content')),

              // Tab 2 content
              Center(child: Text('Tab 2 Content')),

              // Date Picker tab content
              DatePickerTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerTab extends StatefulWidget {
  @override
  _DatePickerTabState createState() => _DatePickerTabState();
}

class _DatePickerTabState extends State<DatePickerTab> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selected Date: ${selectedDate.toLocal()}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
        ],
      ),
    );
  }
}
