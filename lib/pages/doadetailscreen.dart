import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doadetailmodel.dart';
import 'package:quran_app/viewmodel/doadetailviewmodel.dart';

class DoaDetailScreen extends StatelessWidget {
  static const routeName = 'doadetailscreen';
  final String id_doa;
  const DoaDetailScreen({super.key, required this.id_doa});

  @override
  Widget build(BuildContext context) {
    final DoaDetailViewModel _viewModel = DoaDetailViewModel();
    return Scaffold(
      body: FutureBuilder<DoaDetailModel>(
        future: _viewModel.getListDetailDoa(id_doa),
        builder: (context, AsyncSnapshot<DoaDetailModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final List<DoaDetail> doaList = snapshot.data!.doaDetail!;

            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                doaDetail: doaList.elementAt(index),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 1,
              ),
              itemCount: doaList.length,
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

  Widget _itemList(
      {required BuildContext context, required DoaDetail doaDetail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    doaDetail.title.toString(),
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      doaDetail.arabic.toString(),
                      textAlign: TextAlign.end,
                      style: GoogleFonts.amiriQuran(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    doaDetail.latin.toString(),
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    doaDetail.translation.toString(),
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "(${doaDetail.notes.toString()})",
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    doaDetail.fawaid.toString(),
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    doaDetail.source.toString(),
                    style: GoogleFonts.brygada1918(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16,
                    ),
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
