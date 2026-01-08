package com.deposit.service;

import com.deposit.dto.DepositInfoDTO;
import com.deposit.dto.DepositListPagingDTO;
import com.deposit.mapper.DepositInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DepositInfoServiceImpl implements DepositInfoService {

    private final DepositInfoMapper mapper;

    @Override
    public List<DepositInfoDTO> getList(DepositListPagingDTO dto) {
        return mapper.selectList(dto);
    }

    @Override
    public int getTotalCount(DepositListPagingDTO dto) {
        return mapper.selectTotalCount(dto);
    }

    @Override
    public DepositInfoDTO get(int num) {
        return mapper.selectOne(num);
    }

    @Override
    public void updateEditable(DepositInfoDTO dto) {
        mapper.updateEditable(dto);
    }

    @Override
    public void delete(int num) {     
        mapper.delete(num);
    }

@Override
public void register(DepositInfoDTO dto) {
    mapper.insert(dto);
	}
}
