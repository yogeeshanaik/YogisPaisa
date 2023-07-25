import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'loadCsvDataScreen.dart';

class AllCsvFilesScreen extends StatelessWidget {
  const AllCsvFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All CSV Files")),
      body: FutureBuilder(
        future: _getAllCsvFiles(),
        builder: (context, AsyncSnapshot<List<FileSystemEntity>> snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("empty");
          }
          print('${snapshot.data?.length} ${snapshot.data}');
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Csv File found.'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => Card(
              child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            LoadCsvDataScreen(path: snapshot.data![index].path),
                      ),
                    );
                  },
                  title: Text(
                    snapshot.data![index].path.substring(44),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            itemCount: snapshot.data?.length,
          );
        },
      ),
    );
  }

  Future<List<FileSystemEntity>> _getAllCsvFiles() async {
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/";
    final myDir = Directory(path);
    List<FileSystemEntity> _csvFiles;
    _csvFiles = myDir.listSync(recursive: true, followLinks: false);
    _csvFiles.sort((a, b) {
      return b.path.compareTo(a.path);
    });
    return _csvFiles;
  }
}
