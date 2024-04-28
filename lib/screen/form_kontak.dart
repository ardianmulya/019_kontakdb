import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kontak_db/controller/kontak_controller.dart';
import 'package:kontak_db/model/kontak.dart';
import 'package:kontak_db/screen/home_view.dart';
import 'package:kontak_db/screen/maps_screen.dart';

class FormKontak extends StatefulWidget {
  const FormKontak({super.key});

  @override
  State<FormKontak> createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _teleponController = TextEditingController();

  File? _image;
  final _imagePicker = ImagePicker();
  String? _alamat;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _namaController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Nama',
                        labelText: 'Nama',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 350,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _teleponController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan No Telpon',
                        labelText: 'No Telpon',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _image == null
                      ? const Text("Belum ada gambar yang dipilih")
                      : Container(
                          height: 250,
                          margin: const EdgeInsets.all(20),
                          child: Image.file(_image!),
                        ),
                  ElevatedButton(
                    onPressed: getImage,
                    child: const Text("Pilih Gambar"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      var result = await KontakController().addPerson(
                        Kontak(
                            nama: _namaController.text,
                            email: _emailController.text,
                            alamat: _alamat?? '',
                            telepon: _teleponController.text,
                            foto: _image!.path),
                        _image,
                      );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                result['message'],
                              ),
                            ),
                          );

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                              (route) => false);
                        }
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}