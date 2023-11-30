//
//  iosChatProjectApp.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
// appDelegate를 대신하는 곳

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct iosChatProjectApp: App {
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "19ac6370823009d4c442b926b6a6e7f1")
    }
    
    var body: some Scene {
        WindowGroup {
            // onOpenURL()을 사용해 커스텀 URL 스킴 처리
            ContentView()
                .onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
    
    
}
