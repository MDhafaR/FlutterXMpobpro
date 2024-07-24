class NoteModel {
  int id;
  String judul;
  String isi;
  String updatedAt;

  NoteModel(this.id, this.judul, this.isi, this.updatedAt);

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      json["id"] as int, 
      json["judul"] ?? "",
      json["isi"] ?? "", 
      json["updated_at"] ?? "");
  }
}
