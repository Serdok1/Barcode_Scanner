import 'package:http/http.dart' as http;
import '../models/employee.dart';
import 'dart:convert';

class Services {
  static final ROOT =
      Uri.parse('http://localhost/EmployeDB/employee_actions.php');
  static final GET = Uri.parse('http://localhost/EmployeDB/getAll.php');
  static final IMAGE = Uri.parse('http://localhost/EmployeDB/getimage.php');
  static final _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static final _GET_ALL_ACTION = 'GET_ALL';
  static final _ADD_EMP_ACTION = 'ADD_EMP';
  static final _ADD_HISTORY_ACTION = "ADD_HISTORY";
  static final _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static final _DELETE_EMP_ACTION = 'DELETE_EMP';
  static final _CHECK_ID = 'CHECK_ID';
  static final _GET_ID = 'GET_ID';

  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }

  static Future<String> createTable() async {
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

  static Future getEmployees(String id) async {
    var map = Map<String, dynamic>();
    map['id'] = id;
    final response = await http.post(GET, body: map);
    return json.decode(response.body);
  }

  static Future getImage(String id) async {
    var map = Map<String, dynamic>();
    map['id'] = id;
    final response = await http.post(IMAGE, body: map);
    return json.decode(response.body);
  }

  static Future<String> addEmployee(
      String id, String firstName, String lastName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION;
      map['emp_id'] = id;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
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

  static Future<String> addHistory(String id, String dateTime) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION;
      map['id'] = id;
      map['dateTime'] = dateTime;
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

  static Future<String> updateEmployee(
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

  static Future<String> deleteEmployee(String empId) async {
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

  static Future<String> checkId(String id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _CHECK_ID;
      map['emp_id'] = id;
      final response = await http.post(ROOT, body: map);
      print('checkId Response: ${response.body}');
      return response.body;
    } catch (e) {
      return "error";
    }
  }
}
