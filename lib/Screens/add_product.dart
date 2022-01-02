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

  var formKey = GlobalKey<FormState>();
  /*createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Price'),
            content: ListView(
              children: [
                TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: '  Price 1',
                  controller: priceController,
                  onChanged: (value) {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Price ';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: '  Price 2',
                  controller: priceController,
                  onChanged: (value) {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Price ';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: '  Price3',
                  controller: priceController,
                  onChanged: (value) {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Price ';
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        });
  }
*/
  @override
  Widget build(BuildContext context) {
    //File image = Provider.of<Products>(context, listen: true).image;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFieldP(
                labelp: '  Title',
                controller: titleController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter  title ';
                  }
                  return null;
                },
              ),
              TextFieldP(
                labelp: '  Description',
                controller: descriptionController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter  Description';
                  }
                  return null;
                },
              ),
              TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Quantity',
                controller: quantityController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Quantity ';
                  }
                  return null;
                },
              ),
              TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Price',
                controller: priceController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price ';
                  }
                  return null;
                },
              ),
              TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Price',
                controller: priceController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price ';
                  }
                  return null;
                },
              ),
              TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Price',
                controller: priceController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price ';
                  }
                  return null;
                },
              ),
              TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Phone Number',
                controller: phoneController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Phone Number ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: dateController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: '  Expiration Date ',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Expiration Date';
                  }
                  return null;
                },
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
                  items: _dropDownMenuItems,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white30,
                  //shadowColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Choose picture from Gallery',
                  style: TextStyle(
                    color: Colors.black,
                    //fontSize: 25.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
                onPressed: () => pickImage(),
                // provider
                //  onPressed: () {
                //  context.read<Products>().getImage();
                //},
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (ctx, value, _) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white30,
                      //shadowColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text(
                      'Add Product',
                      style: TextStyle(
                        color: Colors.black,
                        //fontSize: 25.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      /* else {

                          value.add(
                            title: titleController.text,
                            description: descriptionController.text,
                            phoneNumber: phoneController.text,
                            quantity: quantityController.text,
                            expDate: dateController.text,
                            category: categoryController.text,
                            price: priceController.text,
                          );


                      }*/
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  //delete when use provider
  File? image;
  final picker = ImagePicker();
  Future pickImage() async {
    final Image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageT = File(Image!.path);

    setState(() => this.image = imageT);
  }
}
