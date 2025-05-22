class TranspozicijaController {
  static int _korak = 0;

  static void uvecajKorak() {
    _korak++;
  }

  static void umanjiKorak() {
    _korak--;
  }

  static String transponirajTekst(String tekst) {
    final linije = tekst.split('\n');
    final noveLinije = linije.map((red) => _transponirajRed(red)).toList();
    return noveLinije.join('\n');
  }

  static String _transponirajRed(String red) {
    final regex = RegExp(r'\(([A-Ha-h][#b]?[^\)]*)\)');
    return red.replaceAllMapped(regex, (match) {
      final akord = match.group(1)!;
      final transponirano = _transponirajAkord(akord);
      return '($transponirano)';
    });
  }

  static String _transponirajAkord(String akord) {
    final note = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'H'];
    for (final n in note) {
      if (akord.toUpperCase().startsWith(n)) {
        final index = note.indexOf(n);
        final noviIndex = (index + _korak) % 12;
        final novaNota = note[noviIndex < 0 ? noviIndex + 12 : noviIndex];
        return novaNota + akord.substring(n.length);
      }
    }
    return akord;
  }
}
