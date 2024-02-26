import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doamodel.dart';
import 'package:quran_app/pages/doadetailscreen.dart';
import 'package:quran_app/viewmodel/doaviewmodel.dart';

class DoaTab extends StatelessWidget {
  const DoaTab({super.key});

  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewModel = DoaViewModel();
    return FutureBuilder<List<Doa>>(
        future: _viewModel.getListDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                  context: context, doa: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }

  Widget _itemList({required BuildContext context, required Doa doa}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DoaDetailScreen.routeName, arguments: doa.nomor.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svg/nomor_surah.svg'),
                SizedBox(
                  height: 44,
                  width: 45,
                  child: Center(
                    child: Text(
                      doa.nomor.toString(),
                      style: GoogleFonts.brygada1918(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doa.name.toString(),
                      style: GoogleFonts.brygada1918(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20)),
                ],
              ),
            ),
          ]),
        ),
      );
}
