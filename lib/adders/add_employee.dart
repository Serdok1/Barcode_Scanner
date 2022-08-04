import 'package:barkod/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/services.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({
    Key? key,
    /* required this.id */
  }) : super(key: key);
  /* final String id; */

  @override
  State<AddEmployee> createState() => AddEmployeeState();
}

/*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
/*--*/ /*--*/ /*-Developed by Sina Eren Özbayram-*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
/*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/ /*--*/
class AddEmployeeState extends State<AddEmployee> {
  var size, height, width;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  final ImagePicker _picker = ImagePicker();

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

    setState(() {
      _id.text = "123";
    });

    return CupertinoPageScaffold(
        child: SafeArea(
      child: Column(
        children: [
          NavBar(text: "Ürün Ekle"),
          Container(
            height: height * 0.6,
            width: width * 0.8,
            margin: EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoTextField.borderless(
                  placeholder: "Ürün Başlığı",
                  controller: _firstName,
                  clearButtonMode: OverlayVisibilityMode.editing,
                ),
                CupertinoTextField.borderless(
                  placeholder: "Ürün Açıklaması",
                  controller: _lastName,
                  clearButtonMode: OverlayVisibilityMode.editing,
                ),
                CupertinoTextField.borderless(
                  placeholder: "Ürün Barkodu",
                  controller: _id,
                  clearButtonMode: OverlayVisibilityMode.editing,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      CupertinoButton(
                          child: Icon(CupertinoIcons.add),
                          onPressed: () {
                            _picker.pickImage(source: ImageSource.gallery);
                          }),
                      Text(
                        "Görsel Seçilmedi",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                CupertinoButton.filled(
                    child: Text("Kaydet"),
                    onPressed: () {
                      /* _createTable(); */
                      /* _addEmployee(_id.text, _firstName.text, _lastName.text);
                      _firstName.text = "";
                      _lastName.text = "";
                      _id.text; */
                    })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
