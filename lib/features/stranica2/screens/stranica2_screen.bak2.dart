import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/back_strelica_widget.dart';
import '../widgets/lupa_dugme_widget.dart';
import '../widgets/transpozicija_dugmad_widget.dart';
import '../widgets/lokot_dugme_widget.dart';
import '../widgets/inout_dugme_widget.dart';
import '../widgets/zoom_lupe_widget.dart';
import '../widgets/spajalica_dugme_widget.dart';
import '../widgets/edit_dugme_widget.dart';
import '../widgets/opcije_dugme_widget.dart';
import '../widgets/tekst_prikaz_widget.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/search_controller.dart' as moj_search;

class Stranica2Screen extends StatelessWidget {
  final String imeFajla;

  const Stranica2Screen({super.key, required this.imeFajla});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackStrelicaWidget(
              onPressed: () => NavigationController.vratiNazad(context),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TranspozicijaDugmadWidget(onPlus: () {}, onMinus: () {}),
                  const SizedBox(width: 8),
                  LokotDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  InOutDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  ZoomLupeWidget(onZoomIn: () {}, onZoomOut: () {}),
                  const SizedBox(width: 8),
                  SpajalicaDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  EditDugmeWidget(onPressed: () {}),
                  const SizedBox(width: 8),
                  OpcijeDugmeWidget(onPressed: () {}),
                ],
              ),
            ),
            LupaDugmeWidget(
              onPressed: () => moj_search.SearchController.otvoriPretragu(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TekstPrikazWidget(imeFajla: imeFajla),
        ],
      ),
    );
  }
}
