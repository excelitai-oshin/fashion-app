import 'package:fashion/View/View_More_model.dart';
import 'package:fashion/View/http_ViewMore.dart';
import 'package:flutter/material.dart';

class ViewMore_Screen extends StatefulWidget {
  const ViewMore_Screen({Key? key}) : super(key: key);

  @override
  _ViewMore_ScreenState createState() => _ViewMore_ScreenState();
}

class _ViewMore_ScreenState extends State<ViewMore_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSpecialOffer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE37D4E),
        title: Center(
          child: Text(
            "Fashion",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FutureBuilder(
            future: getSpecialOffer(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<SpecialOffers> get = snapshot.data ?? <SpecialOffers>[];
                return Container(
                  //  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10),
                    children: get
                        .map((SpecialOffers get) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: GridTile(
                                footer: GridTileBar(
                                  title: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amber,
                                      minimumSize: Size(90, 30),
                                    ),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    label: Text(
                                      'Add to Bag',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      child: get.productThambnail != null
                                          ? Image.network(
                                              'https://bppshops.com/${get.productThambnail}',
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                    ),
                                    Flexible(
                                      child: Text(
                                        '${get.productName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        '${get.unit}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            '৳ ${double.tryParse(get.sellingPrice!)!.toStringAsFixed(1)}  ',
                                        style: TextStyle(color: Colors.green),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '৳ ${double.tryParse(get.discountPrice!)!.toStringAsFixed(1)}',
                                            style: TextStyle(
                                                color: Colors.red,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                );
              } else {}
            }),
      ),
    );
  }
}
