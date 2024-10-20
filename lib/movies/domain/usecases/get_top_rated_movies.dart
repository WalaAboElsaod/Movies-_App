import 'package:dartz/dartz.dart';
import 'package:movies/core/abstract/usecase.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);



  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{

    return await baseMoviesRepository.getTopRatedMovies();

  }
}