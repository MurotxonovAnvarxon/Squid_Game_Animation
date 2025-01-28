class EmployeeModel{
  // final int id;
  final String name;

  EmployeeModel({required this.name});

  @override
  String toString() {
    return 'EmployeeModel{name: $name}';
  }
}