import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:desafio_layout/components/cards/notificacoes.dart';
import 'package:desafio_layout/components/expandable_fab/expandable_fab.dart';
import 'package:desafio_layout/components/cards/card_ganhos.dart';
import 'package:desafio_layout/components/topo/perfil.dart';
import 'package:desafio_layout/style/text/text_padrao.dart';
import 'package:desafio_layout/style/themes/mudatema.dart';
import 'package:desafio_layout/style/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:desafio_layout/style/themes/tema.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Desafio extends StatefulWidget {
  const Desafio({ Key? key }) : super(key: key);
  @override
  State<Desafio> createState() => _DesafioState();
}

class _DesafioState extends State<Desafio>{

  Icon _IconVisibilidade = const Icon(Icons.visibility);
  bool botaoVizualizar = false;
  int _currentIndex = 0;
  Icon iconTema = const Icon(Icons.bedtime);
  bool temaClaro = true;

  // função para esconder e mostrar valores
  vizualizarValores(){
    setState(() => {
        if (!botaoVizualizar) {
          _IconVisibilidade = const Icon(Icons.visibility_off),
          botaoVizualizar = true
        } else {
          _IconVisibilidade = const Icon(Icons.visibility),
          botaoVizualizar = false
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    ColorScheme esquemaDeCores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: esquemaDeCores.background,
        actions: [
          Switch(
            activeColor: esquemaDeCores.secondaryVariant,
            activeTrackColor: esquemaDeCores.secondaryVariant,
              inactiveThumbColor: esquemaDeCores.primaryVariant,
              inactiveTrackColor: esquemaDeCores.tertiary.withAlpha(100),
            value:  context.read<TemaCubit>().state.brightness == Brightness.light
                      ? false
                      : true,
              onChanged: (_) {
                context.read<TemaCubit>().alteraTema();
              },
          )
        ],  
        elevation: 0,),
      backgroundColor: esquemaDeCores.background,
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  Perfil(escolhaTema: temaClaro),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextPadrao(name: "Parabéns! Esse mês você fez",),
                      IconButton(
                        icon: _IconVisibilidade,
                        iconSize: 35,
                        color: esquemaDeCores.tertiary,
                        onPressed: () { vizualizarValores();},
                      )
                    ],
                  ),
                  NotificacoesCard(colorComponents: temaClaro, visibility: botaoVizualizar,),
                  const SizedBox(height: 15,),
                  GanhosCard(colorComponents: temaClaro, visibility: botaoVizualizar,),
                ],
              ),),),
      floatingActionButton: const ExpandableFab(
            distance: 93,
            children: [
              ActionButton(name: 'representantes', icon: Icon(Icons.person_add_alt_sharp, color: Colors.white,),),
              ActionButton(name: 'pedidos', icon:  Icon(Icons.add_shopping_cart, color: Colors.white,),),
              ActionButton(name: 'clientes', icon:  Icon(Icons.person_add_alt_sharp, color: Colors.white,),),
            ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: esquemaDeCores.background,
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 15,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavyBarItem(
            icon:const Icon(Icons.home, size: 32,),
            title: TextPadrao(name: 'Home',),
            activeColor: esquemaDeCores.primary,
            textAlign: TextAlign.center,
        ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shop_2, size: 32), 
            title:  TextPadrao(name: "Loja",), 
            activeColor: esquemaDeCores.primary, 
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people_alt, size: 32), 
            title:  TextPadrao(name: 'Pessoas',), 
            activeColor: esquemaDeCores.primary, 
            textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.show_chart, size: 32), 
            title: TextPadrao(name: "Dados",), 
            activeColor: esquemaDeCores.primary, 
            textAlign: TextAlign.center),
        ],
      ),
    );
  }
}