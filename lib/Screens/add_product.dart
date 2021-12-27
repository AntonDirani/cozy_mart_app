import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'all_products.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //
  static const menuItems = <String>[
    'category1',
    'category2',
    'category3',
    'category4',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'category1';

  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  File? image;
  Future pickImage() async {
    //try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageT = File(image.path);
    setState(() => this.image = imageT);
    //}on PlatException catch (e){
    //print('Failed to pick image:$e')}
  }

  @override
  Widget build(BuildContext context) {
    // File image = Provider.of<Products>(context, listen: true).image;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            TextFieldP(
              labelp: '  Title',
              controller: titleController,
            ),
            TextFieldP(
              labelp: '  Description',
              controller: descriptionController,
            ),
            TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: '  Quantity',
              controller: quantityController,
            ),
            TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: '  Phone Number',
              controller: phoneController,
            ),
            TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: '  Price',
              controller: priceController,
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: '  Expiration Date ',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate);
                  setState(() {
                    dateController.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            ListTile(
              title: const Text(
                'Category :',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              trailing: DropdownButton<String>(
                value: _btn1SelectedVal,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _btn1SelectedVal = newValue);
                  }
                },
                items: this._dropDownMenuItems,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text('Choose picture from Gallery'),
              onPressed: () => pickImage(),
            ),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text('Add Product'),
              onPressed: () => AllProducts(),
            ),
          ],
        ),
      ),
    );
  }
}
