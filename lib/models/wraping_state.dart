import 'package:tec_tac_toe_game/views/widgets/element_x_o.dart';

class StateWrapper {
  Status s = Status.empty;
  List<List<SymbolXO>> lnew = [];
}

enum Status { empty, cross, circle, endedWithCircle, endedWithCross, ended }
