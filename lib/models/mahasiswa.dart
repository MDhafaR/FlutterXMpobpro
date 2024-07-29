class Mahasiswa {
  int id;
  String nama;
  String nim;
  String kelas;

  Mahasiswa(this.id, this.nama, this.nim, this.kelas);

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(json["id"] as int, json["nama"] as String,
        json["nim"] as String, json["kelas"] as String);
  }
}
