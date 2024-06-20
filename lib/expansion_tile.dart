import 'provider/listview_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class ExpansionTileWidget extends ConsumerStatefulWidget {
  int index;
  int selectedIndex;
  ExpansionTileWidget(
      {required this.index, required this.selectedIndex, super.key});

  @override
  ConsumerState<ExpansionTileWidget> createState() =>
      _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends ConsumerState<ExpansionTileWidget> {
  int selectedIndex = -1;
  late int index;

  @override
  void initState() {
    super.initState();
    //index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;
    index = widget.index;
    return ExpansionTile(
      key: Key(index.toString()),
      initiallyExpanded: index == selectedIndex,
      title: Text('ExpansionTile $index$selectedIndex'),
      subtitle: const Text('Trailing expansion arrow icon'),
      onExpansionChanged: ((isExpanded) {
        selectedIndex = index;
        ref.read(clickCupertinoPickerProvider.notifier).state = selectedIndex;
      }),
      children: [
        ListTile(
          title: Text('This is tile number $index'),
        ),
      ],
    );
  }
}
