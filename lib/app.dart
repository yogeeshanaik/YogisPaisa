import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';
import 'package:paisa/core/theme/app_theme.dart';
import 'package:paisa/core/theme/paisa_theme.dart';
import 'package:paisa/features/account/presentation/bloc/accounts_bloc.dart';
import 'package:paisa/features/country_picker/data/models/country_model.dart';
import 'package:paisa/features/country_picker/domain/entities/country.dart';
import 'package:paisa/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:paisa/features/home/presentation/controller/summary_controller.dart';
import 'package:paisa/features/home/presentation/cubit/overview/overview_cubit.dart';
import 'package:paisa/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:paisa/main.dart';
import 'package:provider/provider.dart';

class PaisaApp extends StatefulWidget {
  const PaisaApp({
    Key? key,
    required this.settings,
  }) : super(key: key);

  final Box<dynamic> settings;

  @override
  State<PaisaApp> createState() => _PaisaAppState();
}

class _PaisaAppState extends State<PaisaApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<SettingCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<AccountBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<OverviewCubit>(),
        ),
        Provider(
          create: (context) => getIt.get<SummaryController>(),
        ),
        Provider<Box<dynamic>>(
          create: (context) => widget.settings,
        ),
      ],
      child: ValueListenableBuilder<Box>(
        valueListenable: widget.settings.listenable(
          keys: [
            appColorKey,
            dynamicThemeKey,
            themeModeKey,
            calendarFormatKey,
            userCountryKey,
            appLanguageKey,
            appFontChangerKey,
          ],
        ),
        builder: (context, value, _) {
          final bool isDynamic = value.get(
            dynamicThemeKey,
            defaultValue: false,
          );
          final ThemeMode themeMode = ThemeMode.values[value.get(
            themeModeKey,
            defaultValue: 0,
          )];
          final int color = value.get(
            appColorKey,
            defaultValue: 0xFF795548,
          );
          final Color primaryColor = Color(color);
          final Locale locale =
              Locale(value.get(appLanguageKey, defaultValue: 'en'));

          return ProxyProvider0<Country>(
            update: (BuildContext context, _) {
              final Map? jsonString = value.get(userCountryKey);
              final Country model =
                  CountryModel.fromJson(jsonString ?? {}).toEntity();
              return model;
            },
            child: DynamicColorBuilder(
              builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                ColorScheme lightColorScheme;
                ColorScheme darkColorScheme;
                if (lightDynamic != null && darkDynamic != null && isDynamic) {
                  lightColorScheme = lightDynamic.harmonized();
                  darkColorScheme = darkDynamic.harmonized();
                } else {
                  lightColorScheme = ColorScheme.fromSeed(
                    seedColor: primaryColor,
                  );
                  darkColorScheme = ColorScheme.fromSeed(
                    seedColor: primaryColor,
                    brightness: Brightness.dark,
                  );
                }

                return MaterialApp.router(
                  locale: locale,
                  routerConfig: goRouter,
                  debugShowCheckedModeBanner: false,
                  themeMode: themeMode,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  onGenerateTitle: (BuildContext context) =>
                      context.loc.appTitle,
                  theme: AppTheme.lightThemeData(
                    context: context,
                    colorScheme: lightColorScheme,
                    value: value,
                  ),
                  darkTheme: AppTheme.darkThemeData(
                    context: context,
                    colorScheme: darkColorScheme,
                    value: value,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
