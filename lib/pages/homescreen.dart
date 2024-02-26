// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/components/tabitem.dart';
import 'package:quran_app/model/surahmodel.dart';
import 'package:quran_app/pages/detailscreen.dart';
import 'package:quran_app/pages/tabs/doatab.dart';
import 'package:quran_app/pages/tabs/dzikirtab.dart';
import 'package:quran_app/pages/tabs/surahtab.dart';
import 'package:quran_app/themes.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "homescreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = '';
  final List<Surah> _suggestions = [];

  Future<List<Surah>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/list-surah.json');

    List<dynamic> jsonList = json.decode(jsonString);

    _suggestions.clear();
    _suggestions.addAll(jsonList.map((json) => Surah.fromJson(json)));

    return _suggestions.where((element) {
      return element.nama_latin
          .toLowerCase()
          .contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  EasySearchBar _appbar() => EasySearchBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'QuranApp',
            style: GoogleFonts.brygada1918(
                fontSize: 18, fontWeight: FontWeight.w600, color: primary),
          ),
        ),
        onSearch: (value) => setState(() => searchValue = value),
        asyncSuggestions: (value) async {
          List<Surah> sugesti = await _fetchSuggestions(value);
          return sugesti.map((surah) => surah.nama_latin).toList();
        },
        onSuggestionTap: (value) async {
          Surah chosenSurah = (await _fetchSuggestions(value))
              .firstWhere((surah) => surah.nama_latin == value);
          Navigator.pushNamed(
            context,
            DetailScreen.routeName,
            arguments: {
              'id_surah': chosenSurah.nomor.toString(),
              'nama_surah': chosenSurah.nama_latin.toString(),
            },
          );
        },
      );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _bottomNavigationBarItem(
              icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
          _bottomNavigationBarItem(
              icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
          _bottomNavigationBarItem(
              icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
        ],
      );

  BottomNavigationBarItem _bottomNavigationBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(icon, color: secondary),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
        ),
        label: label,
      );

  DefaultTabController _body() => DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: _salam(),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              shape: Border(
                  bottom: BorderSide(
                width: 3,
                color: Colors.grey.withOpacity(0.1),
              )),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: TabBar(
                  labelColor: primary,
                  indicatorColor: primary,
                  indicatorWeight: 3,
                  tabs: [
                    itemTab(label: "Surah"),
                    itemTab(label: "Dzikir"),
                    itemTab(label: "Doa"),
                  ],
                ),
              ),
            )
          ],
          body: const TabBarView(
            children: [SurahTab(), DzikirTab(), DoaTab()],
          ),
        ),
      ));

  Column _salam() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: GoogleFonts.brygada1918(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: secondary,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Regno",
            style: GoogleFonts.brygada1918(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Stack(children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromARGB(255, 159, 255, 242),
                      Color.fromARGB(255, 48, 186, 168),
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mau Baca Surat\nApa",
                    style: GoogleFonts.brygada1918(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hari Ini?",
                    style: GoogleFonts.brygada1918(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ],
      );
}
