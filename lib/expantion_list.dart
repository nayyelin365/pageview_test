// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expantiontitle_test/expansion_tile.dart';
import 'package:expantiontitle_test/provider/listview_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpansionTitleLisst extends ConsumerStatefulWidget {
  const ExpansionTitleLisst({super.key});

  @override
  ConsumerState<ExpansionTitleLisst> createState() =>
      _ExpansionTitleLisstState();
}

class _ExpansionTitleLisstState extends ConsumerState<ExpansionTitleLisst> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(clickCupertinoPickerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Test${selectedIndex.toString()}"),
      ),
      body: Column(
        children: [ 
          SizedBox(
            height: 400,
            child: ListView(
              key: Key(selectedIndex.toString()),
              children: [
                ExpansionTileWidget(
                  index: 1,
                  selectedIndex: selectedIndex,
                ),
                ExpansionTileWidget(index: 2, selectedIndex: selectedIndex),
                ExpansionTileWidget(index: 3, selectedIndex: selectedIndex),
                ExpansionTileWidget(index: 4, selectedIndex: selectedIndex),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                maximumYear: 2024,
                minimumYear: 2023,
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime dateTimeChanged) {}),
          )
        ],
      ),
    );
  }
}
