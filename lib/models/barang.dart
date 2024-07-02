class Barang {
  String? namaLengkap;
  String? jenisKelamin;
  String? barangPinjaman;
  String? deskripsi;
  String? kontak;
  int? hargaPerHari;
  String? tanggalPinjam;
  String? tanggalTempo;

  Barang({
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.barangPinjaman,
    required this.deskripsi,
    required this.kontak,
    required this.hargaPerHari,
    required this.tanggalPinjam,
    required this.tanggalTempo,
  });

  

  @override
  String toString() {
    return 'Barang(namaLengkap: $namaLengkap, jenisKelamin: $jenisKelamin, barangPinjaman: $barangPinjaman, deskripsi: $deskripsi, kontak: $kontak, hargaPerHari: $hargaPerHari, tanggalPinjam: $tanggalPinjam, tanggalTempo: $tanggalTempo)';
  }
}
