import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:convert/convert.dart';
import '../models/category_api.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {


  Future<CategoryModel> getCategoryApi() async {
    final response = await http.get(
      Uri.parse('https://ultimateapi.hostprohub.com/api/get-categories'),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return CategoryModel.fromJson(data);
    } else {
      return CategoryModel.fromJson(data);
    }
  }

  @override
  void initState() {
    getCategoryApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5),
        height: 220,
        child: FutureBuilder<CategoryModel>(
          future: getCategoryApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: snapshot.data!.categories[0].categories.length,
                itemBuilder: (context, i) => CategoryItem(snapshot.data!.categories[0].categories[i].id ,snapshot.data!.categories[0].categories[i].categoryName),
              );
            } else {
              return Text("loading");
            }
          },
        ),
      ),
    );
  }
}
