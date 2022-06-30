package kr.com.amean.provider;

import java.util.List;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;

public interface BoardProvider {
    boolean insertBoard(Board board);

    boolean updateBoard(Board board);

    boolean deleteBoard(int b_num);

    List<Board> selectBoardList(int boardCode);

    Board selectBoard(int b_num);

    List<Board> selectBoardListAll();

    Inquery selectInquery(int in_num);

    boolean insertInquery(Inquery inquery);

    List<Inquery> selectListInquery(String id);
}
