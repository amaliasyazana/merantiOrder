import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../models/stall.dart';
import '../../views/stalls/open_edit_stall.dart';
import '../../views/stalls/stall_viewmodel.dart';

class StallFloat extends StatelessWidget {
  const StallFloat({super.key});

  Future<void> _addStall(StallViewModel viewmodel, BuildContext context) async {
    Stall? result = await openEditStall(viewmodel, Stall(), context);

    if (result == null) return;

    viewmodel.addNewStall(result);
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<StallViewModel>(
      builder: (_, viewmodel) => FloatingActionButton.extended(
        onPressed: () => _addStall(viewmodel, context),
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        elevation: 0,
        label: Text('Add New Stall'),
        backgroundColor: const Color.fromRGBO(120, 196, 164, 1.000),
      ),
    );
  }
}
