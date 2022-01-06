import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'all_products.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  static const routeName = '/add-product';
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  /*TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  */
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var _editedProduct = Product.a(
      id: null,
      title: '',
      price: 0,
      description: '',
      phoneNumber: '',
      quantity: 0,
      image: null,
      expDate: DateTime.now(),
      category: 'category1');
  var _isInside = true;
  var _defValues = {
    'title': '',
    'description': '',
    'quantity': '',
    'price': '',
    'phoneNumber': '',
    'expDate': '',
    'category': ''
  };

  @override
  void didChangeDependencies() {
    if (_isInside) {
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(productId.toString());
        _defValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'quantity': _editedProduct.quantity.toString(),
          'price': _editedProduct.price.toString(),
          'phoneNumber': _editedProduct.phoneNumber.toString(),
          'expDate': '',
          'category': ''
        };
        dateController.text =
            DateFormat('yyyy-MM-dd').format(_editedProduct.expDate);
      }
    }
    _isInside = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      formKey.currentState!.save();
      _editedProduct.image = image1;
      // _editedProduct.expDate = dateController;
      print('b');
      if (_editedProduct.id != null) {
        Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct.id, _editedProduct);
      } else {
        print('c');
        Provider.of<Products>(context, listen: false).addProduct(
          product: _editedProduct,
        );

        print('s');
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Added'),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      }
      Navigator.of(context).pop();
      //print(_editedProduct.category);
    }
  }

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
              child: ListView(children: [
                TextFieldP(
                  initial: _defValues['title'],
                  labelp: '  Title',
                  // controller: titleController,
                  onChanged: (value) {
                    _editedProduct = Product.a(
                        title: value,
                        price: _editedProduct.price,
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        phoneNumber: _editedProduct.phoneNumber,
                        quantity: _editedProduct.quantity,
                        image: _editedProduct.image,
                        expDate: _editedProduct.expDate);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter  title ';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  initial: _defValues['description'],
                  labelp: '  Description',
                  // controller: descriptionController,
                  onChanged: (value) {
                    _editedProduct = Product.a(
                        title: _editedProduct.title,
                        price: _editedProduct.price,
                        description: value,
                        id: _editedProduct.id,
                        phoneNumber: _editedProduct.phoneNumber,
                        quantity: _editedProduct.quantity,
                        image: _editedProduct.image,
                        expDate: _editedProduct.expDate);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter  Description';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  initial: _defValues['quantity'],
                  keyboardTypep: TextInputType.number,
                  labelp: '  Quantity',
                  //controller: quantityController,
                  onChanged: (value) {
                    _editedProduct = Product.a(
                        title: _editedProduct.title,
                        price: _editedProduct.price,
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        phoneNumber: _editedProduct.phoneNumber,
                        quantity: int.parse(value),
                        image: _editedProduct.image,
                        expDate: _editedProduct.expDate);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Quantity ';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  initial: _defValues['price'],
                  keyboardTypep: TextInputType.number,
                  labelp: '  Price',
                  // controller: priceController,
                  onChanged: (value) {
                    _editedProduct = Product.a(
                        title: _editedProduct.title,
                        price: double.parse(value),
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        phoneNumber: _editedProduct.phoneNumber,
                        quantity: _editedProduct.quantity,
                        image: _editedProduct.image,
                        expDate: _editedProduct.expDate);
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Price ';
                    }
                    return null;
                  },
                ),
                /*TextFieldP(
                keyboardTypep: TextInputType.number,
                labelp: '  Price',
                //controller: priceController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price ';
                  }
                  return null;
                },
              ),

               */
                /*TextFieldP(
                //keyboardTypep: TextInputType.number,
                labelp: '  Price',
                //controller: priceController,
                onChanged: (value) {},
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Price ';
                  }
                  return null;
                },
              ),*/
                TextFieldP(
                  initial: _defValues['phoneNumber'],
                  keyboardTypep: TextInputType.number,
                  labelp: '  Phone Number',
                  // controller: phoneController,
                  onChanged: (value) {
                    _editedProduct = Product.a(
                        title: _editedProduct.title,
                        price: _editedProduct.price,
                        description: _editedProduct.description,
                        id: _editedProduct.id,
                        phoneNumber: value,
                        quantity: _editedProduct.quantity,
                        image: _editedProduct.image,
                        expDate: _editedProduct.expDate);
                  },
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
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
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
                    hint: Text('Click'),
                    value: _editedProduct.category,
                    onChanged: (String? newValue) {
                      setState(() {
                        _editedProduct.category = newValue;
                      });
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
                        primary: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        'Add Product',
                        style: TextStyle(
                          //fontSize: 25.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      onPressed: () {
                        _saveForm();
                      }),
                ),
              ]),
            )));
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

  File? image1;
  final picker = ImagePicker();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) {
        final imageT = File(image!.path);

        setState(() => image1 = imageT);
      }
    } on PlatformException catch (e) {
      //print('Failed to pick image ');
    }
  }
}
