


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/app_string.dart';
import 'package:movies/movies/presentation/componants/now_playing_componanet.dart';
import 'package:movies/movies/presentation/componants/popular_componant_componanet.dart';
import 'package:movies/movies/presentation/componants/top_rated_componanet.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(" BlocProvider  moviee");
    }
    return 
      
      BlocProvider(


        create: (BuildContext context) => sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),

        child: Scaffold(
          body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponanet(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     AppString.popular,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(AppString.seeMore,style: TextStyle(
                              color: Colors.white,
                            ),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,

                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponanet(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     AppString.topRated,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(AppString.seeMore,style: TextStyle(
                              color: Colors.white,
                            ),),
                            Icon(
                              color: Colors.white,

                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponanet(),
              const SizedBox(height: 50.0),
            ],
          ),
    ),
        ),
      );
  }
}
