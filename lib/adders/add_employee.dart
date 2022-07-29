import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../providers/services.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => AddEmployeeState();
}

/*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
/*--*/ /*--*/ /*-Developed by Sina Eren Özbayram-*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
/*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
class AddEmployeeState extends State<AddEmployee> {
  var size, height, width;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  _createTable() {
    Services.createTable().then((result) {
      if ('succes' == result) {
        print("succes");
      }
    });
  }

  _addEmployee(String id, String firstName, String lastName) {
    Services.addEmployee(id, firstName, lastName).then((result) {
      if ('succes' == result) {
        print("succes");
      }
    });
  }

  _deleteEmployee(String id) {
    Services.deleteEmployee(id).then((result) {
      if ('succes' == result) {
        print("succes");
      }
    });
  }

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _id = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _firstName.dispose();
    _lastName.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return CupertinoPageScaffold(
        child: Container(
      height: height * 0.25,
      width: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoTextField(
            placeholder: "Kullanıcı Adı",
            controller: _firstName,
          ),
          CupertinoTextField(
            placeholder: "Kullanıcı Soyadı",
            controller: _lastName,
          ),
          CupertinoTextField(
            placeholder: "Kullanıcı ID'si",
            controller: _id,
          ),
          CupertinoButton.filled(
              child: Text("Submit"),
              onPressed: () {
                /* _createTable(); */
                /* _addEmployee('01', 'Sina', 'Eren'); */
                _addEmployee(_id.text, _firstName.text, _lastName.text);
                _firstName.text = "";
                _lastName.text = "";
                _id.text = "";
              })
        ],
      ),
    ));
  }
}
