import 'package:flutter/material.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/error_page.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/menu_page.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recursos"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildResourceButton("Trastornos", "assets/logo.png"),
          _buildResourceButton("¿Qué hacer en caso de...?", "assets/logo.png"),
          _buildResourceButton("Actividades", "assets/logo.png"),
          _buildResourceButton("Diagnósticos Rápidos", "assets/logo.png"),
        ],
      ),
    );
  }

  Widget _buildResourceButton(String title, String imagePath) {
    return InkWell(
      onTap: () {
        // Acción al seleccionar un recurso
      },
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResourcesPage(),
  ));
}
