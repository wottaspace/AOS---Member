import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class CreateDisputeController extends OkitoController {
  CreateDisputeController._internal();
  static final CreateDisputeController _singleton = CreateDisputeController._internal();

  factory CreateDisputeController() {
    return _singleton;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void createDispute() {

  }
}