import '../models/profil.dart';
import '../services/profil_storage_service.dart';

class ProfilController {
  final _service = ProfilStorageService();
  List<Profil> profili = [];

  Future<void> ucitaj() async {
    profili = await _service.ucitaj();
  }

  Future<void> dodajProfil(String ime, String mapa) async {
    final novi = Profil(ime: ime, mapa: mapa);
    profili.add(novi);
    await _service.spremi(profili);
  }
}
