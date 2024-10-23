package com.example.prjjsp20241022.service;

import com.example.prjjsp20241022.dto.Board;
import com.example.prjjsp20241022.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public Map<String, Object> list(Integer page) {
        Integer offset = (page - 1) * 10;//한 페이지에 10개

//        List<Board> list = mapper.selectAll();
        List<Board> list = mapper.selectAllPaging(offset);

        //컨트롤러에게 넘겨줄 정보들을 담을 배열
        Map<String, Object> map = new HashMap<>();

//        페이지 관련 정보들
        Integer countAll = mapper.countAll();//총 레코드 수
        Integer lsatPageNumber = (countAll - 1) / 10 + 1;//마지막 페이지 번호


        //컨트롤러에게 넘겨주기위해 값을 담음
        map.put("lastPageNumber", lsatPageNumber);
        map.put("boardList", list);

        return map;
    }

    public Board get(Integer id) {
        return mapper.selectById(id);
    }

    public void remove(Integer id) {

        mapper.deleteById(id);
    }

    public void update(Board board) {
        mapper.update(board);
    }
}
