import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/user/user_bloc.dart';

import 'package:estados/pages/pagina2_page.dart';
import 'package:estados/pages/pagina1_page.dart';
 
void main() => runApp( const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => UserBloc() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: Pagina1Page.routeName,
        routes: {
          Pagina1Page.routeName: ( _ ) => const Pagina1Page(),
          Pagina2Page.routeName: ( _ ) => const Pagina2Page(),
        },
      ),
    );
  }
}