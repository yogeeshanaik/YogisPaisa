import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/common.dart';
import '../../widgets/paisa_text_field.dart';
import '../../widgets/paisa_user_image_widget.dart';

class SaveFieldMappingPage extends StatelessWidget {
  const SaveFieldMappingPage({
    Key? key,
    required this.fieldMappingList,
    required this.settings,
    required this.controller,
  }) : super(key: key);

  final List<String> fieldMappingList;
  final Box<dynamic> settings;

  final TextEditingController controller;

  final fieldMappingKey = "fieldMappingProfilesKey";

  void _updateDetails(BuildContext context) {
    String name = controller.text;

    Map<dynamic, dynamic> profiles =
        settings.get(fieldMappingKey, defaultValue: <dynamic, dynamic>{});

    if (profiles.containsKey(name)) {
      profiles[name] = fieldMappingList;
    } else {
      profiles.addAll({name: fieldMappingList});
    }
    settings
        .put(fieldMappingKey, profiles)
        .then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Save field mapping",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: PaisaTextFormField(
                      controller: controller,
                      hintText: 'Enter name',
                      keyboardType: TextInputType.name,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () => _updateDetails(context),
                child: const Text("Save"),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
