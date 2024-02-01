/// status : 200
/// message : "success"
/// data : [{"id":4,"user_id":"2","book_id":"1","tanggal_pinjam":"2024-01-01 00:00:00","tanggal_kembali":"2024-01-10 00:00:00","status":"DIPINJAM","created_at":"2024-01-31T03:50:24.000000Z","updated_at":"2024-01-31T03:50:24.000000Z","book":{"id":1,"kategori_id":"1","judul":"MENJADI ANAK JAWA","penulis":"Naufal Jawa","penerbit":"Naufal Company","tahun_terbit":"2023","created_at":"2024-01-31T03:37:50.000000Z","updated_at":"2024-01-31T03:37:50.000000Z"}}]

class ResponseGetbook {
  ResponseGetbook({
      this.status, 
      this.message, 
      this.data,});

  ResponseGetbook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPeminjaman.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataPeminjaman>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// user_id : "2"
/// book_id : "1"
/// tanggal_pinjam : "2024-01-01 00:00:00"
/// tanggal_kembali : "2024-01-10 00:00:00"
/// status : "DIPINJAM"
/// created_at : "2024-01-31T03:50:24.000000Z"
/// updated_at : "2024-01-31T03:50:24.000000Z"
/// book : {"id":1,"kategori_id":"1","judul":"MENJADI ANAK JAWA","penulis":"Naufal Jawa","penerbit":"Naufal Company","tahun_terbit":"2023","created_at":"2024-01-31T03:37:50.000000Z","updated_at":"2024-01-31T03:37:50.000000Z"}

class DataPeminjaman {
  DataPeminjaman({
      this.id, 
      this.userId, 
      this.bookId, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.book,});

  DataPeminjaman.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bookId = json['book_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }
  int? id;
  String? userId;
  String? bookId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  String? createdAt;
  String? updatedAt;
  Book? book;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['book_id'] = bookId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (book != null) {
      map['book'] = book?.toJson();
    }
    return map;
  }

}

/// id : 1
/// kategori_id : "1"
/// judul : "MENJADI ANAK JAWA"
/// penulis : "Naufal Jawa"
/// penerbit : "Naufal Company"
/// tahun_terbit : "2023"
/// created_at : "2024-01-31T03:37:50.000000Z"
/// updated_at : "2024-01-31T03:37:50.000000Z"

class Book {
  Book({
      this.id, 
      this.kategoriId, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.createdAt, 
      this.updatedAt,});

  Book.fromJson(dynamic json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? kategoriId;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}