import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';
import 'package:movies/movies/domain/usecases/base_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';

class MoviesRepository  extends BaseMoviesRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either <Failure ,List<Movies>>> getNawPlaying() async{
     final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
     try {
       return Right(result);
     }
     on ServerException catch(failure){
       return Left(ServerFailure(failure.errorMessageModel.messageCode));
     }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies()async {
  final result = await  baseMovieRemoteDataSource.getNowPopularMovies();
  try{
    return Right(result);

  }

    on ServerException catch(failur){
    return Left( ServerFailure(failur.errorMessageModel.messageCode));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies()async {
    final result = await  baseMovieRemoteDataSource.getNowTopMovies();
    try{
      return Right(result);

    }

    on ServerException catch(failure){
      return Left( ServerFailure(failure.errorMessageModel.messageCode));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMoviesDetails(MovieDetailsModelParameters  parameters) async{
  final result=  await baseMovieRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    }
    on ServerException catch(failure){
      return Left( ServerFailure(failure.errorMessageModel.messageCode));

    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameterse parameters) async{
    final result = await  baseMovieRemoteDataSource.getRecommendationMovies(parameters);

    try{
      return Right(result);

    }

    on ServerException catch(failure){
      return Left( ServerFailure(failure.errorMessageModel.messageCode));
    }

  }



}