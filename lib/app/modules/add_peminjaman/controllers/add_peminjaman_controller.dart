import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peminjam_perpustakaan_c/app/data/konstan/end_point.dart';
import 'package:peminjam_perpustakaan_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_c/app/modules/book/controllers/book_controller.dart';

final loading = false.obs;

class AddPeminjamanController extends GetxController {
  //TODO: Implement AddPeminjamanController
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController user_idController = TextEditingController();
  final TextEditingController book_idController = TextEditingController();
  final TextEditingController tanggal_peminjamanController = TextEditingController();
  final TextEditingController tanggal_pengembalianController = TextEditingController();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addBook() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data:
            {
              "user_id": StorageProvider.read(StorageKey.iduser),
              "book_id": Get.parameters['id'],
              "tanggal_pinjam": tanggal_peminjamanController.text.toString(),
              "tanggal_kembali": tanggal_pengembalianController.text.toString()
            }
        );
        if (response.statusCode == 201) {
          Get.back();
        } else {
          ;Get.snackbar("Login Failed", "Username or Password Invalid",
              backgroundColor: Colors.red);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry 1", "${e.response?.data['message']}",
              backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar("Sorry 2", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Sorry 3", e.toString(), backgroundColor: Colors.red);
    }
  }
}
