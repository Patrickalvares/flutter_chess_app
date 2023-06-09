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
  late List<List<ChessPiece?>> board;

  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  List<List<int>> validMoves = [];

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    //inicia o tabuleiro com nulls
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //coloca Piões
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: false,
          imagePath: 'lib/assets/pieces/pawn.png');
      newBoard[6][i] = ChessPiece(
        type: ChessPieceType.pawn,
        isWhite: true,
        imagePath: 'lib/assets/pieces/pawn.png',
      );
    }

    //coloca torres
    for (int i = 0; i < 8; i++) {
      if (i == 0 || i == 7) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.tower,
            isWhite: false,
            imagePath: 'lib/assets/pieces/tower.png');
        newBoard[7][i] = ChessPiece(
          type: ChessPieceType.tower,
          isWhite: true,
          imagePath: 'lib/assets/pieces/tower.png',
        );
      }
    }

    //coloca cavalos
    for (int i = 0; i < 8; i++) {
      if (i == 1 || i == 6) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.knight,
            isWhite: false,
            imagePath: 'lib/assets/pieces/horse.png');
        newBoard[7][i] = ChessPiece(
          type: ChessPieceType.knight,
          isWhite: true,
          imagePath: 'lib/assets/pieces/horse.png',
        );
      }
    }

    //coloca bispos
    for (int i = 0; i < 8; i++) {
      if (i == 2 || i == 5) {
        newBoard[0][i] = ChessPiece(
            type: ChessPieceType.bishop,
            isWhite: false,
            imagePath: 'lib/assets/pieces/bishop.png');
        newBoard[7][i] = ChessPiece(
          type: ChessPieceType.bishop,
          isWhite: true,
          imagePath: 'lib/assets/pieces/bishop.png',
        );
      }
    }

    //coloca Rei
    newBoard[0][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: false,
        imagePath: 'lib/assets/pieces/king.png');
    newBoard[7][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: true,
        imagePath: 'lib/assets/pieces/king.png');

    //coloca Rainha
    newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: false,
        imagePath: 'lib/assets/pieces/queen.png');
    newBoard[7][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagePath: 'lib/assets/pieces/queen.png');
    board = newBoard;
  }

  void pieceSelected(int row, int col) {
    setState(() {
      if (board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
      }

      validMoves = calculateRawValidMoves(row, col, selectedPiece);
    });
  }

  List<List<int>> calculateRawValidMoves(int row, int col, ChessPiece? piece) {
    List<List<int>> candidatesMoves = [];

    int direction = piece!.isWhite ? -1 : 1;

    switch (piece.type) {
      case ChessPieceType.pawn:
        break;
      case ChessPieceType.tower:
        break;
      case ChessPieceType.knight:
        break;
      case ChessPieceType.bishop:
        break;
      case ChessPieceType.queen:
        break;
      case ChessPieceType.king:
        break;
      default:
    }
  }

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
          int row = index ~/ 8;
          int col = index % 8;

          bool isSelected = selectedRow == row && selectedCol == col;

          return Square(
            onTap: () => pieceSelected(row, col),
            isWhite: isWhite(index),
            piece: board[row][col],
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
