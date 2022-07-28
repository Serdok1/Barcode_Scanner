import 'package:http/http.dart' as http;
import '../models/employee.dart';
import 'dart:convert';

class Services {
  final ROOT = Uri.parse('http://localhost/employee_actions.php');
  final _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  final _GET_ALL_ACTION = 'GET_ALL';
  final _ADD_EMP_ACTION = 'ADD_EMP';
  final _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  final _DELETE_EMP_ACTION = 'DELETE_EMP';

  List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json));
  }

  Future<String> createTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  Future<List<Employee>> getEmployees() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getEmployee Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Employee> list = parseResponse(response.body);
        return list;
      }
    } catch (e) {
      return <Employee>[];
    }
    throw {"ErrorRrRrRr"};
  }

  Future<String> addEmployee(String firstName, lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION;
      map["first_name"] = firstName;
      map["last_name"] = lastName;
      final response = await http.post(ROOT, body: map);
      print('addEmployee Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  Future<String> updateEmployee(
      int empId, String firstName, String lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_EMP_ACTION;
      map['emp_id'] = empId;
      map["first_name"] = firstName;
      map["last_name"] = lastName;
      final response = await http.post(ROOT, body: map);
      print('updateEmployee Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  Future<String> deleteEmployee(int empId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_EMP_ACTION;
      map['emp_id'] = empId;
      final response = await http.post(ROOT, body: map);
      print('deleteEmployee Response: ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
