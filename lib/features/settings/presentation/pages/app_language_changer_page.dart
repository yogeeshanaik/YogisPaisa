import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_annotate_region_widget.dart';
import 'package:paisa/features/settings/presentation/widgets/app_language_changer.dart';
import 'package:provider/provider.dart';

import 'package:paisa/core/common.dart';

class AppLanguageChangerPage extends StatefulWidget {
  const AppLanguageChangerPage({super.key});

  @override
  State<AppLanguageChangerPage> createState() => _AppLanguageChangerPageState();
}

class _AppLanguageChangerPageState extends State<AppLanguageChangerPage> {
  final List<LanguageEntity> languages = Languages.languages.sorted(
    (a, b) => a.value.compareTo(b.value),
  );

  late String selectedCode = Provider.of<Box<dynamic>>(context, listen: false)
      .get(appLanguageKey, defaultValue: 'en');

  @override
  Widget build(BuildContext context) {
    return PaisaAnnotatedRegionWidget(
      color: context.background,
      child: Scaffold(
        appBar: context.materialYouAppBar(context.loc.chooseAppLanguage),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () => context.pop(),
                child: Text(context.loc.cancel),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () => context.pop(selectedCode),
                child: Text(context.loc.done),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final LanguageEntity entity = languages[index];
            return ListTile(
              onTap: () {
                setState(() {
                  selectedCode = entity.code;
                });
              },
              title: Text(
                entity.value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selectedCode == entity.code
                        ? Theme.of(context).colorScheme.primary
                        : null),
              ),
            );
          },
        ),
      ),
    );
  }
}
