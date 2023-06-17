import 'package:demo/data/response/status.dart';
import 'package:demo/utils/routes/routes_name.dart';
import 'package:demo/utils/utils.dart';
import 'package:demo/view/Search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:demo/view_model/home_view_model.dart';
import 'package:demo/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPrefernece.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Icon(Icons.logout_sharp))),
          SizedBox(
            width: 20,
          ),
          InkWell(
              onTap: () {
                showSearch(context: context, delegate: SearchUser());
              },
              child: Center(child: Icon(Icons.search))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
          switch (value.moviesList.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.moviesList.message.toString()));
            case Status.COMPLETED:
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.moviesList.data!.movies!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 2.h, left: 5.w, right: 5.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 3.w),
                                  color: Colors.amber,
                                  height: 20.h,
                                  width: 30.w,
                                  child: Image.network(
                                    value.moviesList.data!.movies![index]
                                        .posterurl
                                        .toString(),
                                    errorBuilder: (context, error, stack) {
                                      return Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      );
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 55.w,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.moviesList.data!.movies![index]
                                            .title
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        value.moviesList.data!.movies![index]
                                            .releaseDate
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        value.moviesList.data!.movies![index]
                                            .storyline
                                            .toString(),
                                        style: TextStyle(fontSize: 15.sp),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 6,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
          }
          return Container();
        }),
      ),
    );
  }
}
