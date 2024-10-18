import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_tintin/providers/reading_list_provider.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';

void main() async{
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReadingListProvider(),
      child: const MyApp(),
    ),
  );
}


