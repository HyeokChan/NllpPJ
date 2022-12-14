package com.rg.nllp.operation.service.impl;

import com.rg.nllp.UtilsClass;
import com.rg.nllp.operation.mapper.NllpMapper;
import com.rg.nllp.operation.service.NllpService;
import com.rg.nllp.operation.vo.NllpDVO;
import com.rg.nllp.operation.vo.NllpInstVO;
import com.rg.nllp.operation.vo.NllpUpdtVO;
import com.rg.nllp.operation.vo.NllpVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * packageName    : com.rg.nllp.operation.service.impl
 * fileName       : NllpServiceImpl
 * author         : hyeokchan
 * date           : 2022/10/26
 * description    : 기초자료관리 로직
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022/10/26        hyeokchan       최초 생성
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class NllpServiceImpl implements NllpService {
    private final NllpMapper nllpMapper;
    private final UtilsClass utils;

    // 재산자료 목록조회
    @Override
    public List<NllpDVO> findNllpList(NllpVO inVO) throws Exception {
        List<NllpDVO> rList = this.nllpMapper.findNllpList(inVO);
        return rList;
    }
    // 재산자료 등록처리
    @Override
    public String instNllpInfo(NllpInstVO inVO) throws Exception {
        if("".equals(inVO.getNllpNm())){
            String nllpNm = utils.blankConcat(utils.nvl(inVO.getLotnoBacAddr(), "").trim(), utils.nvl(inVO.getLotnoDaddr(), "").trim());
            inVO.setNllpNm(nllpNm);
        }
        int rst = this.nllpMapper.instNllpInfo(inVO);
        if (rst == 0) {
            throw new Exception("자료 등록에 실패했습니다.");
        }
        String nllpAcbKey = inVO.getNllpAcbKey();
        return nllpAcbKey;
    }
    // 재산자료 상세조회
    @Override
    public NllpDVO findNllpInfo(NllpVO inVO) throws Exception {
        NllpDVO rData = this.nllpMapper.findNllpInfo(inVO);
        if (rData == null) {
            throw new Exception("자료 조회에 실패했습니다.");
        }
        return rData;
    }
    // 재산자료 수정처리
    @Override
    public int updtNllpInfo(NllpUpdtVO inVO) throws Exception {
        int rst = this.nllpMapper.updtNllpInfo(inVO);
        if (rst == 0) {
            throw new Exception("자료 수정에 실패했습니다.");
        }
        return rst;
    }
    // 재산자료 삭제처리
    @Override
    public int deltNllpInfo(NllpVO inVO) throws Exception {
        int rst = this.nllpMapper.deltNllpInfo(inVO);
        if (rst == 0) {
            throw new Exception("자료 삭제에 실패했습니다.");
        }
        return rst;
    }


}
