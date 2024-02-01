import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_c/app/routes/app_pages.dart';

import '../../../data/model/respon_book.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!. length,
        itemBuilder: (context, index){
          DataBook dataBook = state[index];
          return ListTile(
            leading: Icon(FontAwesomeIcons.bookSkull),
            title: Text("${dataBook.judul}"),
            subtitle: Text("Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}"),
            trailing : ElevatedButton(onPressed: ()=> Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
              'id' : (dataBook.id ??0).toString(), 'judul': dataBook.judul??''
          }),
              child: Text("Pinjam"),),
          );
        },
        separatorBuilder: (context, index)=> Divider(),
      ),onLoading: Center(child: CupertinoActivityIndicator())
      )
    );
  }
}
