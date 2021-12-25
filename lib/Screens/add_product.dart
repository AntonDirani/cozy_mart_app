import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
    'One',
    'Two',
    'Three',
    'Four',
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

  String _btn1SelectedVal = 'One';
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const TextFieldP(
              labelp: 'Title',
            ),
            const TextFieldP(
              labelp: 'Description',
            ),
            const TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: 'Quantity',
            ),
            const TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: 'Phone Number',
            ),
            const TextFieldP(
              keyboardTypep: TextInputType.number,
              labelp: 'Price',
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Expiration Date ',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
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
              title: const Text('category:'),
              trailing: DropdownButton<String>(
                // Must be one of items.value.
                value: _btn1SelectedVal,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _btn1SelectedVal = newValue);
                  }
                },
                items: this._dropDownMenuItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
