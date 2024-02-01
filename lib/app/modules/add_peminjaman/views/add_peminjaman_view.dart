import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),

      body: Form(
          key: controller.formKey,
          child: Column(
              children: [
                TextFormField(
                    controller: controller.tanggal_peminjamanController,
                    decoration: InputDecoration(hintText: "Masukan Tanggal Pinjam"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "judu tidak boleh kosong";
                      }
                      return null;
                    }),
                TextFormField(
                  controller: controller.tanggal_pengembalianController,
                  decoration: InputDecoration(hintText: "Masukan tanggal Pengembalian"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "penulis tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() => controller.loading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    controller.addBook();
                  },
                  child: Text('Pinjam'),
                )),
              ])),
      );
  }
}
