import 'package:flutter/material.dart';
import 'package:tec_tac_toe_game/models/point.dart';
import 'package:tec_tac_toe_game/models/wraping_state.dart';
import 'package:tec_tac_toe_game/utils/symbols.dart';

class SymbolXO extends StatefulWidget {
  final Point point;
  final StateWrapper s;
  final VoidCallback check;
  const SymbolXO(
      {super.key, required this.point, required this.s, required this.check});
  @override
  State<SymbolXO> createState() => _SymbolXOState();
}

class _SymbolXOState extends State<SymbolXO> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (widget.s.s == Status.empty)
          setState(
            () {
              if (widget.point.p % 2 == 1) {
                widget.s.s = Status.cross;
              } else {
                widget.s.s = Status.circle;
              }
              widget.check();
              widget.point.p++;
            },
          )
      },
      child: widget.s.s == Status.empty
          ? null
          : widget.s.s == Status.cross
              ? Symbols.cross
              : widget.s.s == Status.circle
                  ? Symbols.circle
                  : widget.s.s == Status.endedWithCircle
                      ? Symbols.lightcircle
                      : widget.s.s == Status.endedWithCross
                          ? Symbols.lightcross
                          : null,
    );
  }
}
