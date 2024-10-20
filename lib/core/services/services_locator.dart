import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';
import 'package:movies/movies/domain/usecases/base_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_now_playing.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';

final sl =GetIt.instance;
class ServicesLocator{
  void init()
///DATASOURCE

  {

    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));



    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));



    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));



    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
}
}
