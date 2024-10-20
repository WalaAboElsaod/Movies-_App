import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/request_state.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecases/base_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(MovieDetailsState()) {
    on<GetMoviesDetailsEvent>(_getMoviesDetails);
    on<GetMoviesRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsModelParameters(movieId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsStat: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetails: r, movieDetailsStat: RequestState.loaded)));
  }

  FutureOr<void> _getRecommendation(
      GetMoviesRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(
        RecommendationParameterse(event.id));

    result.fold(
            (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
            (r) => emit(state.copyWith(
            recommendation: r, recommendationState: RequestState.loaded)));


  }
}
