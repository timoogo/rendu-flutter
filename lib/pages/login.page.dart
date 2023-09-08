import 'package:flutter/material.dart';
import 'package:rendu_tp/pages/user.details.page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's sign you in",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome back\nYou've been missed",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Remplacez par votre image
              Image.asset('lib/assets/image_login.png', width: double.infinity),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (value) => validateInput(value, "Username", "timogo"),

                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                          validator: (value) => validateInput(value, "Password", "password")
                          ,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity, // Cela rend le bouton aussi large que le conteneur parent
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 24),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Si les valeurs sont correctes, redirigez vers la page de détails
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserDetailsPage()),
                              );
                            }
                            // Si les valeurs ne sont pas correctes, les messages d'erreur seront affichés automatiquement
                          },
                          child: Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text("Find us on"),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  launch('https://github.com/timoogo');
                },
                child: Text(
                  "github.com/timoogo",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.deepPurple),
                    onPressed: () async {
                      const url = 'https://twitter.com/your_twitter_handle';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.deepPurple),
                    onPressed: () async {
                      const url = 'https://www.linkedin.com/in/your_linkedin_profile/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }

  String? validateInput(String? value, String fieldName, String validValue) {
    if (value == null || value.isEmpty) {
      return "Le champ $fieldName est obligatoire";
    }
    if (value != validValue) {
      return "$fieldName incorrect";
    }
    return null;
  }

}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(child: Text('Welcome to the next page!')),
    );
  }
}
