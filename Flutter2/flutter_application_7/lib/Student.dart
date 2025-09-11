import 'package:flutter_application_7/Person.dart';

class Student extends Person{

  String enrollment;

  Student ({required String name, required this.enrollment}) : super(name);
}