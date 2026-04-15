import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserScreen());
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final String baseUrl = "http://localhost:8080/api/users";

  List users = [];

  // CREATE
  Future<void> addUser() async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text,
        "email": emailController.text,
      }),
    );
    fetchUsers();
  }

  // READ
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    setState(() {
      users = jsonDecode(response.body);
    });
  }

  // UPDATE
  Future<void> updateUser(int id) async {
    await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": nameController.text,
        "email": emailController.text,
      }),
    );
    fetchUsers();
  }

  // DELETE
  Future<void> deleteUser(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
    fetchUsers();
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter CRUD with Java")),

      body: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),

          Row(
            children: [
              ElevatedButton(onPressed: addUser, child: Text("Add")),
              ElevatedButton(
                  onPressed: () {
                    if (users.isNotEmpty) {
                      updateUser(users[0]['id']);
                    }
                  },
                  child: Text("Update First")),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteUser(users[index]['id']),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}