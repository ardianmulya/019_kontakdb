class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String telepon;
  final String foto;
  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.telepon,
    required this.foto,
  });
  Kontak copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? telepon,
    String? foto,
  }) {
    return Kontak(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
      foto: foto ?? this.foto,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'telepon': telepon,
      'foto': foto,
    };
  }

  factory Kontak.fromMap(Map<String, dynamic> map) {
    return Kontak(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      telepon: map['telepon'] as String,
      foto: map['foto'] as String,
    );
  }
}

