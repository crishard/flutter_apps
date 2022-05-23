import 'package:flutter/material.dart';

class DesafioLayout extends StatefulWidget {
  const DesafioLayout ({ Key? key }) : super(key: key);

  @override
  State<DesafioLayout> createState() => _DesafioLayoutState();
}

class _DesafioLayoutState extends State<DesafioLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,

      body: Stack(
       children: [
         SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(35),
            child: Column(
             children: [
               Padding(padding: const EdgeInsets.only(top: 20, bottom: 45),
               
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CircleAvatar(
                     radius: 40,
                     backgroundImage: AssetImage('assets/images/perfil.jpeg'),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: const [
                       Text('Olá', style: TextStyle(fontSize: 20, color: Colors.white),),
                       Text('João!', style: TextStyle(fontSize: 50, color: Colors.white),),
                     ],
                   )
                 ],
               ),
               ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                       Text(
                        "Parabéns! Esse mês você fez",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      // IconButton(
                      //   icon: Icons.remove_red_eye_outlined,
                      //   iconSize: 35,
                      //   color: Colors.white,
                      //   onPressed: () {
                      //     setState(() => {
                      //       if (!buttonClick) {
                      //         _myIcon = Icon(Icons.visibility_off),
                      //         buttonClick = true
                      //       } else {
                      //         _myIcon = Icon(Icons.visibility),
                      //         buttonClick = false
                      //       }
                      //     });
                      //   },
                      // )
                    ],
                  ),
             ],
           ),
           ),
         )
       ],
      ),
      
    );
  }
}