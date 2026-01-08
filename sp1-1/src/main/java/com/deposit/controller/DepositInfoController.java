package com.deposit.controller;

import com.deposit.dto.DepositInfoDTO;
import com.deposit.dto.DepositListPagingDTO;
import com.deposit.service.DepositInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/deposit")
@RequiredArgsConstructor
public class DepositInfoController {

    private final DepositInfoService depositInfoService;

    // 목록 + 검색 + 페이징
    @GetMapping("/list")
    public String list(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String keyword,
            Model model
    ) {
        DepositListPagingDTO pagingDTO = new DepositListPagingDTO();
        pagingDTO.setPage(page);
        pagingDTO.setSize(size);
        pagingDTO.setType(type);
        pagingDTO.setKeyword(keyword);

        model.addAttribute("list", depositInfoService.getList(pagingDTO));

        int total = depositInfoService.getTotalCount(pagingDTO);
        pagingDTO.setTotal(total); // setTotal에서 start/end/prev/next 계산

        model.addAttribute("paging", pagingDTO);
        return "deposit/list";
    }

    // 등록 화면
    @GetMapping("/register")
    public String registerForm() {
        return "deposit/register";
    }

    // 등록 처리
    @PostMapping("/register")
    public String register(DepositInfoDTO dto, RedirectAttributes rttr) {
        depositInfoService.register(dto);
        rttr.addFlashAttribute("msg", "등록이 완료되었습니다.");
        return "redirect:/deposit/list";
    }

    // 상세 조회
    @GetMapping("/read")
    public String read(
            @RequestParam int num,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String keyword,
            Model model
    ) {
        model.addAttribute("dto", depositInfoService.get(num));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "deposit/read";
    }

    // 수정 화면
    @GetMapping("/edit")
    public String editForm(
            @RequestParam int num,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String keyword,
            Model model
    ) {
        model.addAttribute("dto", depositInfoService.get(num));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "deposit/edit";
    }

    // ✅ 수정 처리 (POST not supported 해결 핵심)
    @PostMapping("/edit")
    public String edit(
            DepositInfoDTO dto,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String keyword,
            RedirectAttributes rttr
    ) {
        depositInfoService.updateEditable(dto);
        rttr.addFlashAttribute("msg", "수정이 완료되었습니다.");

        return "redirect:/deposit/list?page=" + page
                + "&size=" + size
                + (type != null && !type.isEmpty() ? "&type=" + type : "")
                + (keyword != null && !keyword.isEmpty() ? "&keyword=" + keyword : "");
    }

    // 삭제
    @GetMapping("/delete")
    public String delete(
            @RequestParam int num,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String keyword,
            RedirectAttributes rttr
    ) {
        depositInfoService.delete(num);
        rttr.addFlashAttribute("msg", "삭제되었습니다.");

        return "redirect:/deposit/list?page=" + page
                + "&size=" + size
                + (type != null && !type.isEmpty() ? "&type=" + type : "")
                + (keyword != null && !keyword.isEmpty() ? "&keyword=" + keyword : "");
    }
}
