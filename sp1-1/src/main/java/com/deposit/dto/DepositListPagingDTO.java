package com.deposit.dto;

import lombok.Data;

@Data
public class DepositListPagingDTO {

    private int page = 1;      // 현재 페이지
    private int size = 10;     // 페이지당 개수
    private int total;         // 전체 데이터 수

    private String type;
    private String keyword;

    // 계산 필드
    private int start;         // 시작 페이지 번호
    private int end;           // 끝 페이지 번호
    private boolean prev;      // 이전 버튼 여부
    private boolean next;      // 다음 버튼 여부

    // LIMIT / OFFSET 용
    public int getOffset() {
        return (page - 1) * size;
    }

    // ⭐ total set 될 때 페이징 계산
    public void setTotal(int total) {
        this.total = total;

        int realEnd = (int) Math.ceil((double) total / size);

        this.end = (int) (Math.ceil(page / 10.0) * 10);
        this.start = this.end - 9;

        if (this.end > realEnd) {
            this.end = realEnd;
        }

        this.prev = this.start > 1;
        this.next = this.end < realEnd;
    }
}
