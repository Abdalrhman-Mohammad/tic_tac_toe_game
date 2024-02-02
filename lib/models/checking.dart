import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/models/player.dart';
import 'package:tec_tac_toe_game/models/wraping_state.dart';
import 'package:tec_tac_toe_game/views/widgets/element_x_o.dart';

class Checking {
  List<List<SymbolXO>> l1;
  Function setState;
  List<ValueListenableBuilder> ll;
  List<Player> llnew = [];
  List<List<SymbolXO>> lnew = [];
  Checking({
    required this.l1,
    required this.setState,
    required this.ll,
    required this.llnew,
    required this.lnew,
  });
  int winner = 1;
  bool checkingRows() {
    //Rows checking
    bool find = false;
    for (int i = 0; i < 3; i++) {
      find = true;

      for (int j = 0; j < 3; j++) {
        for (int k = j + 1; k < 3; k++) {
          if (l1[i][j].s.s != l1[i][k].s.s ||
              l1[i][j].s.s == Status.empty ||
              l1[i][k].s.s == Status.empty) {
            find = false;
            break;
          }
        }
      }
      if (find) {
        for (int j = 0; j < 3; j++) {
          for (int k = 0; k < 3; k++) {
            if (j == i) break;
            if (l1[j][k].s.s == Status.circle) {
              l1[j][k].s.s = Status.endedWithCircle;
            } else if (l1[j][k].s.s == Status.cross) {
              l1[j][k].s.s = Status.endedWithCross;
            } else {
              l1[j][k].s.s = Status.ended;
            }
          }
        }
        int winner = l1[i][0].s.s == Status.cross ? 1 : 2;
        print(winner);
        llnew[winner - 1].playerNumber.playerNumber = 0;
        break;
      }
    }
    return find;
  }

  bool checkingColumns() {
    //Columns checking
    bool find = false;
    for (int i = 0; i < 3; i++) {
      find = true;
      for (int j = 0; j < 3; j++) {
        for (int k = j + 1; k < 3; k++) {
          if (l1[j][i].s.s != l1[k][i].s.s ||
              l1[j][i].s.s == Status.empty ||
              l1[k][i].s.s == Status.empty) {
            find = false;
            break;
          }
        }
        if (!find) {
          break;
        }
      }
      if (find) {
        for (int j = 0; j < 3; j++) {
          for (int k = 0; k < 3; k++) {
            if (k == i) continue;
            if (l1[j][k].s.s == Status.circle) {
              l1[j][k].s.s = Status.endedWithCircle;
            } else if (l1[j][k].s.s == Status.cross) {
              l1[j][k].s.s = Status.endedWithCross;
            } else {
              l1[j][k].s.s = Status.ended;
            }
          }
        }
        int winner = l1[0][i].s.s == Status.cross ? 1 : 2;
        print(winner);
        llnew[winner - 1].playerNumber.playerNumber = 0;
        break;
      }
    }
    return find;
  }

  bool checkingMainDiagonal() {
    //Main Diagonal checking
    bool ans = true;
    for (int i = 0; i < 3 && ans; i++) {
      for (int j = i + 1; j < 3 && ans; j++) {
        if (l1[i][i].s.s != l1[j][j].s.s ||
            l1[i][i].s.s == Status.empty ||
            l1[j][j].s.s == Status.empty) {
          ans = false;
          break;
        }
      }
    }
    if (ans) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          if (j == k) continue;
          if (l1[j][k].s.s == Status.circle) {
            l1[j][k].s.s = Status.endedWithCircle;
          } else if (l1[j][k].s.s == Status.cross) {
            l1[j][k].s.s = Status.endedWithCross;
          } else {
            l1[j][k].s.s = Status.ended;
          }
        }
      }
      int winner = l1[0][0].s.s == Status.cross ? 1 : 2;
      print(winner);
      llnew[winner - 1].playerNumber.playerNumber = 0;
    }
    return ans;
  }

  bool checkSecondaryDiagonal() {
    //Secondary Diagonal checking
    bool ans = true;
    for (int i = 0; i < 3 && ans; i++) {
      for (int j = i + 1; j < 3 && ans; j++) {
        if (l1[i][3 - i - 1].s.s != l1[j][3 - j - 1].s.s ||
            l1[i][3 - i - 1].s.s == Status.empty ||
            l1[j][3 - j - 1].s.s == Status.empty) {
          ans = false;
          break;
        }
      }
    }
    if (ans) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          if ((3 - j - 1) == k) continue;
          if (l1[j][k].s.s == Status.circle) {
            l1[j][k].s.s = Status.endedWithCircle;
          } else if (l1[j][k].s.s == Status.cross) {
            l1[j][k].s.s = Status.endedWithCross;
          } else {
            l1[j][k].s.s = Status.ended;
          }
        }
      }
      int winner = l1[0][2].s.s == Status.cross ? 1 : 2;
      print(winner);
      llnew[winner - 1].playerNumber.playerNumber = 0;
    }
    return ans;
  }

  int CheckWinning() {
    List<Function> checks = [
      checkingRows,
      checkingColumns,
      checkingMainDiagonal,
      checkSecondaryDiagonal
    ];
    bool tmp;
    for (Function f in checks) {
      tmp = f();
      if (tmp) {
        return 1;
      }
    }
    bool draw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (lnew[i][j].s.s == Status.empty) draw = false;
      }
    }
    if (draw) {
      llnew[0].playerNumber.playerNumber = -1;
      llnew[1].playerNumber.playerNumber = -1;
      return 2;
    }
    return 0;
  }
}
