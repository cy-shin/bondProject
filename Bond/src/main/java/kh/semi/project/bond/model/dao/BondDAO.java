package kh.semi.project.bond.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.bond.model.vo.GroupImage;
import kh.semi.project.bond.model.vo.Pagination;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.member.model.vo.Member;

@Repository
public class BondDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 본드 만들기
	 * @param newGroup
	 * @return groupNo
	 */
	public int createGroup(Group newGroup) {
		int result = sqlSession.insert("groupMapper.createGroup", newGroup);

		// 메인 쿼리(INSERT) 성공 시
		if(result>0) result = newGroup.getGroupNo();
		// (실패 시 0을 반환해줌)
		return result; // 0 또는 새로운 본드 번호
	}
	
	/** 만든 멤버 삽입
	 * @param leaderMember
	 * @return
	 */
	public int insertJoinMember(Map<String, Object> leaderMember) {

		return sqlSession.insert("groupMapper.insertJoinMember", leaderMember);
	}

	/** 본드 이미지 삽입
	 * @param img
	 * @return
	 */
	public int updateGroupImage(GroupImage img) {
		
		return sqlSession.insert("groupMapper.updateGroupImage", img);
	}
	
	

	
	/** 본드 정보 조회
	 * @param groupNo
	 * @return
	 */
	public Group selectGroupInfo(int groupNo) {
		
		return sqlSession.selectOne("groupMapper.selectGroup", groupNo);
	}
	
	/** 게시글 수 조회
	 * @param postNo
	 * @return listCount
	 */
	public int getPostCount(int groupNo) {
		return sqlSession.selectOne("postMapper.getPostCount", groupNo);
	}

	/** 게시물 목록 조회
	 * @param pagination
	 * @param groupNo
	 * @return
	 */
//	public List<Post> selectBoardDetail(Pagination pagination, int groupNo) {
//		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
//		
//		RowBounds rowBounds = new  RowBounds(offset, pagination.getLimit());
//		
//		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo, rowBounds);
//	}

	public List<Post> selectBoardDetail(int groupNo) {
		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo);
	}
	public List<Post> selectBoardDetail(int groupNo, int cp) {
		RowBounds rowBounds = new RowBounds((cp-1) * 20, 20); 
				
		return sqlSession.selectList("postMapper.selectBoardDetail", groupNo, rowBounds);
	}










}
