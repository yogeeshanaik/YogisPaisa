import 'package:flutter/material.dart';

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isSelected,
  });

  int id;
  String name;
  double price;
  String description;
  bool isSelected;
}

class DataTableWidget extends StatefulWidget {
  final List<List<dynamic>>? csvData;
  final bool firstRowHeader;
  const DataTableWidget(
      {super.key, required this.csvData, this.firstRowHeader = true});

  @override
  State<StatefulWidget> createState() {
    return DataTableWidgetState();
  }
}

class DataTableWidgetState extends State<DataTableWidget> {
  List<List<dynamic>> _items = [];
  List<dynamic> _headers = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    initParams();
  }

  @override
  void didUpdateWidget(DataTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.csvData != widget.csvData ||
        oldWidget.firstRowHeader != widget.firstRowHeader) {
      initParams();
    }
  }

  initParams() {
    setState(() {
      if (widget.firstRowHeader) {
        _headers = widget.csvData!.first;
        _items = (widget.csvData ?? []).skip(1).toList();
      } else {
        _items = (widget.csvData ?? []);

        int columnsCount = _items[0].length;
        _headers = List.generate(columnsCount, (int index) {
          return 'Column ${index + 1}';
        });
      }

      // match coulmns and row cells count
      if (_headers.isNotEmpty && _headers.length > 1) {
        int columnsCount = _headers.length;
        int rowCellsCount = _items[0].length;
        if (columnsCount > rowCellsCount) {
          int columnsToRemove = columnsCount - rowCellsCount;
          while (columnsToRemove > 0) {
            _headers.removeLast();
            columnsToRemove--;
          }
        }
      }
    });
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return _headers
        // .map(
        .asMap()
        .entries
        .map(
          (item) => DataColumn(
            label: Text(
              item.value.toString(),
            ),
            onSort: (int columnIndex, bool ascending) {
              try {
                if (ascending) {
                  _items.sort((item1, item2) =>
                      item1[item.key].compareTo(item2[item.key]));
                } else {
                  _items.sort((item1, item2) =>
                      item2[item.key].compareTo(item1[item.key]));
                }
              } catch (e) {}

              setState(() {
                _sortColumnIndex = columnIndex;
                _sortAscending = ascending;
              });
            },
          ),
        )
        .toList();
    /*
    return [
      DataColumn(
        label: const Text('No'),
        numeric: false, // Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label: const Text('Name'),
        numeric: false,
        tooltip: 'Name of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.name.compareTo(item2.name));
          } else {
            _items.sort((item1, item2) => item2.name.compareTo(item1.name));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Price'),
        numeric: false, // Deliberately set to false to avoid right alignment.
        tooltip: 'Price of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.price.compareTo(item2.price));
          } else {
            _items.sort((item1, item2) => item2.price.compareTo(item1.price));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Description'),
        numeric: false,
        tooltip: 'Description of the item',
      ),
    ];
    */
  }

  // DataRow _createRow(Item item) {
  DataRow _createRow(List<dynamic> item) {
    return DataRow(
      cells: item
          .map(
            (csvItem) => DataCell(
              Text(
                csvItem.toString(),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: (widget.csvData ?? []).isEmpty
              ? const SizedBox()
              : DataTable(
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  // columnSpacing: 0,
                  // dividerThickness: 5,
                  onSelectAll: (bool? isSelected) {
                    if (isSelected != null) {
                      // _items.forEach((item) {
                      //   // item.isSelected = isSelected;
                      // });

                      setState(() {});
                    }
                  },
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.purple, width: 10)),
                  // dataRowColor: MaterialStateColor.resolveWith(
                  //     (Set<MaterialState> states) =>
                  //         states.contains(MaterialState.selected)
                  //             ? Colors.blue
                  //             : Color.fromARGB(100, 215, 217, 219)),
                  // dataRowHeight: 80,
                  // dataTextStyle:
                  //     const TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
                  // headingRowColor: MaterialStateColor.resolveWith(
                  //     (states) => Theme.of(context).colorScheme.background),
                  // headingRowHeight: 80,
                  // headingTextStyle:
                  //     const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  // horizontalMargin: 10,
                  // showBottomBorder: true,
                  showCheckboxColumn: true,
                  columns: _createColumns(),
                  rows: _items
                      // .where((element) => element.length == _headers.length)
                      .map((item) => _createRow(item))
                      .toList(),
                ),
        ),
      ),
    );
  }
}
