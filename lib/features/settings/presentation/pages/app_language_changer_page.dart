import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/core/widgets/paisa_widgets/paisa_annotate_region_widget.dart';
import 'package:paisa/features/settings/presentation/widgets/app_language_changer.dart';
import 'package:provider/provider.dart';

import 'package:paisa/core/common.dart';

class AppLanguageChangerPage extends StatelessWidget {
  const AppLanguageChangerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LanguageEntity> languages = Languages.languages.sorted(
      (a, b) => a.value.compareTo(b.value),
    );

    late String selectedCode = Provider.of<Box<dynamic>>(context, listen: false)
        .get(appLanguageKey, defaultValue: 'en');

    return PaisaAnnotatedRegionWidget(
      color: context.background,
      child: Scaffold(
        appBar: context.materialYouAppBar(context.loc.chooseAppLanguage),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: languages.length,
          itemBuilder: (_, index) {
            final LanguageEntity entity = languages[index];
            return ListTile(
              onTap: () {
                Provider.of<Box<dynamic>>(_, listen: false)
                    .put(appLanguageKey, entity.code)
                    .then((_) => context.pop());
              },
              title: Text(
                entity.value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
