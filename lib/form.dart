import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/budget.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int? _nominal = 0;
  String? _jenis;
  final _controllerJudul = TextEditingController();
  final _controllerNominal = TextEditingController();

  void clearText() {
    _controllerJudul.clear();
    _controllerNominal.clear();
    _jenis = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: buildDrawer(context),
      body: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                      // Menggunakan padding sebesar 8 pixel
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Contoh: Sate Pacil",
                                labelText: "Judul",

                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              controller: _controllerJudul,
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  _judul = value!;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _judul = value!;
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Judul tidak boleh kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10, // <-- SEE HERE
                            ),
                            TextFormField(
                              controller: _controllerNominal,
                              decoration: InputDecoration(
                                hintText: "Contoh: 20000",
                                labelText: "Nominal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _nominal = int.tryParse(value!);
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  _nominal = int.parse(value!);
                                });
                              },
                              // Validator sebagai validasi form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nominal tidak boleh kosong!';
                                } else if (_nominal == null) {
                                  return 'Nominal harus angka!';
                                }
                                return null;
                              },
                            )
                          ])),
                  const SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  SizedBox(
                    width: 120,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        // isCollapsed: true,
                        enabledBorder: InputBorder.none,
                      ),
                      hint: const Text("Pilih Jenis"),
                      value: _jenis,
                      validator: (value) =>
                          value == null ? "Pilih Jenis" : null,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Pengeluaran',
                          child: Text('Pengeluaran'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Pemasukan',
                          child: Text('Pemasukan'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _jenis = value!;
                        });
                      },
                    ), // <-- SEE HERE
                  ),

                  // kebawahin button
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ListBudget.data
                              .add(Budget(_judul, _nominal, _jenis!));
                          _showToast(context);
                          clearText();
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Budget berhasil ditambahkan!'),
        action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }
}
