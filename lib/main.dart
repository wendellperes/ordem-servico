import 'package:desafio_os/core/database/database_helper.dart';
import 'package:desafio_os/app_router.dart';
import 'package:desafio_os/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   setupRegisterDependencies();

  // Inicializa o banco de dados
  final dbHelper = DatabaseHelper();
  final dbExists = await dbHelper.doesDatabaseExist();

  if (!dbExists) {
    print('Inicializando o banco de dados...');
    await dbHelper.database; // Isso criará o banco de dados se ele não existir
  } else {
    print('Banco de dados já inicializado.');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    const borderSideMain = BorderSide(color: Color(0xFF4059D7));
    const borderSideDisabled = BorderSide(color: Color(0xFFC6C6C6));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: 'Conta Bemol',
        theme: ThemeData(
          useMaterial3: true,
          disabledColor: const Color(0xFFC6C6C6),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color(0xFF4059D7),
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Montserrat',
          unselectedWidgetColor: const Color(0xFF4059D7),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Color(0xFF646464),
              height: 0.5,
            ),
            border: UnderlineInputBorder(
              borderSide: borderSideDisabled,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: borderSideDisabled,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: borderSideMain,
            ),
            hintStyle: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: borderSideDisabled,
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: borderSideDisabled,
            ),
            prefixStyle: TextStyle(
              fontSize: 18,
              color: Color(0xFFC6C6C6),
            ),
            isDense: true,
            counterStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            side: const BorderSide(color: Color(0xFF4059D7), width: 2),
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xFF4059D7);
              }
              return Colors.white;
            }),
          ),
          primaryColor: const Color(0xFF4059D7),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF4059D7),
            secondary: Colors.white,
            background: Colors.white,
          ),
          dialogTheme: const DialogTheme(backgroundColor: Colors.white),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.white),
          datePickerTheme: const DatePickerThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
        ),
        themeMode: ThemeMode.light,
        routerConfig: appRouter,
      ),
    );
  }
}
