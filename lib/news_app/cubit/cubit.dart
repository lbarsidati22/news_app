import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cubit/state.dart';

class NewsCubit extends Cubit<NewsStats> {
  NewsCubit() : super(NewsInitiaiState());
  static NewsCubit get(context) => BlocProvider.of(context);
}
