import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/models/tasbeeh.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit() : super(TasbeehInitial());

  List<TasbeehModel> TasbeehList = [
    TasbeehModel(text: "سبحان الله", count: 33),
    TasbeehModel(text: "الحمد لله", count: 33),
    TasbeehModel(text: "الله أكبر", count: 33),
    TasbeehModel(
        text:
            "لا إله إلا الله وحده لا شريك له، له الملك، وله الحمد، وهو على كل شيء قدير",
        count: 1),
  ];
  int count = 0;
  int index = 0;
  Count() {
    count++;
    emit(TasbeehCountChange());
    if (count <= 33)
      index = 0;
    else if (count <= 66)
      index = 1;
    else if (count <= 99)
      index = 2;
    else {
      index = 3;
      emit(TasbeehFinsh());
    }
  }

  Rest() {
    count = 0;
    index = 0;
    emit(TasbeehRest());
  }
}
