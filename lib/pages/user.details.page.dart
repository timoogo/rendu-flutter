import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  TextEditingController _updatedUserNameController = TextEditingController();
  String? userName = "Utilisateur"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'utilisateur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bonjour ${userName ?? "userName"}',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _updatedUserNameController,
                decoration: InputDecoration(
                  labelText: 'Nouveau nom d\'utilisateur',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                enabled: false, // Rend le champ désactivé
                decoration: InputDecoration(
                  labelText: 'ID',
                  filled: true,
                  fillColor: Colors.grey[300], // Couleur de fond gris
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Mettre à jour userName avec la nouvelle valeur du champ
                      userName = _updatedUserNameController.text;
                    });
                  },
                  child: Text('Update'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logique pour enregistrer ici
                    // Vous pouvez ajouter la logique de sauvegarde ici
                  },
                  child: Text('Enregistrer'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
