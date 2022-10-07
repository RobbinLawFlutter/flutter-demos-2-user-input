//import 'package:flutter/material.dart';

// ignore_for_file: prefer_initializing_formals

//This class demonstrates the use of different
//constructors as well as preferred ways of
//passing args into the class via the constructors.
class Question {
  late String qText;
  late bool qAnswer;

//In this default greedy constructor it will work because
//the names in the parameter list (q and a) are different
//then the class field names qText and qAnswer
  Question(String q, bool a) {
    qText = q;
    qAnswer = a;
  }

//In this named gready constructor we should use the
//key word "this" as both the parameter
//and field names are the same.
  Question.usingThis(String qText, bool qAnswer) {
    this.qText = qText;
    this.qAnswer = qAnswer;
  }

//In this constructor we use a short cut
//to place whatever args are passed, directly
//into the fields. The parameter name has
//to be the same as the field name and using this keyword.
//Notice also no {} just ; at end of (parms).

  Question.positionalParameters(this.qText, this.qAnswer);

//NOTICE: in all of these previous contructors
//we are using positional parameters.

//We could also use named parameters.
//This is the preferred way if lots of parms.
//Also notice required decorator means that these args have to
//be included in the constructor.

  Question.namedParamters({required this.qText, required this.qAnswer});
}
