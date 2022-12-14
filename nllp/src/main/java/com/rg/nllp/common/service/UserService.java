package com.rg.nllp.common.service;

import com.rg.nllp.common.vo.user.RegisterVO;

/**
 * packageName    : com.rg.nllp.common.controller
 * fileName       : UserService
 * author         : hyeokchan
 * date           : 2022/10/26
 * description    : 사용자정보 로직 인터페이스
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022/10/26        hyeokchan       최초 생성
 */
public interface UserService {
    // 회원가입 처리
    int instUserInfo(RegisterVO inVO) throws Exception;

}
