import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/constant.dart';
import 'package:movie_application/models/movie.dart';

class detailsScreen extends StatelessWidget {
  const detailsScreen({super.key, required this.movie, required this.snapshot});
  final Movie movie;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(movie.title),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 200, width: double.infinity,
          child:
          ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          child:
                            Column(
                              children: [
                                const Text("Scroll to view Information", style: TextStyle(color: Colors.white),),
                                SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: Image.network(
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.fitWidth,
                                      '${Constant.imagePath}${snapshot.data[index].posterPath}'),
                                ),
                                SizedBox(
                                  child: Text('Overview: ${movie.overview} \n \n Release Date: ${movie.releaseDate} \n \n Average Vote: ${movie.voteAverage} \n Vote Count: ${movie.votecount} \n Cast: ${Constant.imagePath}${snapshot.data[index].posterPath}', style: const TextStyle(
                                    color: Colors.white
                                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                );
              }),
        ),
      ),


    );
  }
}