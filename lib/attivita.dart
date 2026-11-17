class Attivita {
  final String titolo;
  bool completata;
  bool importante;

  Attivita({
    required this.titolo,
    this.completata = false,
    this.importante = false,
  });
}
