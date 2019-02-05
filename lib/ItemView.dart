
import 'package:flutter/material.dart';
import 'package:tester/item.dart';


class ItemView extends StatefulWidget {
  ItemView(this.item
  );
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
                text: itemState.description!=null?itemState.description[0]:("no description supplied"),
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
                 itemState.preview != null
                     ? Hero(
                         child: Image.network(
                             itemState.preview[0]),
                   tag: Text ('22222'),
                     )  
                : Container(), 
                Expanded(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              itemState.title[0],
                              maxLines: 10,
                            ),
                          ),
                        ),
                    ],
                ))
              ],
            )));
  }
}
