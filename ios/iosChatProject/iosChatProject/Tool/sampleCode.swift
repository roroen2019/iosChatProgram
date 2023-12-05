////
////  sampleCode.swift
////  iosChatProject
////
////  Created by 이상준 on 2023/12/05.
////
//
//import Foundation
//import UIKit
// 
//class ChatViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , UITextViewDelegate , UIGestureRecognizerDelegate{
// 
//    
//    //상태 메시지
//    @IBOutlet weak var lblOtherUserActivityStatus: UILabel!
//    
//    //텍스트 뷰
//    @IBOutlet weak var tvMessageEditor: UITextView!
//    
//    //테이블 뷰
//    @IBOutlet weak var tblChat: UITableView!
//    
//    //뉴스 배너
//    @IBOutlet weak var lblNewsBanner: UILabel!
//    
//    //닉네임
//    var nickname : String!
//    
//    //채팅 메시지 데이터
//    var chatMessage = [[String: AnyObject]]()
//    
//    //@IBOutlet weak var conBottomEditor: NSLayoutConstraint!
//    
//    var bannerLabelTimer : Timer!
//    
//    // MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
// 
//        //유저가 들어왔을때
//        NotificationCenter.default.addObserver(self, selector: #selector(handleConnectedUserUpdateNotification(notification:)),
//            name: NSNotification.Name(rawValue: "userWasConnectedNotification"),
//            object: nil)
//        
//        //유저 퇴장했을때
//        NotificationCenter.default.addObserver(self, selector: #selector(handleDisconnectedUserUpdateNotification(notification:)),
//            name: NSNotification.Name(rawValue: "userWasDisconnectedNotification"),
//            object: nil)
//        
//        //유저가 타이핑 할때
//        NotificationCenter.default.addObserver(self, selector: #selector(handleUserTypingNotification(notification:)),
//            name: NSNotification.Name(rawValue: "userTypingNotification"),
//            object: nil)
//        
//        
//    //키보드 보임 관찰자
//    NotificationCenter.default.addObserver(self,
//                             selector: #selector(handleKeyboardDidShowNotification(notification:)),
//                            name: UIResponder.keyboardDidShowNotification,
//                            object: nil)
// 
//    //키보드 숨김 관찰자
//    NotificationCenter.default.addObserver(self,
//                            selector:
//                            #selector(handleKeyboardDidHideNotification(notification:)),
//                            name: UIResponder.keyboardDidHideNotification,
//                            object: nil)
// 
//        //제스쳐 이벤트
//        let swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        swipGestureRecognizer.direction = .down
//        swipGestureRecognizer.delegate = self
//        view.addGestureRecognizer(swipGestureRecognizer)
//    }
//    
//    
//    
//    
//    // MARK: - viewWillAppear - uisetting
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        configTableView()
//        configureBannerLabel()
//        configureOtherUserActivityLabel()
//        
//        tvMessageEditor.delegate = self
//    }
//    
//    // MARK:viewDidAppear - getMessgae
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        //새로운 메시지를 받기 위한 로직
//        SocketIOManager.shared.getChatMessage { (messageInfo) in
//            
//            DispatchQueue.main.async {
//                self.chatMessage.append(messageInfo)
//                self.tblChat.reloadData()
//                //self.scrollToBottom()
//            }
//            
//        }
//        
//    }
//    
//    
//    // MARK: - Custom tblChat - Method
//    func configTableView(){
//        
//        //테이블 뷰 델리게이트 설정
//        tblChat.delegate = self
//        tblChat.dataSource = self
//        
//        //테이블 셀 등록
//        tblChat.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "idCellChat")
//        tblChat.estimatedRowHeight = 90.0            //예상되는 높이 값
//        tblChat.rowHeight = UITableView.automaticDimension //각 행 높이 다르게
//        tblChat.tableFooterView = UIView(frame: .zero)
//        
//        //https://m.blog.naver.com/PostView.nhn?blogId=jdub7138&logNo=220963701224&proxyReferer=https:%2F%2Fwww.google.com%2F
//    }
//    
//    //배너 둥글게 + 알파값 설정 0
//    func configureBannerLabel(){
//        lblNewsBanner.layer.cornerRadius = 15.0
//        lblNewsBanner.clipsToBounds = true
//        lblNewsBanner.alpha = 0.0
//    }
//    
//    //다른유저 상태 메시지
//    func configureOtherUserActivityLabel() {
//        lblOtherUserActivityStatus.isHidden = true
//        lblOtherUserActivityStatus.text = ""
//    }
//    
//    
//    // MARK: - TableView delegate Method
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chatMessage.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    
//        let cell = tableView.dequeueReusableCell(withIdentifier: "idCellChat", for: indexPath) as! ChatCell
//        
//        let curChatMsg = chatMessage[indexPath.row]
//        let senderNickName = curChatMsg["nickname"] as! String
//        let msg = curChatMsg["message"] as! String
//        let date = curChatMsg["date"] as! String
//        
//        //내가 보낸 메시지 - 우측 정렬
//        if senderNickName == nickname {
//            cell.lblChatMessage.textAlignment = .right
//            cell.lblMessageDetails.textAlignment = .right
//            cell.lblChatMessage.textColor = lblNewsBanner.backgroundColor
//        }
//        
//        
//        cell.lblChatMessage.text = msg
//        cell.lblMessageDetails.text = "by \(senderNickName) -  \(date)"
//        cell.lblChatMessage.textColor = .darkGray
//        
//        return cell
//    }
//    
//    /*
//    // MARK: - Navigation
// 
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    
//    //MARK: - sendMessage
//    @IBAction func sendMessage(_ sender: Any) {
//        
//        if tvMessageEditor.text.count > 0 {
//            //메시지 서버에 발송
//            SocketIOManager.shared.sendMessage(message: self.tvMessageEditor.text!, withNickname: nickname)
//            
//            tvMessageEditor.text = ""
//            tvMessageEditor.resignFirstResponder()
//        }
//        
//    }
//    
//    
//    //MARK: - NOTI HANDLER METHOD
//    //유저 타이핑 유무
//    @objc func handleUserTypingNotification(notification: NSNotification){
//        if let typingUserDictionary = notification.object as? [String:AnyObject] {
//            
//            var names = ""
//            var totalTypingUser = 0
//            
//            for (typingUser,_) in typingUserDictionary {
//                
//                if typingUser != nickname {
//                    names = (names == "") ? typingUser : "\(names) ,  \(typingUser)"
//                    totalTypingUser += 1
//                }
//            }
//            
//            if totalTypingUser > 0 {
//                let verb = (totalTypingUser == 1) ? "is" : "are"
//                lblOtherUserActivityStatus.text = "\(names) \(verb) now typing a msg.."
//                lblOtherUserActivityStatus.isHidden = false
//            }
//            else{
//                lblOtherUserActivityStatus.isHidden = true
//            }
//            
//        }
//    }
//    
//    //유저 입장
//    @objc func handleConnectedUserUpdateNotification(notification: NSNotification){
//        
//        let connectedUserInfo = notification.object as! [String:AnyObject]
//        let connectedUserNickname = connectedUserInfo["nickname"] as? String
//        lblNewsBanner.text = "User \(connectedUserNickname!) was connted"
//        
//        //배너 호출
//        showBannerLabelAnimated()
//    }
//    
//    //유저 퇴장
//    @objc func handleDisconnectedUserUpdateNotification(notification: NSNotification){
//        let disconnectedUserNickname = notification.object as! String
//        lblNewsBanner.text = "User \(disconnectedUserNickname) has left"
//        
//        //배너 호출
//        showBannerLabelAnimated()
//    }
//    
//    //MARK:- 배너 애니메이션
//    func showBannerLabelAnimated(){
//        UIView.animate(withDuration: 0.75) {
//            self.lblNewsBanner.alpha = 1.0
//            
//        } completion: { [self] (_) in
//            
//            //2초뒤 배너 숨기기
//            self.bannerLabelTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(hideBannerLabel), userInfo: nil, repeats: false)
//            
//        }
// 
//    }
//    
//    //배너 숨기기
//   @objc func hideBannerLabel(){
//        
//        //타이머 종료
//        if bannerLabelTimer != nil {
//            bannerLabelTimer.invalidate()
//            bannerLabelTimer = nil
//        }
//        
//        UIView.animate(withDuration: 0.75) {
//            
//            self.lblNewsBanner.alpha = 0.0
//            
//        } completion: { (_) in
//            
//        }
//    }
//    
//    //MARK:- 키보드 Delegate
//    
//    //키보드 보임
//    @objc func handleKeyboardDidShowNotification(notification: NSNotification) {
//        if let userInfo = notification.userInfo{
//            
//            if let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue{
//                
//                //conBottomEditor.constant = keyboardFrame.size.height
//                //view.layoutIfNeeded()
//            }
//            
//        }
//    }
//    
//    //숨김
//    @objc func handleKeyboardDidHideNotification(notification: NSNotification) {
//        //conBottomEditor.constant = 5
//        //view.layoutIfNeeded()
//    }
//    
//    //키보드 내림 제스쳐 이벤트
//   @objc func dismissKeyboard() {
//        if tvMessageEditor.isFirstResponder{
//            tvMessageEditor.resignFirstResponder()
//            SocketIOManager.shared.sendStopTypingMessage(nickName: nickname)
//        }
//    }
//    
//    
//    // MARK: UITextViewDelegate Methods
//    
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        SocketIOManager.shared.sendStartTypingMessage(nickName: nickname)
//        
//        return true
//    }
//    
//    // MARK: UIGestureRecognizerDelegate Methods
//    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}
