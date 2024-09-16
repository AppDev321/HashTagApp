import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';


class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(child: Text('Home Page', style: TextStyle(fontSize: 24)));
    }
}

class SearchPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(child: Text('Search Page', style: TextStyle(fontSize: 24)));
    }
}

class ProfilePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(child: Text('Profile Page', style: TextStyle(fontSize: 24)));
    }
}