import 'package:flutter/material.dart';
import 'package:latihan_strukturdata_diflutter/widget/button.dart';
import 'package:latihan_strukturdata_diflutter/widget/textField.dart';
import '../logic/datamhs.dart';
import '../model/mhs_model.dart';


class HighArrayExample extends StatefulWidget {
  const HighArrayExample({super.key});

  @override
  State<HighArrayExample> createState() => _HighArrayExampleState();
}

class _HighArrayExampleState extends State<HighArrayExample> {
  // int maxSize = 0;
  // late HighArray Newarr;
  //List<Mahasiswa> readData = [];

  MhsManager dataMhs = MhsManager();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _nim = TextEditingController();
  final TextEditingController _asal = TextEditingController();


  @override
  void initState() {
    //Newarr = HighArray(max: maxSize);
    // _getDataFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.symmetric( vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                  ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  buildTextField(
                    obscureText: false,
                    inputText: _name,
                    hintText: "Nama Mahasiswa",
                  ),
                  buildTextField(
                      obscureText: false,
                    inputText: _nim,
                    hintText: "Nim"
                  ),
                  buildTextField(
                      obscureText: false,
                    inputText: _asal,
                    hintText: "Alamat Mahasiswa"
                  ),
                  buildButton(text: "Absen", bgColor:Colors.blue, bgColorText: Colors.white, onPressed: () async{
                    // Newarr.insert(_name.text, _nim.text, _asal.text);
                    await dataMhs.insertMahasiswa(
                        _name.text, _nim.text, _asal.text);
                    // List<Mahasiswa> updateData = await dataMhs.fetchMahasiswa();
                    setState(() {});
                    _name.clear();
                    _nim.clear();
                    _asal.clear();
                  }
                  ),
                ],
              ),
            ),
            Flexible(
              child: FutureBuilder<List<Mahasiswa>>(
                future: dataMhs.fetchMahasiswa(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<Mahasiswa> mhsList = snapshot.data!;
                    return ListView.builder(
                      itemCount: mhsList.length,
                      itemBuilder: (context, index) {
                        var eachData = mhsList[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.purple[50],
                          child: ListTile(
                            leading: Text("${index + 1}"),
                            title: Text("Name : ${eachData.name}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("NIM : ${eachData.nim}"),
                                Text("Asal : ${eachData.asal}")
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      dataMhs.deleteMahasiswa(eachData.id);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController
                                            _editNameController =
                                            TextEditingController(
                                                text: eachData.name);
                                        TextEditingController
                                            _editNimController =
                                            TextEditingController(
                                                text: eachData.nim);
                                        TextEditingController
                                            _editAsalController =
                                            TextEditingController(
                                                text: eachData.asal);
                                        return AlertDialog(
                                          title: Center(child: Text("Edit Data")),
                                          content: Container(
                                            height: 200,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                               buildTextField(
                                                 inputText: _editNameController,
                                                 obscureText: false,
                                                 hintText: "Edit Nama Mahasiswa"
                                               ),
                                                buildTextField(
                                                  inputText: _editNimController,
                                                  obscureText: false,
                                                  hintText: "Edit NIM Mahasiswa"
                                                ),
                                                buildTextField(
                                                  inputText: _editAsalController,
                                                  obscureText: false,
                                                  hintText: " Edit Asal Mahasiswa"
                                                ),

                                              ],
                                            ),
                                          ),
                                          actions: [
                                            buildButton(text: "Simpan", bgColor: Color(0xFF5399F5), bgColorText: Colors.white, onPressed: ()async{
                                              dataMhs.updateMahasiswa(eachData.id, _editNameController.text, _editNimController.text, _editAsalController.text);
                                              setState(() {

                                              });
                                              Navigator.of(context).pop();
                                            }),

                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No Data'));
                  }
                },
              ),
            )
            //Expanded(child: displayData(Newarr.arr)),
          ],
        ));
  }
}
