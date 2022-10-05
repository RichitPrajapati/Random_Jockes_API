import 'package:random_joke_api/Ramdom_API_Data.dart';
import 'package:random_joke_api/Jockes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                actionsIconTheme: IconThemeData(),
                title: Text("Random Jockes"),
                centerTitle: true,
                actions: [Icon(Icons.recycling_rounded),],
            ),
            body: FutureBuilder(
                future: JokesAPIHelpers.jokesAPIHelpers.fetchJokesdata(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                        return Center(
                            child: Text("ERROR: ${snapshot.error}"),
                        );
                    } else if (snapshot.hasData) {
                        Jokes? data = snapshot.data;
                        return Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    SizedBox(height: 180),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                            "ID : ${data!.id}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                            "Created_At : ${data!.created_at}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                     SizedBox(height: 10),
                                    Container(
                                        alignment:Alignment.center,
                                        height: 30,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Text(
                                            "updated_at: ${data!.updated_at}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        alignment:Alignment.center,
                                        height: 60,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                            "Jokes : ${data!.value}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        );
                    }
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                },
            ),
        );
    }
}
