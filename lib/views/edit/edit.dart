import 'package:flutter/material.dart';
import '../../models/menuAdmin.dart';

class Edit extends StatefulWidget {
  final String stallId;
  final MenuAdmin menu;
  const Edit({super.key, required this.menu, required this.stallId});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.menu.name);
    categoryController = TextEditingController(text: widget.menu.category);
    descriptionController =
        TextEditingController(text: widget.menu.description);
    priceController = TextEditingController(text: widget.menu.price);
    imageController = TextEditingController(text: widget.menu.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Menu'),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Item Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Item Name', border: OutlineInputBorder()),
                onChanged: (value) => widget.menu.name = value,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                    labelText: 'Price', border: OutlineInputBorder()),
                onChanged: (value) => widget.menu.price = value,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(
                    labelText: 'Category', border: OutlineInputBorder()),
                onChanged: (value) => widget.menu.category = value,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Description', border: OutlineInputBorder()),
                onChanged: (value) => widget.menu.description = value,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Image URL', border: OutlineInputBorder()),
                onChanged: (value) => widget.menu.imageUrl = value,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        nameController.text = "";
                        categoryController.text = "";
                        descriptionController.text = "";
                        priceController.text = '';
                        imageController.text = '';
                      },
                      child: const Text('Clear')),
                  ElevatedButton(
                      onPressed: () {
                        if (widget.menu.imageUrl != '') {
                          _saveChanges();
                          Navigator.pop(context, widget.menu);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('You did not put an image'),
                            ),
                          );
                          widget.menu.imageUrl =
                              'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg';
                          _saveChanges();
                          Navigator.pop(context, widget.menu);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(180, 40),
                          backgroundColor:
                              const Color.fromRGBO(120, 196, 164, 1.000)),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    widget.menu.name = nameController.text;
    widget.menu.price = priceController.text;
    widget.menu.category = categoryController.text;
    widget.menu.description = descriptionController.text;
    widget.menu.stallId = widget.stallId;
  }
}
