class Profil {
  final String ime;
  final String mapa;

  Profil({required this.ime, required this.mapa});

  Map<String, dynamic> toJson() => {
        'ime': ime,
        'mapa': mapa,
      };

  static Profil fromJson(Map<String, dynamic> json) {
    return Profil(
      ime: json['ime'],
      mapa: json['mapa'],
    );
  }
}
