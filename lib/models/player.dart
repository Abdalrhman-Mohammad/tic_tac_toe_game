import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/models/wrapint_player_number.dart';
import 'package:tec_tac_toe_game/utils/app_colors.dart';
import 'package:tec_tac_toe_game/utils/symbols.dart';

class Player extends StatefulWidget {
  final PlayerNumberWrapper playerNumber;
  final int playerNumber1;
  const Player(
      {super.key, required this.playerNumber, required this.playerNumber1});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.playerNumber.playerNumber > 0
              ? "Player ${widget.playerNumber.playerNumber}"
              : widget.playerNumber.playerNumber == 0
                  ? "Winner!"
                  : "Draw",
          style: TextStyle(
            fontSize: 22,
            color: widget.playerNumber1 == 1 ? AppColor.red : AppColor.Green,
          ),
        ),
        widget.playerNumber1 == 1 ? Symbols.cross : Symbols.circle,
      ],
    );
  }
}
