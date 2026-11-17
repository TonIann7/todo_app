import 'package:flutter/material.dart';

import 'attivita.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ElencoPage(title: 'Elenco Attività'),
    );
  }
}

class ElencoPage extends StatefulWidget {
  const ElencoPage({super.key, required this.title});

  final String title;

  @override
  State<ElencoPage> createState() => _ElencoPageState();
}

class _ElencoPageState extends State<ElencoPage> {
  final List<Attivita> _attivita = [
    Attivita(titolo: 'Fare la spesa', completata: true),
    Attivita(titolo: 'Giocare a GTA VI', importante: true),
    Attivita(titolo: 'Pagare la bolletta', importante: false),
  ];

  int get _numCompletate => _attivita
      .where((a) => a.completata)
      .length; //conta tutte le attività contrassegnate come completate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '$_numCompletate/${_attivita.length}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: _attivita.isEmpty
          ? const Center(
              child: Text(
                'Nessuna attività.\n Premi + per aggiungerne una.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: _attivita.length,
              itemBuilder: (context, index) {
                final attivita = _attivita[index];
                return ListTile(
                  leading: Icon(
                    attivita.completata
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: attivita.completata ? Colors.green : null,
                  ),
                  title: Text(
                    attivita.titolo,
                    style: TextStyle(
                      decoration: attivita.completata
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: attivita.importante
                      ? const Icon(Icons.star, color: Colors.amber)
                      : null,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nuova attività',
        child: const Icon(Icons.add),
      ),
    );
  }
}
