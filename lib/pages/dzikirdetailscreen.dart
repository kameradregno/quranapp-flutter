import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/dzikirdetailmodel.dart';
import 'package:quran_app/viewmodel/dzikirdetailviewmodel.dart';

class DzikirDetailScreen extends StatelessWidget {
  static const routeName = 'dzikirdetailscreen';
  final String id_dzikir;
  const DzikirDetailScreen({super.key, required this.id_dzikir});

  @override
  Widget build(BuildContext context) {
    final DzikirDetailViewModel _viewModel = DzikirDetailViewModel();
    return Scaffold(
      body: FutureBuilder<DzikirDetailModel>(
        future: _viewModel.getListDetailDzikir(id_dzikir),
        builder: (context, AsyncSnapshot<DzikirDetailModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final List<DzikirDetail> dzikirList = snapshot.data!.dzikirDetail!;

            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                dzikirDetail: dzikirList.elementAt(index),
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 1,
              ),
              itemCount: dzikirList.length,
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
      {required BuildContext context, required DzikirDetail dzikirDetail}) {
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
                    dzikirDetail.title.toString(),
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
                      dzikirDetail.arabic.toString(),
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
                    dzikirDetail.latin.toString(),
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
                    dzikirDetail.translation.toString(),
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
                    "(${dzikirDetail.notes.toString()})",
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
                    dzikirDetail.fawaid.toString(),
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
                    dzikirDetail.source.toString(),
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
