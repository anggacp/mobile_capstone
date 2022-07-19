import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasmahero/API/service.dart';
import 'package:plasmahero/models/pendonor_model.dart';

import 'detail_pendonor.dart';

class DisplayPendonor extends StatefulWidget {
  const DisplayPendonor({Key? key}) : super(key: key);

  @override
  State<DisplayPendonor> createState() => _DisplayPendonorState();
}

class _DisplayPendonorState extends State<DisplayPendonor> {
  List<PendonorModel> listPendonor = [];
  ApiDonorPlasma apiDonorPlasma = ApiDonorPlasma();

  getPendonorData() async {
    listPendonor = await apiDonorPlasma.getPendonorData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPendonorData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    PendonorModel pendonorModel = listPendonor[index];
                    return ListTile(
                      title: Text(listPendonor[index].namaPendonor ?? ''),
                      subtitle: Text(listPendonor[index].emailPendonor ?? ''),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPendonor(
                                    id: listPendonor[index].id,
                                    namaPendonor:
                                        listPendonor[index].namaPendonor,
                                    emailPendonor:
                                        listPendonor[index].emailPendonor,
                                    alamatPendonor:
                                        listPendonor[index].alamatPendonor,
                                    kotaPendonor:
                                        listPendonor[index].kotaPendonor,
                                    usiaPendonor:
                                        listPendonor[index].usiaPendonor,
                                    jenisKelaminPendonor: listPendonor[index]
                                        .jenisKelaminPendonor,
                                    beratBadanPendonor:
                                        listPendonor[index].beratBadanPendonor,
                                    golonganDarahPendonor: listPendonor[index]
                                        .golonganDarahPendonor,
                                    rhesusDarahPendonor:
                                        listPendonor[index].rhesusDarahPendonor,
                                    tanggalNegatifPendonor: listPendonor[index]
                                        .tanggalNegatifPendonor,
                                    mendapatkanTransfusiPendonor:
                                        listPendonor[index]
                                            .mendapatkanTransfusiPendonor,
                                    sudahDivaksinPendonor: listPendonor[index]
                                        .sudahDivaksinPendonor,
                                    namaVaksinPendonor:
                                        listPendonor[index].namaVaksinPendonor,
                                    dosisVaksinPendonor:
                                        listPendonor[index].dosisVaksinPendonor,
                                    penyakitBeratPendonor: listPendonor[index]
                                        .penyakitBeratPendonor)));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: listPendonor.length)),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              listPendonor.clear();
              getPendonorData();
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
