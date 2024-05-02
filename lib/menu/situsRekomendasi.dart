import 'package:flutter/material.dart';
import 'package:mobile_layout/dataEcommerce.dart';
import 'package:mobile_layout/menu/detail.dart';

class ListEcommerce extends StatelessWidget {
  const ListEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Situs Ecommerce'),
      ),
      body: GridView.builder(
        itemCount: ecommerceSites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final site = ecommerceSites[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              site: site,
                            )));
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        Image.network(
                          site.imageUrl[0],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      site.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
