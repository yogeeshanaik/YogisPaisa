import 'package:flutter/material.dart';

class ReorderableListWidget extends StatefulWidget {
  final String title;
  final bool enableReorder;
  final List<String> itemList;
  final Function? removeItemCallback;
  // final Function? reorderItemCallback;
  final Function? resetCallback;
  final Function? valueCallback;
  const ReorderableListWidget(
      {super.key,
      required this.title,
      this.enableReorder = true,
      required this.itemList,
      this.removeItemCallback,
      // this.reorderItemCallback,
      this.resetCallback,
      this.valueCallback});

  @override
  State<ReorderableListWidget> createState() => _ReorderableListWidgetState();
}

class _ReorderableListWidgetState extends State<ReorderableListWidget> {
  // final List<int> _items = List<int>.generate(50, (int index) => index);

  late List<String> _allItems = [];

  @override
  void initState() {
    super.initState();
    _allItems = widget.itemList;
  }

  late List<String> _items = _allItems.toList();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          color: Theme.of(context).cardColor,
          child: Row(
            children: [
              Text(
                widget.title,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _items = _allItems.toList();
                    if (widget.resetCallback != null) {
                      widget.resetCallback!();
                    }
                    if (widget.valueCallback != null) {
                      widget.valueCallback!(_items);
                    }
                  });
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReorderableListView(
            // buildDefaultDragHandles: true,
            padding: const EdgeInsets.symmetric(horizontal: 1),
            children: <Widget>[
              for (int index = 0; index < _items.length; index += 1)
                ListTile(
                  key: Key('$index'),
                  // tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text(_items[index]),
                  // subtitle: Text("test sub title with extra length"),
                  leading: widget.enableReorder == false
                      ? null
                      : ReorderableDragStartListener(
                          index: index,
                          child: const Icon(Icons.drag_indicator_outlined),
                        ),
                  trailing:
                      // Badge(
                      //   alignment: Alignment.centerRight,
                      //   label: Text("${index + 1}"),
                      //   // backgroundColor: Theme.of(context).colorScheme.scrim,
                      //   backgroundColor: Colors.grey[500],
                      //   child:
                      IconButton(
                    onPressed: () {
                      setState(() {
                        _items.removeAt(index);
                        if (widget.removeItemCallback != null) {
                          widget.removeItemCallback!(index);
                        }
                        if (widget.valueCallback != null) {
                          widget.valueCallback!(_items);
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                    ),
                  ),
                  // ),
                ),
            ],
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final String item = _items.removeAt(oldIndex);
                _items.insert(newIndex, item);

                if (widget.valueCallback != null) {
                  widget.valueCallback!(_items);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
