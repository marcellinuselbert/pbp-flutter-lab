import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/budget.dart';

class ShowBudget extends StatefulWidget {
  const ShowBudget({super.key});

  @override
  State<ShowBudget> createState() => _ShowBudgetState();
}

class _ShowBudgetState extends State<ShowBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                    children: ListBudget.data.isNotEmpty
                        ? ListBudget.data
                            .map((budget) => Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.15),
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
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SizedBox(
                                      height: 100,
                                      child: Container(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      budget.judul,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      "${budget.date.day}/${budget.date.month}/${budget.date.year}",
                                                      style: TextStyle(
                                                          color: budget.jenis ==
                                                                  "Pengeluaran"
                                                              ? Colors.red
                                                              : Colors.green),
                                                    ),
                                                  ]),
                                              const Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(budget.nominal
                                                      .toString()),
                                                  Text(budget.jenis)
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Center(
                                // ignore: prefer_const_literals_to_create_immutables
                                child: Column(children: [
                              const Text(
                                "Belum ada data budget yang ditambahkan",
                                style: TextStyle(fontSize: 16),
                              )
                            ]))
                          ]))));
  }
}
