import 'package:flutter/material.dart';
import 'package:flutter_application_7/Student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name  = "Assfdfsd";
  List<String> lista = ['Eliel', 'Eliam', 'Rolando', 'Gomis', 'Alex'];
  Student student = Student(name: 'Eliel', enrollment: '123456');

  TextEditingController _txtNameCtrl = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addStudent(){
    final name = _txtNameCtrl.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please set all data')) 
      );
      return;
    }
    setState(() {
      lista.add(name);
    });
    _txtNameCtrl.clear();
  }

  Widget getStudents(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 14,),
      Text('Student list: '),
      SizedBox(height: 10,),
      ...lista.map((n) => Text("- $n")).toList(),
    ],);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            getStudents(),
            SizedBox(height: 14,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _txtNameCtrl,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                height: 16,
                child: ElevatedButton(onPressed: _addStudent, 
                child: Text('Add student')),
              ),
            )
            //Text('Student data: '),
            //SizedBox(height: 15,),
            //Text('Name: ${student.name}'),
            //SizedBox(height: 5,),
            //Text('Enrollment: ${student.enrollment}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
