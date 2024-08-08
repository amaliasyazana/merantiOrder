import 'package:flutter/material.dart';

import '../../models/stall.dart';

class StallEdit extends StatefulWidget {
  final Stall stall;
  const StallEdit({super.key, required this.stall});

  @override
  State<StallEdit> createState() => _StallEditState();
}

class _StallEditState extends State<StallEdit> {
  late TextEditingController nameController;
  late TextEditingController categoryController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.stall.name);
    categoryController = TextEditingController(text: widget.stall.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Stalls'),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: 'Stall Name', border: OutlineInputBorder()),
              onChanged: (value) => widget.stall.name = value,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                  labelText: 'Category', border: OutlineInputBorder()),
              onChanged: (value) => widget.stall.category = value,
            ),
            const Expanded(
              child: SizedBox.expand(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  width: 180,
                  child: TextButton(
                      onPressed: () {
                        nameController.text = "";
                        categoryController.text = "";
                      },
                      child: const Text('Clear')),
                ),
                ElevatedButton(
                    onPressed: () {
                      _saveChanges();
                      Navigator.pop(context, widget.stall);
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
    );
  }

  void _saveChanges() {
    widget.stall.name = nameController.text;
    widget.stall.category = categoryController.text;
  }
}
