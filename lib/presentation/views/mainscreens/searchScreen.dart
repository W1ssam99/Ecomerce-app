import 'package:clothes_store/config/componets/Lists.dart';
import 'package:clothes_store/config/componets/fonts.dart';
import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../models/productmodel.dart';
import '../../wedgets/mainScreenWedgit/searchScreenWedget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    List<Products> searchResults = [];
    String currentQuery = '';
    var _Localaization= S.of(context);


    void search(String query) {
      setState(() {
        currentQuery = query;
        searchResults = products
            .where((product) =>
            product.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }

    void clearSearch() {
      setState(() {
        currentQuery = '';
        searchResults = [];
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
         _Localaization.Search,
          style: TextStyle(
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextFilledForSearch(
              onSearchSubmitted: search,
              onChange: (query) {
              },
            ),
          ),
          if (currentQuery.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Search results for: $currentQuery'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return ListTile(
                  title: Text(product.name ?? 'default value'),
                  subtitle: Text(product.price ?? 'default value'),
                  // Add more details here...
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
