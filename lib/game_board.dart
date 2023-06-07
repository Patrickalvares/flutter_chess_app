import 'package:flutter/material.dart';
import 'package:flutter_chess_app/components/piece.dart';
import 'package:flutter_chess_app/components/square.dart';
import 'package:flutter_chess_app/helper/helper_methods.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 8 * 8,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          return Square(
            isWhite: isWhite(index),
            piece: ChessPiece(
                type: ChessPieceType.pawn,
                isWhite: true,
                imagePath: 'lib/assets/pieces/pawn.png'),
          );
        },
      ),
    );
  }
}
