import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchMapPage extends StatefulWidget {
  const BranchMapPage({Key? key}) : super(key: key);

  @override
  State<BranchMapPage> createState() => _BranchMapPageState();
}

class _BranchMapPageState extends State<BranchMapPage> {

  // 1. Posición de la sucursal 1
  static const LatLng _branchPosition = LatLng(18.9261, -99.2216);

  // 2. Posición de la sucursal 2 (cerca de la 1)
  static const LatLng _branchPosition2 = LatLng(18.9273, -99.2202);

  // 3. Cámara inicial centrada en la sucursal 1
  static const CameraPosition _initialCamera = CameraPosition(
    target: _branchPosition,
    zoom: 16,
  );

  // 4. Set de marcadores
  final Set<Marker> _markers = {};

  // 5. Agregar marcadores en initState
  @override
  void initState() {
    super.initState();

    // Marcador Sucursal 1
    _markers.add(
      const Marker(
        markerId: MarkerId('branch1'),
        position: _branchPosition,
        infoWindow: InfoWindow(title: 'Sucursal Principal'),
      ),
    );

    // Marcador Sucursal 2
    _markers.add(
      const Marker(
        markerId: MarkerId('branch2'),
        position: _branchPosition2,
        infoWindow: InfoWindow(title: 'Sucursal 2'),
      ),
    );
  }

  // 6. Construcción de la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de sucursal'),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCamera,
        markers: _markers,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
      ),
    );
  }
}
