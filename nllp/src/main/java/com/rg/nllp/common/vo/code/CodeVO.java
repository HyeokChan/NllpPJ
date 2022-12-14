package com.rg.nllp.common.vo.code;

import com.rg.nllp.DefaultVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * packageName    : com.rg.nllp.common.vo.code
 * fileName       : CmCdVO
 * author         : hyeokchan
 * date           : 2022/12/07
 * description    : 공통코드관리 VO
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2022/12/07        hyeokchan       최초 생성
 */
@Getter
@Setter
@ToString
@Alias("codeVO")
public class CodeVO extends DefaultVO {
    private String cdId;
    @NotBlank(message = "코드명을 입력해주세요.")
    private String cdNm;
    @NotBlank(message = "사용여부를 선택해주세요.")
    private String useYn;
    private String dtlCdId;
    private String dtlCdNm;
    @NotBlank(message = "코드구분을 선택해주세요.")
    private String cdSeCd;
    private List<String> cdIdList;
    private List<CodeVO> dtlCdList;
}
