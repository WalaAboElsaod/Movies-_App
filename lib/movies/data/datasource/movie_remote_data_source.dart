import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/app_constance.dart';
import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/usecases/base_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';


abstract class BaseMovieRemoteDataSource{
  Future <List<MovieModel>> getNowPlayingMovies  ();
  Future <List<MovieModel>> getNowPopularMovies  ();
  Future <List<MovieModel>> getNowTopMovies  ();
  Future <MovieDetails> getMoviesDetails  (MovieDetailsModelParameters parameters);
  Future <List<RecommendationModel>> getRecommendationMovies  (RecommendationParameterse parameters);

}


class MovieRemoteDataSource implements BaseMovieRemoteDataSource  {
  @override
  Future <List<MovieModel>> getNowPlayingMovies  () async {
   final response= await Dio().get(ApiConstance.nowPlayingMoviesPath);
 if (response.statusCode ==200){
// print(response);
   return List<MovieModel>.from((response.data["results"]as List ).map((e) => MovieModel.fromJson(e)));
 }else {

   throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data) );
 }
  }

  @override
  Future<List<MovieModel>> getNowPopularMovies() async{
final   response= await Dio().get(ApiConstance.getPopularMovies);
if (response.statusCode ==200){
  return List<MovieModel>.from((response.data["results"]as List ).map((e) => MovieModel.fromJson(e)));
}
else {

  throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data) );

}
  }

  @override
  Future<List<MovieModel>> getNowTopMovies() async{

    final   response= await Dio().get(ApiConstance.getTopRatedMovies);
    if (response.statusCode ==200){
      return List<MovieModel>.from((response.data["results"]as List ).map((e) => MovieModel.fromJson(e)));
    }
    else {

      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data) );

    }


  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsModelParameters parameters)async {
 final response=   await Dio().get(ApiConstance.getMoviesDetails(parameters.movieId));
if(response.statusCode ==200){
  return   MovieDetailsModel.fromJson(response.data)     ;

}
else {

  throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));

}

  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameterse parameters)async {
    final   response= await Dio().get(ApiConstance.getRecommendationPath(parameters.id));

    if (response.statusCode ==200){
      return List<RecommendationModel>.from((response.data["results"]as List ).map((e) => RecommendationModel.fromJson(e)));
    }
    else {

      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data) );

    }

  }


}