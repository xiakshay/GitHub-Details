import 'package:flutter/material.dart';
import 'package:github_details/screen/user_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _usernameController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => UserDetailsScreen(
              username: _usernameController.text,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GitHub Details")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
            top: MediaQuery.of(context).size.height * 0.2,
          ),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Image.asset('assets/images/github1.png'),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.grey),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the GitHub ID';
                    }
                    return null;
                  },
                  onFieldSubmitted: (ctx) {
                    submit();
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter Your GitHub Username",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff330033)),
                  child: FlatButton(
                      onPressed: () {
                        submit();
                      },
                      child: const Text(
                        'Go',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )))
            ]),
          ),
        ),
      ),
    );
  }
}
