class Employee {
  final String id;
  final String firstName;
  final String lastName;

  Employee({required this.id, required this.firstName, required this.lastName});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['emp_id'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String);
  }
}
