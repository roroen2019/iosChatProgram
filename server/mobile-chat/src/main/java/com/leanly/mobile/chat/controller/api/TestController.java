package com.leanly.mobile.chat.controller.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping(name = "")
    public void leanLyTest(){
        System.out.println("GetMapping 테스트입니다.");
    }
}
