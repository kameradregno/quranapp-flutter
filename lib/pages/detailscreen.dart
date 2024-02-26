import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/ayahmodel.dart';
import 'package:quran_app/viewmodel/ayahviewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detailscreen';
  final String? id_surah;
  final String? nama_surah;
  const DetailScreen({super.key, required this.id_surah, required this.nama_surah});

  @override
  Widget build(BuildContext context) {
    final AyahViewModel _viewModel = AyahViewModel();
    return Scaffold(
      body: FutureBuilder<AyahModel>(
        future: _viewModel.getListAyah(id_surah!),
        builder: (context, AsyncSnapshot<AyahModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final List<Ayat> ayatList = snapshot.data!.ayat!;

            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                ayat: ayatList[index],
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: ayatList.length,
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  Widget _itemList({required BuildContext context, required Ayat ayat}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                SvgPicture.asset('assets/svg/nomor_surah.svg'),
                SizedBox(
                  height: 44,
                  width: 45,
                  child: Center(
                    child: Text(
                      ayat.nomor.toString(),
                      style: GoogleFonts.brygada1918(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      ayat.ar.toString(),
                      textAlign: TextAlign.end,
                      style: GoogleFonts.brygada1918(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Text(
                  ayat.tr.toString(),
                  style: GoogleFonts.brygada1918(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  ayat.idn.toString(),
                  style: GoogleFonts.brygada1918(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
