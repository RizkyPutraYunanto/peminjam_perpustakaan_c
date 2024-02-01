import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_c/app/data/model/response_getbook.dart';
import 'package:peminjam_perpustakaan_c/app/data/model/respon_pinjam.dart';
import 'package:peminjam_perpustakaan_c/app/data/provider/storage_provider.dart';

import '../../../data/konstan/end_point.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPeminjaman>> {
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPinjamBuku();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPinjamBuku() async{
    change(null, status: RxStatus.loading());

    try {

      // final response = await ApiProvider.instance().get(Endpoint.book,);
      final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${StorageProvider.read(StorageKey.iduser)}");
      if (response.statusCode == 200) {
        final ResponseGetbook responsePinjam = ResponseGetbook.fromJson(response.data);
        if(responsePinjam.data!.isEmpty){
          change(null, status: RxStatus.empty());
        }else{
          change(responsePinjam.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error("${e.response?.data['message']}"));
      }

    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}