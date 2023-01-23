import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class GithubLoginScreen extends StatefulWidget {
  @override
  State<GithubLoginScreen> createState() => _GithubLoginScreenState();
}

class _GithubLoginScreenState extends State<GithubLoginScreen> {
  late SharedPreferences prefs;
  String username = "";

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    login();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();
  }

  void login() async {
    final token = prefs.getString("accessToken");
    print("Token: $token");
    if (token != null) {
      final resp = await http.get(Uri.parse("http://localhost:8000/users/me/"),
          headers: {"token": token});
      username = jsonDecode(resp.body)["name"];
      setState(() {});
    } else {
      auth();
    }
  }

  void auth() async {
    const url =
        "https://github.com/login/oauth/authorize?client_id=dfde56473a439af8a74b&scope=repo,read:user";
    const callbackUrlScheme = "tillog";

    final result = await FlutterWebAuth.authenticate(
        url: url, callbackUrlScheme: callbackUrlScheme);
    final queries = Uri.parse(result).queryParameters;
    final code = queries["code"];

    final resp = await http.post(
      Uri(scheme: "http", host: "localhost", port: 8000, path: "/oauth/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"code": code}),
    );

    final r = jsonDecode(resp.body);
    final token = r["token"];
    print("Get Token");
    print(token);
    prefs.setString("accessToken", token);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        "/oauth": (context) => const HomeScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "TIL.log",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            IconButton(onPressed: login, icon: const Icon(Icons.ac_unit)),
            Container(
              child: MarkdownBody(
                styleSheet: MarkdownStyleSheet(
                  h1: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 40),
                  h2: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 30),
                  h3: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                data: "# $username \n ## H2 \n ### H3 \n",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
