package com.study.mapper.board;

import java.util.List;

import com.study.domain.board.BoardDto;

public interface BoardMapper {
	int insert(BoardDto board);

	List<BoardDto> list(int offset, int records, String type, String keyword);

	BoardDto select(int id, String username);

	int update(BoardDto board);

	int delete(int id);

	int countAll(String type,String keyword);

	int insertFile(int id, String fileName);
	
	int deleteFile(int id);
	
	int deleteFileByBoardIdAndFileName(int id, String fileName);

	int getLikeByBoardIdAndMemberId(String boardId, String memberId);

	int deleteLike(String boardId, String memberId);

	int insertLike(String boardId, String memberId);

	int countLikeByBoardId(String boardId);
	
	default BoardDto select(int id) {
		return select(id, null);
	}

	int deleteLikeAll(int id);
	
	int deleteLikeByBoardId(int id);

	int deleteLikeByMemberId(String id);

	List<BoardDto> listByMemberId(String id);

}	
