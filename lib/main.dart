import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practica2api/infrastructure/models/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0; // Contador
  Pokemon? pokemon;

  Future<void> getPokemon() async {
    counter++;
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$counter');
    pokemon = Pokemon.fromJson(response.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon ID: $counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pokemon?.name ?? 'No data'),
            if (pokemon != null) ...[
              Image.network(pokemon!.sprites.frontDefault),
              Image.network(pokemon!.sprites.backDefault),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPokemon();
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
