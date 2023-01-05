import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/sub_pages/direcciones_content.dart';
import 'package:qr_reader/pages/sub_pages/mapas_content.dart';
import 'package:qr_reader/provider/page_state_provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/widgets/widget_navigation_bar.dart';
import 'package:qr_reader/widgets/widget_scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  static const routeName = "home_page"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomBottomNavitagion(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text('Historial'),
      actions: [
        IconButton(
          onPressed: () {
            final provider = Provider.of<ScanListProvider>(context, listen: false);
            provider.borrarTodos();
            
          },
          icon: const Icon(Icons.delete_forever),
        )
      ],
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<PageStateProvider>(context).selectedMenuOp;

    final ScanListProvider provider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        provider.cargarScansPorTipo('geo');
        return const MapasContent();
      case 1:
        provider.cargarScansPorTipo('http');
        return const DireccionesContent();
    }
    return Container();
  }
}