import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/abstract/usecase.dart';
import 'package:movies/core/utils/request_state.dart';

import 'package:movies/movies/domain/usecases/get_now_playing.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((_getNowPlayingMovies));

    on<GetPopularMoviesEvent>((_getPopularMovies));

    on<GetTopRatedMoviesEvent>((_getTopRatedMovies));
  }

  Future<FutureOr<void>> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    // if (kDebugMode) {
    //   print(result);
    // }
    result.fold(
        (l) => emit(state.coyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.coyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  Future<FutureOr<void>> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    // if (kDebugMode) {
    //   print(result);
    // }
    result.fold(
        (l) => emit(state.coyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.coyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async

  {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    if (kDebugMode) {
      print(result);
    }
    result.fold(
            (l) => emit(state.coyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r) => emit(state.coyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }
}
