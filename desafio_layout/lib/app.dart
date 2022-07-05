import 'package:desafio_layout/style/themes/mudatema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/desafio_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TemaCubit>(
      create: (_) => TemaCubit(),
      child:  BlocBuilder<TemaCubit, ThemeData>(
        builder: (context, state) {
           return MaterialApp(
            title: "Desafio Layout",
            debugShowCheckedModeBanner: false,
            home: const Desafio(),
            theme: state,
          );
    },
    ));
  }
}



// class ImcObserver extends BlocObserver {
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     if (kDebugMode) {
//       print('${bloc.runtimeType} $change');
//     }
//   }
// }