package com.leanly.mobile.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {

    @GetMapping("/chat")
    public String chatGET(@RequestParam("name") String name, Model model) {
        model.addAttribute("name", name);
        System.out.println("ChatController, chat GET()");

        return "test-chat";
    }
}
