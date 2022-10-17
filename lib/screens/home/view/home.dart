import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynergy/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>().fetchDatas();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.movieData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: value.movieData?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.94,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:130.w,
                                  maxHeight:
                                      130.h,
                                ),
                                child: Image.network(
                                    value.movieData![index].poster,
                                    fit: BoxFit.fill),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 30.h,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.56,
                                      child: Text(
                                        value.movieData![index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.56,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 0, 0),
                                        child: Text(
                                            "genere :  ${value.movieData?[index].genre ?? ""}"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.56,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 0, 0),
                                        child: Text(
                                            "language :  ${value.movieData?[index].language ?? ""}"
                                              ..split('.')),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.56,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 0, 0),
                                        child: Text(
                                            "Stars :  ${value.movieData?[index].stars.join().toString() ?? ""}"),
                                      ),
                                    ),
                                    value.movieData?[index].description
                                                .isEmpty !=
                                            true
                                        ? SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.56,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 10, 0, 0),
                                                child: Text(
                                                    "description : ${value.movieData?[index].description.toString() ?? ""}")),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                                
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              Row(
                                children: [
                                 const Icon(Icons.arrow_drop_up_outlined,size: 60),
                                Text(value.movieData?[index].totalVoted.toString() ?? "0"),
                                  const Icon(Icons.arrow_drop_down_outlined,size: 60,)
                              ],),
                                Text(value.movieData?[index].director
                                        .join()
                                        .isNotEmpty ==
                                    true
                                ? "Director :${value.movieData?[index].director.join().toString()}"
                                : ""),
                            ]
                          
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
