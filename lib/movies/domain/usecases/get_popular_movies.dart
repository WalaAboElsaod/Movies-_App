import 'package:dartz/dartz.dart';
import 'package:movies/core/abstract/usecase.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase  extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);



  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMoviesRepository.getPopularMovies();

  }
}