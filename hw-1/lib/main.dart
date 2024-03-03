import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan IT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Welcome to Plan IT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // A list of tasks to display on the first page
  List<Task> tasks = [
    Task(
      title: 'Task 1',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      time: '12:55 pm 25th May, 2023',
    ),
    Task(
      title: 'Task 2',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      time: '12:55 pm 25th May, 2023',
    ),
    Task(
      title: 'Task 3',
      description:
          'Your Personal task management and planning solution for planning your day, week & months',
      time: '12:55 pm 25th May, 2023',
    ),
  ];

  // A function to navigate to the second page
  void _goToSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(tasks: tasks)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Task Board',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            // A row of three columns to display the tasks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // A column for the first task
                Column(
                  children: [
                    Text(
                      tasks[0].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10),
                    // A container with a card to display the task details
                    Container(
                      width: 150,
                      height: 200,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[0].description,
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(),
                              Text(
                                tasks[0].time,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // A column for the second task
                Column(
                  children: [
                    Text(
                      tasks[1].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10),
                    // A container with a card to display the task details
                    Container(
                      width: 150,
                      height: 200,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[1].description,
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(),
                              Text(
                                tasks[1].time,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // A column for the third task
                Column(
                  children: [
                    Text(
                      tasks[2].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10),
                    // A container with a card to display the task details
                    Container(
                      width: 150,
                      height: 200,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[2].description,
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(),
                              Text(
                                tasks[2].time,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // A button to go to the second page
            ElevatedButton(
              onPressed: _goToSecondPage,
              child: Text("Let's get started"),
            ),
          ],
        ),
      ),
    );
  }
}

// A class to represent a task
class Task {
  final String title;
  final String description;
  final String time;

  Task({required this.title, required this.description, required this.time});
}

// A class to represent the second page
class SecondPage extends StatefulWidget {
  final List<Task> tasks;

  SecondPage({Key? key, required this.tasks}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // A controller to get the input from the user
  final TextEditingController _controller = TextEditingController();

  // A function to add a new task to the list
  void _addTask() {
    setState(() {
      widget.tasks.add(Task(
        title: 'Task ${widget.tasks.length + 1}',
        description: _controller.text,
        time: '12:55 pm 25th May, 2023',
      ));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Board'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A list view to display the tasks
            Expanded(
              child: ListView.builder(
                itemCount: widget.tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.check_box_outline_blank),
                    title: Text(widget.tasks[index].title),
                    subtitle: Text(widget.tasks[index].description),
                    trailing: Text(widget.tasks[index].time),
                  );
                },
              ),
            ),
            // A text field to get the input from the user
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter a new task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      // A floating action button to add a new task
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
