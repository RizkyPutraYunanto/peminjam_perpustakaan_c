import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjam_controller.dart';

class PeminjamView extends GetView<PeminjamController> {
  const PeminjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PeminjamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
