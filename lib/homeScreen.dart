import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_application/api/api.dart';
import 'package:movie_application/constant.dart';
import 'package:movie_application/details.dart';
import 'package:movie_application/models/movie.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Future<List<Movie>> tredningMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;
  @override
  void initState(){
    super.initState();
    tredningMovies=Api().getPopularMovies();
    upcomingMovies=Api().getUpcomingMovies();
    topRatedMovies=Api().getTopRatedMovies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Movie Application"),
        elevation: 20,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("Recommended", style: TextStyle(fontSize: 20)),),
            const SizedBox(height: 20),
            SizedBox(
              child: FutureBuilder(
                future: tredningMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    final data= snapshot.data;
                    return Recommended_widget(snapshot: snapshot);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 30,),
            Center(child:  const Text("Explore",
              style: TextStyle(fontSize: 40),
            ),
            ),
            SizedBox(height:20),
            SizedBox(
              child: FutureBuilder(
                future: tredningMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    final data= snapshot.data;
                    return Explore_widget(snapshot: snapshot,);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(height: 30,),
            Center(child:  const Text("Newly Released",
              style: TextStyle(fontSize: 40),
            ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              child: FutureBuilder(
                future: tredningMovies,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    final data= snapshot.data;
                    return Newly_Released_widget(snapshot: snapshot);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Newly_Released_widget extends StatelessWidget {
  const Newly_Released_widget({
    super.key, required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, width: double.infinity,
      child: ListView.builder(
          itemCount: snapshot.data!.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> detailsScreen(movie: snapshot.data[index], snapshot: snapshot,)));},
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 300,
                      width:200,
                      child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          '${Constant.imagePath}${snapshot.data![index].posterPath}'),
                    )
                ),
              ),
            );
          }),
    );
  }
}

class Explore_widget extends StatelessWidget {
  const Explore_widget({
    super.key, required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, width: double.infinity,
      child: ListView.builder(
          itemCount: snapshot.data!.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(

                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> detailsScreen(movie: snapshot.data[index], snapshot: snapshot,)));},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 300,
                        width:200,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Constant.imagePath}${snapshot.data[index].posterPath}'),
                      ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Recommended_widget extends StatelessWidget {
  const Recommended_widget({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child:
      CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.7,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 16/9,
            autoPlay: true,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> detailsScreen(movie: snapshot.data[itemIndex], snapshot: snapshot,)));},
              child: ClipRRect(borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: 300,
                    width:200,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constant.imagePath}${snapshot.data[itemIndex].posterPath}'),
                  )),
            );
          }
      ),
    );
  }
}