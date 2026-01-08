package com.deposit.mapper;

import com.deposit.dto.DepositInfoDTO;
import com.deposit.dto.DepositListPagingDTO;
import java.util.List;

public interface DepositInfoMapper {

    List<DepositInfoDTO> selectList(DepositListPagingDTO dto);

    int selectTotalCount(DepositListPagingDTO dto);
    
    DepositInfoDTO selectOne(int num);
    
    void updateEditable(DepositInfoDTO dto);

    void delete(int num);

    void insert(DepositInfoDTO dto);


}
