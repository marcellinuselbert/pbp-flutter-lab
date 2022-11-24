import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/util/fetch_watchlist.dart';
import 'package:counter_7/page/mywatchlist/mywatchlist_detail.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  Future fut = fetchWatchList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: buildDrawer(context),
        // TODO: buat future builder else keluar datanya
        body: FutureBuilder(
            future: fut,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.10),
                                blurRadius: 20.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: const Offset(
                                  1.0, // Move to right 10  horizontally
                                  1.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // if you need this
                                  side: BorderSide(
                                    color: snapshot.data![index].watched
                                        ? Colors.green
                                        : Colors.red,
                                    width: 2,
                                  )),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 8),
                                  child: ListTile(
                                    title: Text(
                                      "${snapshot.data![index].title}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Checkbox(
                                      value: snapshot.data![index].watched,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          snapshot.data![index].watched =
                                              !snapshot.data![index].watched;
                                        });
                                      },
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyWatchListDetail(
                                                    myWatchList:
                                                        snapshot.data![index])),
                                      );
                                    },
                                  )))));
                }
              }
            }));
  }
}
