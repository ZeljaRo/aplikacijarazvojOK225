import '../models/profil.dart';

class AktivniProfilService {
  static Profil? _aktivni;

  static void postavi(Profil profil) {
    _aktivni = profil;
  }

  static Profil? dohvati() {
    return _aktivni;
  }
}
