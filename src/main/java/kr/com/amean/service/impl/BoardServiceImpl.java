package kr.com.amean.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;
import kr.com.amean.provider.BoardProvider;
import kr.com.amean.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired private BoardProvider boardProvider;

    @Override
    public boolean insertBoard(Board board) {
        return boardProvider.insertBoard(board);
    }

    @Override
    public boolean updateBoard(Board board) {
        return boardProvider.updateBoard(board);
    }

    @Override
    public boolean deleteBoard(int b_num) {
        return boardProvider.deleteBoard(b_num);
    }

    @Override
    public List<Board> selectBoardList(int boardCode) {
        return boardProvider.selectBoardList(boardCode);
    }

    @Override
    public Board selectBoard(int b_num) {
        return boardProvider.selectBoard(b_num);
    }

    @Override
    public List<Board> selectBoardListAll() {
        return boardProvider.selectBoardListAll();
    }

    @Override
    public Inquery getInquery(int in_num) {
        return boardProvider.selectInquery(in_num);
    }

    @Override
    public boolean registInquery(Inquery inquery) {
        return boardProvider.insertInquery(inquery);
    }

    @Override
    public List<Inquery> selectListInquery(String id) {
        return boardProvider.selectListInquery(id);
    }
    
}
