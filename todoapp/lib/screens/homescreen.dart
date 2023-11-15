import 'package:flutter/material.dart';
import 'package:todoapp/calendar.dart';
import 'package:todoapp/focus.dart';
import 'package:todoapp/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskDescriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // step 1
  List<Map<String, dynamic>> _tasks = []; // step 2

  void _onItemTapped(int index) {
    switch (index) {
      case 0: // Index screen
        setState(() {
          _selectedIndex = index;
        });
        break;
      case 1: // Calendar screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => calendarscreen()),
        );
        break;
      case 2: // Focus screen
        // Navigate to Focus screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FocusView()),
        );
        break;
      case 3: // Profile screen
        // Navigate to Profile screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileView()),
        );
        break;
      default:
        break;
    }
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
                    hintText: "Task Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _taskDescriptionController,
                  decoration: const InputDecoration(
                    hintText: "Task Description",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2222),
                    );

                    if (selected != null) {
                      setState(() {
                        _selectedDate = selected;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(
                          'Select date: ${_selectedDate.toString().substring(0, 10)}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                String taskName = _taskNameController.text;
                String taskDescription = _taskDescriptionController.text;
                Map<String, dynamic> task = {
                  'name': taskName,
                  'description': taskDescription,
                  'date': _selectedDate,
                };
                setState(() {
                  _tasks.add(task);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openTaskDialog(Map<String, dynamic> task) {
    // step 3
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task['name'],
                    style: const TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Description: ${task['description']}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'Date: ${task['date'].toString().substring(0, 10)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 12.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Icon(Icons.more_horiz_outlined,
                        color: Colors.white, size: 30.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileView()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 70, right: 20, left: 20),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('image2.jpg'),
                        radius: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: const Text(
                      "Index",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Image.asset("image3.png"),
                    height: 250,
                    width: 340,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _tasks.isEmpty
                  ? const Text(
                      'Tap + to add your tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, dynamic> task = _tasks[index];
                        return GestureDetector(
                          onTap: () => _openTaskDialog(task),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task['name'],
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12.0),
                                  Text(
                                    'Description: ${task['description']}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                  const SizedBox(height: 12.0),
                                  Text(
                                    'Date: ${task['date'].toString().substring(0, 10)}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: _showDialog,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Index',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
