import 'package:covid/api/http_service.dart';
import 'package:flutter/material.dart';
import 'package:covid/api/post_model.dart';

class TableIndonesia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataIndo _getIndo = new DataIndo();
    return Scaffold(
      body: FutureBuilder(
            future: _getIndo.getDataIndo(),
            builder: (BuildContext context, AsyncSnapshot<List<CovidProvinsi>> snapshot) {
              if (snapshot.hasData) {
                List<CovidProvinsi> dataIndo = snapshot.data;
                return SingleChildScrollView(
                  child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Provinsi')
                    ),
                    DataColumn(
                      label: Text('Positif')
                    ),
                    DataColumn(
                      label: Text('Sembuh')
                    ),
                    DataColumn(
                      label: Text('Meninggal')
                    ),
                  ], rows:  dataIndo
                      .map(
                        (CovidProvinsi dataIndo) => DataRow(cells:[
                          DataCell(Text(dataIndo.provinsi)),
                          DataCell(Text(dataIndo.kasus_posi.toString())),
                          DataCell(Text(dataIndo.kasus_sem.toString())),
                          DataCell(Text(dataIndo.kasus_meni.toString())),
                        ])).toList(),
                  ),
                );
                
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
  }
}