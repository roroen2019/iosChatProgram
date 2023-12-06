package com.leanly.mobile.chat.controller.api;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {

    @Operation(
        summary = "루트 페이지 요청",
        tags = {"Root Path"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = @Content(schema = @Schema(implementation = String.class))
        ),
        @ApiResponse(
            responseCode = "400",
            description = "BAD REQUEST"
        ),
        @ApiResponse(
            responseCode = "404",
            description = "NOT FOUND"
        ),
        @ApiResponse(
            responseCode = "500",
            description = "INTERNAL SEVER ERROR"
        )
    })
    @GetMapping(name = "/")
    public String leanLyTest() {
        return "Hello World!";
    }
}
