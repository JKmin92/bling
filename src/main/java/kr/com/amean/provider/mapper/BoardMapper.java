package kr.com.amean.provider.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;

@Mapper
public interface BoardMapper {

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
