import 'dart:convert';

import 'package:apis_project/Modals/ProductsModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  Future<ProductsModal> getProducts()async{

    final response = await http.get(Uri.parse('https://webhook.site/54ca81e8-1f5b-43d7-949b-7ddbc4c5e996'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ProductsModal.fromJson(data);
    }else{
      return ProductsModal.fromJson(data);
    }
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIMPLE API CALL"),
      ),
      body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context,index){
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                              ),
                              title: Text(snapshot.data!.data![index].shop!.description.toString()),
                              subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * 1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data![index].images!.length,
                                  itemBuilder: (context, position){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *.5,
                                    height: MediaQuery.of(context).size.height *.25,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
                                      )
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
              });
            }else{

              return const CircularProgressIndicator();

            }

      }),
    );
  }
}
