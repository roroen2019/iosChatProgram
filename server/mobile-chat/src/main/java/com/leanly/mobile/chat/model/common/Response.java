package com.leanly.mobile.chat.model.common;

import static com.leanly.mobile.chat.constant.ResponseType.BAD_REQUEST;
import static com.leanly.mobile.chat.constant.ResponseType.INTERNAL_SERVER_ERROR;
import static com.leanly.mobile.chat.constant.ResponseType.NOT_FOUND;
import static com.leanly.mobile.chat.constant.ResponseType.SUCCESS;

import com.leanly.mobile.chat.constant.ResponseType;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter // 요 녀석이 범인이다!!!!!!!!
@NoArgsConstructor
public final class Response<T> {

    private int code;
    private String message;
    private T data;

    @Builder
    public Response(ResponseType responseType, T data) {
        this.code = responseType.getStatusCode();
        this.message = responseType.getMessage();
        this.data = data;
    }

    public static Response success() {
        return Response
            .builder()
            .responseType(SUCCESS)
            .build();
    }

    public static <T> Response<T> success(T data) {
        return new Response<>(SUCCESS, data);
    }

    public static Response badRequest() {
        return Response
            .builder()
            .responseType(BAD_REQUEST)
            .build();
    }

    public static Response notFound() {
        return Response
            .builder()
            .responseType(NOT_FOUND)
            .build();
    }

    public static Response serverError() {
        return Response
            .builder()
            .responseType(INTERNAL_SERVER_ERROR)
            .build();
    }


}
