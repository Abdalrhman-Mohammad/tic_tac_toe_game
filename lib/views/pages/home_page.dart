import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/models/checking.dart';
import 'package:tec_tac_toe_game/models/player.dart';
import 'package:tec_tac_toe_game/models/point.dart';
import 'package:tec_tac_toe_game/models/wraping_state.dart';
import 'package:tec_tac_toe_game/models/wrapint_player_number.dart';
import 'package:tec_tac_toe_game/views/widgets/element_x_o.dart';
import 'package:tec_tac_toe_game/utils/app_colors.dart';
import 'package:tec_tac_toe_game/views/widgets/main_column.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> value = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<int> winnerCounter = [0, 0];
    List<List<SymbolXO>> lnew = [];
    List<List<ValueListenableBuilder>> l = [];
    List<Player> llnew = [];
    List<ValueListenableBuilder> ll = [];
    Point p = Point();
    check() {
      Checking check = Checking(
        l1: lnew,
        setState: setState,
        ll: ll,
        llnew: llnew,
        lnew: lnew,
      );
      int tmp = check.CheckWinning(); //check
      // print(
      //     "${llnew[0].playerNumber.playerNumber} ${llnew[1].playerNumber.playerNumber}");
      if (tmp > 0) value.value ^= 1;
      // print(
      //     "${llnew[0].playerNumber.playerNumber} ${llnew[1].playerNumber.playerNumber}");
      print(tmp);
    }

    llnew = List.generate(
      2,
      (index) => Player(
          playerNumber: PlayerNumberWrapper(playerNumber: index + 1),
          playerNumber1: index + 1),
    );

    ll = List.generate(
        2,
        (index) => ValueListenableBuilder(
              valueListenable: value,
              builder: (context, value, child) {
                p.p = 1;
                return llnew[index] = Player(
                    playerNumber: llnew[index].playerNumber,
                    playerNumber1: index + 1);
              },
            ));
    lnew = List.generate(
      3,
      (index) => List.generate(
        3,
        (index1) => SymbolXO(
          point: p,
          s: StateWrapper(),
          check: check,
        ),
      ),
    );
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        lnew[i][j].s.lnew = lnew;
      }
    }

    l = List.generate(
      3,
      (Index) => List.generate(
        3,
        (Index1) => ValueListenableBuilder(
          valueListenable: value,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: AppColor.grey,
                ),
              ),
              child: lnew[Index][Index1] =
                  SymbolXO(point: p, s: lnew[Index][Index1].s, check: check),
            );
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColor.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ll[0],
              const Spacer(),
              ValueListenableBuilder(
                  valueListenable: value,
                  builder: (context, value, child) {
                    return Text("${winnerCounter[0]} / ${winnerCounter[1]}");
                  }),
              const Spacer(),
              ll[1],
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: l
                .map((e) => e.map((e1) => e1))
                .expand((element) => element)
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.Green,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: const Center(
                      child: Text("RESET SCORE"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.red,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (llnew[0].playerNumber.playerNumber == 0)
                        winnerCounter[0]++;
                      else if (llnew[1].playerNumber.playerNumber == 0)
                        winnerCounter[1]++;
                      llnew = List.generate(
                        2,
                        (index) => Player(
                            playerNumber:
                                PlayerNumberWrapper(playerNumber: index + 1),
                            playerNumber1: index + 1),
                      );
                      lnew = List.generate(
                        3,
                        (index) => List.generate(
                          3,
                          (index1) => SymbolXO(
                            point: p,
                            s: StateWrapper(),
                            check: check,
                          ),
                        ),
                      );
                      print(
                          "${llnew[0].playerNumber.playerNumber} ${llnew[1].playerNumber.playerNumber}");
                      value.value ^= 1;
                    },
                    child: const Center(
                      child: Text("PLAY AGAIN"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
