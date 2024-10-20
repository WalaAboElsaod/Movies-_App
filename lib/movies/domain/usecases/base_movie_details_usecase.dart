import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/abstract/usecase.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/repository/base_movies_reposiory.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsModelParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MovieDetails>> call( MovieDetailsModelParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }
}

class MovieDetailsModelParameters  extends Equatable{
  final int movieId;

  const MovieDetailsModelParameters({

  required this.movieId,

});

  @override
  List<Object?> get props => [movieId];
}
