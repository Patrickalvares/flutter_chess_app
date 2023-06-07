import 'package:flutter/material.dart';
import 'package:flutter_chess_app/components/piece.dart';
import 'package:flutter_chess_app/values/colors.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;

  const Square({super.key, required this.isWhite, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? backgroundColor : foregroundColor,
      child: piece != null
          ? Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(piece!.imagePath,
                  color: piece!.isWhite ? Colors.white : Colors.black),
            )
          : null,
    );
  }
}
