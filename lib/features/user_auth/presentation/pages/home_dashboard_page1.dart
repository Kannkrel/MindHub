import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:indel_flutter/features/user_auth/presentation/pages/search_page.dart';

class HomeDash1 extends StatelessWidget {
  const HomeDash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(), // Muestra un indicador de carga mientras se obtiene el dato del usuario
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("MindHub"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "¡Bienvenido/a " + (snapshot.data ?? '') + "!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "¿Qué haremos hoy?",
                          // snapshot.data ?? '', // Muestra el nombre del usuario
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Acción para navegar a la página de notificaciones
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFeatureContainer(
                      context: context,
                      color: Color.fromRGBO(7, 185, 159, 1),
                      icon: Icons.calendar_month,
                      title: "Próxima sesion",
                    ),
                    _buildFeatureContainer(
                      context: context,
                      color: Color.fromRGBO(7, 185, 159, 1),
                      icon: Icons.edit_calendar,
                      title: "Agendar cita",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      _buildGridItem(
                        context: context,
                        color: Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.route,
                        title: "Mis actividades",
                        onTap: (){

                        }
                      ),
                      _buildGridItem(
                        context: context,
                        color: Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.search,
                        title: "Buscar Asociados",
                        onTap: (){
                          print('onTap ejecutado para Buscar Asociados');
                          try {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SearchPage()), (route) => false);
                          } catch (e) {
                            print('Error al navegar a SearchPage: $e');
                          }
                        }
                      ),
                      _buildGridItem(
                        context: context,
                        color: Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.info,
                        title: "Acerca de",
                          onTap: (){

                          }
                      ),
                      _buildGridItem(
                        context: context,
                        color: Color.fromRGBO(7, 185, 159, 1),
                        icon: Icons.exposure_zero,
                        title: "---",
                          onTap: (){

                          }
                      ),
                    ],
                  ),
                ),
               // SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> _getUserData() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final String uid = user?.uid ?? '';

    final DocumentSnapshot<Map<String, dynamic>> userData =
    await FirebaseFirestore.instance.collection('Users').doc(uid).get();

    if (userData.exists && userData.data()!.containsKey('nombre')) {
      return userData['nombre'] ?? '';
    } else {
      return '';
    }
  }

  Widget _buildFeatureContainer({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            // Logica de botón
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required VoidCallback onTap,

  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // Logica de botón
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeDash1(),
  ));
}
