package com.deposit.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DepositInfoDTO {
    private int num;
    private String account;
    private String name;
    private Timestamp depositdate;   
    private String flag;
    private Integer money;    
    private Integer balance;  
    private String memo;
    private String regId;
    
    public String getRegId() {
        return regId;
}
}