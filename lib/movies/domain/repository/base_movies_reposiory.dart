import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecases/base_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either <Failure ,List<Movies>>> getNawPlaying();
  Future<Either <Failure ,List<Movies>>> getPopularMovies();
  Future<Either <Failure ,List<Movies>>> getTopRatedMovies();
  Future<Either <Failure ,MovieDetails>> getMoviesDetails(MovieDetailsModelParameters parameters);
  Future<Either <Failure ,List<Recommendation>>> getRecommendation(RecommendationParameterse parameters);



}