package com.deposit.service;


import com.deposit.dto.DepositInfoDTO;
import com.deposit.dto.DepositListPagingDTO;

import java.util.List;

public interface DepositInfoService {

    // 목록 + 검색
    List<DepositInfoDTO> getList(DepositListPagingDTO dto);

    // 전체 건수
    int getTotalCount(DepositListPagingDTO dto);

    // 단건 조회
    DepositInfoDTO get(int num);

    // 등록
    void register(DepositInfoDTO dto);

    // 수정 ✅ 이거 반드시 있어야 함
    void updateEditable(DepositInfoDTO dto);

    // 삭제
    void delete(int num);
}
