part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
 const  MovieDetailsState({
    this.movieDetails,
    this.movieDetailsStat=RequestState.loading,
    this.movieDetailsMessage='',
   this.recommendation=const [],
    this.recommendationState=RequestState.loading,
    this.recommendationMessage='',
  });
  final MovieDetails? movieDetails;
  final RequestState movieDetailsStat;
  final String movieDetailsMessage;
 final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

 MovieDetailsState copyWith (
 {
    MovieDetails? movieDetails,
    RequestState? movieDetailsStat,
    String? movieDetailsMessage,

    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,

 }
     ){
   return MovieDetailsState(
     movieDetails: movieDetails ?? this.movieDetails,
     movieDetailsStat: movieDetailsStat ?? this.movieDetailsStat,

     movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
     recommendation: recommendation ?? this.recommendation,
     recommendationState: movieDetailsStat ?? this.recommendationState,

     recommendationMessage: movieDetailsMessage ?? this.recommendationMessage,


   );
}

  @override
  List<Object?> get props => [movieDetails,movieDetailsStat,movieDetailsMessage,recommendation,recommendationState,recommendationMessage];
}
