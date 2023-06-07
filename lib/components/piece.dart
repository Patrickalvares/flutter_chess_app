enum ChessPieceType {
  pawn,
  tower,
  knight,
  bishop,
  queen,
  king,
}

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String imagePath;

  ChessPiece({
    required this.type,
    required this.isWhite,
    required this.imagePath,
  });
}
