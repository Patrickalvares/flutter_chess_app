import 'package:flutter/material.dart';
import 'package:flutter_chess_app/components/piece.dart';
import 'package:flutter_chess_app/values/colors.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMoves;
  final void Function()? onTap;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMoves,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    if (isSelected) {
      squareColor = selectedSquareColor;
    } else if (isValidMoves) {
      squareColor = Colors.green[300];
    } else {
      squareColor = isWhite ? backgroundColor : foregroundColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(piece!.imagePath,
                    color: piece!.isWhite ? Colors.white : Colors.black),
              )
            : null,
      ),
    );
  }
}
