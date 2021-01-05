
import 'package:flutter/material.dart';


class DataSearch extends SearchDelegate<String>
{
  final recentFood=[

  ];
  final food=[
    'pizza',
    'crispy',
    'broasted chicken',
    'shawarma',
    'hot dog',
    'chicken kebab',
    'meat kebab',

  ];
  @override
  List<Widget> buildActions(BuildContext context) {
      //Action for app bar 
      return[
        IconButton(icon: Icon(Icons.clear),onPressed: (){
          query="";
        },)
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // leading icon on the left of app bar 
      return
      IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,

          progress: transitionAnimation,
          ),
          onPressed: (){
            close(context, null);
          },
          );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {

    final suggestionsList=query.isEmpty?recentFood
    :food.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        //onTap to do something 
        leading: Icon(Icons.food_bank),
        title: RichText(
          text: TextSpan(
            text: suggestionsList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: suggestionsList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ],
          ),
        ),

      ),
      itemCount: suggestionsList.length,
    );
  }
  
}