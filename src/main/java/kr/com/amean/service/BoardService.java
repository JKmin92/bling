package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;

public interface BoardService {

    boolean insertBoard(Board board);

    boolean updateBoard(Board board);

    boolean deleteBoard(int b_num);

    List<Board> selectBoardList(int boardCode);

    Board selectBoard(int b_num);

    List<Board> selectBoardListAll();

    Inquery getInquery(int in_num);
    
    boolean registInquery(Inquery inquery);

    List<Inquery> selectListInquery(String id);
}
