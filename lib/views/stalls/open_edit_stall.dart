import 'package:flutter/material.dart';
import '../../views/stalls/stall_viewmodel.dart';

import '../../models/stall.dart';
import '../edit/editStall.dart';

Future<Stall?> openEditStall(
    StallViewModel viewmodel, Stall stall, BuildContext context) async {
  Stall? result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StallEdit(
                stall: stall,
              )));

  if (result == null) return null;
  return result;
}
