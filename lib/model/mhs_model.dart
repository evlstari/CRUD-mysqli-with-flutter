class Mahasiswa {
   int id;
   String name;
   String nim;
   String asal;

  Mahasiswa({ this.id = 0, required this.name, required this.nim, required this.asal});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      id: int.parse(json['id']) ?? 0,
      name: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      asal: json['asal'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': name,
      'nim': nim,
      'asal': asal,
    };
  }
}