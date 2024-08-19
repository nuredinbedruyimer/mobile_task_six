import 'package:flutter/material.dart';

class TAddPage extends StatefulWidget {
  const TAddPage({super.key});

  @override
  _TAddPageState createState() => _TAddPageState();
}

class _TAddPageState extends State<TAddPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Product',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 50,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(height: 10),
                        Text('Upload Image',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                ),
                FormField(controller: _nameController, text: 'Name'),
                FormField(controller: _categoryController, text: 'Category'),
                FormField(controller: _priceController, text: 'Price'),
                FormField(
                    controller: _descriptionController, text: 'Description'),
                FormButton(
                  text: 'ADD',
                  onPressed: _addProduct,
                ),
                const SizedBox(height: 20),
                FormButton(
                  text: 'DELETE',
                  onPressed: _deleteProduct,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addProduct() {
    final String name = _nameController.text;
    final String category = _categoryController.text;
    final double? price = double.tryParse(_priceController.text);
    final String description = _descriptionController.text;

    if (name.isNotEmpty && category.isNotEmpty && price != null) {
      Navigator.pop(context, {
        'name': name,
        'category': category,
        'price': price,
        'description': description,
      });
    } else {
      // Handle validation or show an error message
    }
  }

  void _deleteProduct() {
    _nameController.clear();
    _categoryController.clear();
    _priceController.clear();
    _descriptionController.clear();
  }
}

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              color: text == 'ADD' ? Colors.blue : Colors.red, width: 2),
          backgroundColor: text == 'ADD' ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Text(
            text,
            style: TextStyle(
              color: text == 'ADD' ? Colors.white : Colors.red,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              )),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType:
              text == 'Price' ? TextInputType.number : TextInputType.text,
          maxLines: text == 'Description' ? 5 : 1,
          decoration: InputDecoration(
            suffixIcon: text == 'Price' ? const Icon(Icons.attach_money) : null,
            fillColor: const Color(0xFFF3F3F3),
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
