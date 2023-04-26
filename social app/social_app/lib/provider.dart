import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class MyProvider extends ChangeNotifier{
  String alt_mail ="";
  String alt_firstname ="";
  String alt_major = "";
  String alt_lastname = "";
  String alt_residence = "";
  String alt_movie = "";
  String alt_food = "";
  String alt_DOB = "";
  String alt_yeargroup = "";
 


  String get email => alt_mail;
  String get firstname => alt_firstname;
  String get major => alt_major;
  String get lastname => alt_lastname;
  String get residence => alt_residence;
  String get movie => alt_movie;
  String get food => alt_food;
  String get birth => alt_DOB;
  String get year => alt_yeargroup;
 
   void setyear(String year){
    alt_yeargroup = year;
    notifyListeners();
 }

void setemail(String email){
    alt_mail= email;
    notifyListeners();
 }

 void setfirstname(String firstname){
    alt_firstname = firstname;
    notifyListeners();
 }

void setmajor(String major){
    alt_major = major;
    notifyListeners();
 }

void setlastname(String lastname){
    alt_lastname = lastname;
    notifyListeners();
 }

void setresidence(String residence){
    alt_residence = residence;
    notifyListeners();
 }

void setmovie(String movie){
    alt_movie = movie;
    notifyListeners();
 }

void setfood(String food){
    alt_food = food;
    notifyListeners();
 }

void setbirth(String birth){
    alt_DOB= birth;
    notifyListeners();
 }

 



}