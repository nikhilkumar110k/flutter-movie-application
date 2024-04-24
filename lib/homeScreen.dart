import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_application/api/api.dart';
import 'package:movie_application/models/movie.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Future<List<Movie>> tredningMovies;
  @override
  void initState(){
    super.initState();
    tredningMovies=Api().getPopularMovies();
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
            const Recommended_widget(),
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
                    return const Explore_widget();
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            const SizedBox(height: 30,),
            Center(child:  const Text("Newly Released",
              style: TextStyle(fontSize: 40),
            ),
            ),
            SizedBox(height: 20,),
            Newly_Released_widget(),
          ],
        ),
      ),
    ));
  }
}

class Newly_Released_widget extends StatelessWidget {
  const Newly_Released_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, width: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.blue,
                  height: 200,
                  width: 150,
                ),
              ),
            );
          }),
    );
  }
}

class Explore_widget extends StatelessWidget {
  const Explore_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blue,
                height: 200,
                width: 150,
              ),
            ),
          );
          }),
    );
  }
}

class Recommended_widget extends StatelessWidget {
  const Recommended_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child:
      CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.7,
          autoPlayCurve: Curves.fastOutSlowIn,
          aspectRatio: 16/9,
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayAnimationDuration: const Duration(seconds: 5),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex){
          return ClipRRect(borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 300,
            width:200,
            color: Colors.red,
          ));
        }
      ),
    );
  }
}

