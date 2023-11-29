//
//  ContentView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//
/*
 이곳에서 자동로그인을 설정하자
 1.로컬에 아이디와 토큰을 저장
 2.저장값을 확인후 서버에 로그인api요청
 3.결과값에 따라서 메인화면(탭)보여주거나 로그인 화면 보여주기
 */
import SwiftUI

struct ContentView: View {
    @State private var checkLogin = true
    
    var body: some View {
        
        if checkLogin {
            MainTabView(isRoot: $checkLogin)
        } else {
            SnsLoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
