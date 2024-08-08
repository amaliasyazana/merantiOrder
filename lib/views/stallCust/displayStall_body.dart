import 'package:flutter/material.dart';
import 'package:map_mvvm/view/view.dart';
import '../../views/menuCust/displayMenu.dart';

import '../stalls/stall_viewmodel.dart';

class displayStallBody extends StatelessWidget {
  const displayStallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<StallViewModel>(
      builder: (_, viewmodel) => ListView.builder(
          itemCount: viewmodel.stallCount,
          itemBuilder: (_, index) => Card(
                child: ListTile(
                  title: Text(viewmodel.stalls[index].name),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DisplayMenu(stallId: viewmodel.stalls[index].id),
                      ),
                    );
                  },
                ),
              )),
    );
  }
}
