import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormKontak extends StatefulWidget {
  const FormKontak({super.key});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _alamatController = TextEditingController();
  final _teleponController = TextEditingController();

  File? _image;
  final _imagePicker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          print("No image selected");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nama", hintText: "Masukkan Nama Anda"),
                controller: _namaController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email", hintText: "Masukkan Email Anda"),
                controller: _emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Alamat", hintText: "Masukkan Alamat Anda"),
                controller: _alamatController,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "No Handphone",
                    hintText: "Masukkan No Handphone Anda"),
                controller: _teleponController,
              ),
            ),
            _image == null
                ? const Text("Belum ada gambar yang dipilih")
                : Image.file(_image!),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Pilih Gambar"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Simpan")),
            ),
          ],
        ),
      ),
    );
  }
}