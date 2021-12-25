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
  var titleController = TextEditingController()..text = ' ';
  var descriptionController = TextEditingController()..text = ' ';
  var quantityController = TextEditingController()..text = ' ';
  var phoneController = TextEditingController()..text = ' ';
  var priceController = TextEditingController()..text = ' ';
  var categoryController = TextEditingController()..text = ' ';
  var expdateController = TextEditingController()..text = ' ';

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

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
              controller: dateinput,
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
                    dateinput.text = formattedDate;
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

const List<Entry> data = <Entry>[
  Entry(
    'Category',
    <Entry>[
      Entry('category1'),
      Entry('category2'),
      Entry('category3'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
