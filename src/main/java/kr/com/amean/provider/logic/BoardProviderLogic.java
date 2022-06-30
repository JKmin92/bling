package kr.com.amean.provider.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;
import kr.com.amean.provider.BoardProvider;
import kr.com.amean.provider.factory.SqlsessionFactoryProvider;

@Repository
public class BoardProviderLogic implements BoardProvider {

    private SqlSessionFactory factory;

    public BoardProviderLogic() {
        factory = SqlsessionFactoryProvider.getSqlsessionFactory();
    }

    @Override
    public boolean insertBoard(Board board) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertBoard", board);
            if(res != 0) {
                result = true;
                session.commit();
            } else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateBoard(Board board) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateBoard", board);
            if(res != 0) {
                result = true;
                session.commit();
            } else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean deleteBoard(int b_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("deleteBoard", b_num);
            if(res != 0) {
                result = true;
                session.commit();
            } else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Board> selectBoardList(int boardCode) {
        SqlSession session = factory.openSession();
        List<Board> result = null;

        try {
            result = session.selectList("selectBoardList", boardCode);
            if(result != null) session.commit(); 
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Board selectBoard(int b_num) {
        SqlSession session = factory.openSession();
        Board result = null;

        try {
            result = session.selectOne("selectBoard", b_num);
            if(result != null) session.commit(); 
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Board> selectBoardListAll() {
        SqlSession session = factory.openSession();
        List<Board> result = null;

        try {
            result = session.selectList("selectBoardListAll");
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Inquery selectInquery(int in_num) {
        SqlSession session = factory.openSession();
        Inquery result = null;

        try {
            result = session.selectOne("selectInquery", in_num);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean insertInquery(Inquery inquery) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertInquery", inquery);
            if(res != 0) {
                session.commit();
                result = true;
            } 
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Inquery> selectListInquery(String id) {
        SqlSession session = factory.openSession();
        List<Inquery> result = null;

        try {
            result = session.selectList("selectInqueryList", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }
    
}
