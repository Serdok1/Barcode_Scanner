import 'dart:convert';

import 'package:barkod/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../providers/services.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

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
  XFile _image =
      XFile("/data/user/0/com.example.barkod/cache/image_picker117250324.jpg");
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

    final ImagePicker _picker = ImagePicker();
    TextEditingController nameController = TextEditingController();
    bool uploaded = false;

/* video 3.07 */
    Future choiceImage() async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = XFile(image!.path);
        print(image.path);
      });
    }

    Future uploadImage() async {
      final uri = Uri.parse("http://192.168.1.173/EmployeDB/uploadimage.php");
      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = "deneme1";
      var pic = await http.MultipartFile.fromPath("image", _image.path,
          contentType: MediaType.parse("image/png"));
      request.files.add(pic);
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image Upload');
      } else {
        print('Image Not Upload');
      }
    }

    func() {
      Navigator.pop(context);
    }

    setState(() {
      _id.text = "123";
    });

    Future showImage(String name) async {
      Services.showImage(name).then((value) {
        return Container(
          decoration: BoxDecoration(),
        );
      });
    }

    return CupertinoPageScaffold(
        child: SafeArea(
      child: Column(
        children: [
          NavBar(
            text: "Ürün Ekle",
            icon: CupertinoIcons.back,
            func: func,
          ),
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
                            choiceImage();
                          }),
                      Text(
                        "Görsel Seçilmedi",
                        style: TextStyle(color: Colors.grey),
                      ),
                      CupertinoButton.filled(
                          child: Text("Show"), onPressed: () {})
                    ],
                  ),
                ),
                CupertinoButton.filled(
                    child: Text("Kaydet"),
                    onPressed: () {
                      uploadImage();
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
