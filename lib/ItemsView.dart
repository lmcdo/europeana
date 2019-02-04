
import 'package:flutter/material.dart';
import 'package:tester/item.dart';


class ItemView extends StatefulWidget {
  ItemView(this.item);
  final Item item;

  @override
  ItemViewState createState() => ItemViewState();
}

class ItemViewState extends State<ItemView> {
  Item itemState;

  @override
  void initState() {
    super.initState();
    itemState = widget.item;
   /*  ItemDatabase db = ItemDatabase();
    db.getItem(ItemState.id).then((Item) {
      setState(() => ItemState.favored = Item.favored);
    }); */
  }

  /* void onPressed() {
    ItemDatabase db = ItemDatabase();
    setState(() => ItemState.favored = !ItemState.favored);
    ItemState.favored == true
        ? db.addItem(ItemState)
        : db.deleteItem(ItemState.id);
  } */

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
       // initiallyExpanded: itemState.isExpanded ?? false,
       // onExpansionChanged: (b) => itemState.isExpanded = b,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                //text: itemState.overview,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
        ],
       /*  leading: IconButton(
         icon: itemState.favored ? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.white,
          onPressed: () {
           //onPressed();
          },
        ), */
        title: Container(
            height: 200.0,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                //itemState.preview != null
                    /* ? Hero(
                        child: Image.network(
                            "https://image.tmdb.org/t/p/w92${ItemState.posterPath}"),
                        tag: itemState.id,
                      ) */
                    Container(),
                Expanded(
                    child: Text(
                  itemState.title[0],
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ))
              ],
            )));
  }
}
