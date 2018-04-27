//
//  KeyboardViewController.swift
//  myKeyboard
//
//  Created by haogaoming on 2018/4/24.
//  Copyright © 2018年 郝高明. All rights reserved.
//

import UIKit
import SnapKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    lazy var dataSourceArray:[String] = []
    lazy var dataSourceArray2:[[String]] = []
    lazy var selectIndex = 0
    var tableview: UITableView!
    var lastButton: UIButton?
    var timer: Timer?
    lazy var timerIndex = 0
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(displayP3Red: 222/255, green: 222/255, blue: 222/255, alpha: 1.0)
        
        dataSourceArray = ["刷胜率那英雄，谁高谁拿","县找机会拿了主宰再推","别着急，先发育","明明可以打，就是不打","打团都来啊，不要坑人好不好","技术不行话倒是挺多","他们说了伪造证件,五年起","你让他自己找一张吧"]
        dataSourceArray2 = [["不参团","为666打Call"],["太坑人了","话太多"],["情人头","小学生"],["阵容怪","乱带节奏"]]
        addButton()
        
        // Perform custom UI setup here
        nextKeyboardButton = UIButton(type: .system)
        nextKeyboardButton.backgroundColor = UIColor.white
        nextKeyboardButton.setTitle("切换", for: .normal)
        nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        nextKeyboardButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        self.view.addSubview(nextKeyboardButton)
        nextKeyboardButton.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(10)
            make.bottom.equalTo(self.view.snp.bottom).offset(-10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

extension KeyboardViewController: UITableViewDelegate,UITableViewDataSource
{
    func addButton() {
        let button = UIButton(type: .custom)
        button.setTitle("快捷", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(button1Click(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(10)
            make.top.equalTo(self.view.snp.top).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        lastButton = button
        
        let button2 = UIButton(type: .custom)
        button2.setTitle("嘲讽", for: .normal)
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.backgroundColor = UIColor.white
        button2.addTarget(self, action: #selector(button2Click(_:)), for: .touchUpInside)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        self.view.addSubview(button2)
        button2.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(button)
            make.top.equalTo(button.snp.bottom).offset(10)
        }
        
        let button3 = UIButton(type: .custom)
        button3.setTitle("狂怼", for: .normal)
        button3.setTitleColor(UIColor.black, for: .normal)
        button3.backgroundColor = UIColor.white
        button3.addTarget(self, action: #selector(button3Click(_:)), for: .touchUpInside)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        self.view.addSubview(button3)
        button3.snp.makeConstraints { (make) in
            make.left.width.height.equalTo(button2)
            make.top.equalTo(button2.snp.bottom).offset(10)
        }
        
        tableview = UITableView(frame: CGRect(x: 70, y: 10, width: SCREEN_WIDTH-80, height: 210)
, style: .plain)
        tableview.backgroundColor = UIColor.clear
        tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
    }
    
    @objc func button1Click(_ btn:UIButton) {
        guard let button = lastButton else { return }
        if button == btn {
            return
        }
        button.backgroundColor = UIColor.white
        lastButton = btn
        //设置UI
        btn.backgroundColor = UIColor.lightGray
        selectIndex = 0
        tableview.reloadData()
    }
    
    @objc func button2Click(_ btn:UIButton) {
        guard let button = lastButton else { return }
        if button == btn {
            return
        }
        button.backgroundColor = UIColor.white
        lastButton = btn
        //设置UI
        btn.backgroundColor = UIColor.lightGray
        selectIndex = 1
        tableview.reloadData()
    }
    
    @objc func button3Click(_ btn:UIButton) {
        guard let button = lastButton else { return }
        if button == btn {
            return
        }
        button.backgroundColor = UIColor.white
        lastButton = btn
        //设置UI
        btn.backgroundColor = UIColor.lightGray
        selectIndex = 2
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectIndex {
        case 0:
            return dataSourceArray.count
        case 1:
            return dataSourceArray2.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectIndex == 0 {
            let str = "myTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: str) as? myTableViewCell
            if cell == nil {
                cell = myTableViewCell(style: .default, reuseIdentifier: str)
                cell?.selectionStyle = .none
                cell?.backgroundColor = UIColor.clear
            }
            cell?.myButton.setTitle(dataSourceArray[indexPath.row], for: .normal)
            return cell!
        }else if selectIndex == 1 {
            let str = "twoTableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: str) as? twoTableViewCell
            if cell == nil {
                cell = twoTableViewCell(style: .default, reuseIdentifier: str)
                cell?.selectionStyle = .none
                cell?.backgroundColor = UIColor.clear
                cell?.delegate = self
            }
            let array = dataSourceArray2[indexPath.row]
            cell?.myButton1.setTitle(array[0], for: .normal)
            cell?.myButton2.setTitle(array[1], for: .normal)
            return cell!
        }else if selectIndex == 2 {
            let str = "TableViewCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: str)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: str)
                cell?.selectionStyle = .none
                cell?.backgroundColor = UIColor.clear
                let lable = UILabel()
                lable.backgroundColor = UIColor.white
                lable.layer.masksToBounds = true
                lable.layer.cornerRadius = 5
                lable.text = "连续怼"
                lable.textAlignment = .center
                lable.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 1))
                cell?.contentView.addSubview(lable)
                lable.snp.makeConstraints({ (make) in
                    make.centerX.centerY.equalTo((cell?.contentView)!)
                    make.width.height.equalTo(100)
                })
            }
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectIndex == 0 {
            let string = dataSourceArray[indexPath.row]
            sendTextToKeyboard(string)
        }else if selectIndex == 2 {
            guard timer == nil else { return }
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerClick), userInfo: nil, repeats: true)
            RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectIndex {
        case 0:
            return 45
        case 1:
            return 60
        case 2:
            return 200
        default:
            return 0
        }
    }
}

extension KeyboardViewController: TwoTableViewCelldelegate
{
    /// 发送文字
    func sendTextToKeyboard(_ string:String) {
        self.textDocumentProxy.insertText(string)
        DispatchQueue.main.async {
            self.textDocumentProxy.insertText("\n")
        }
    }
    
    func twoTableviewcellClick(_ str:String) {
        sendTextToKeyboard(str)
    }
    
    @objc func timerClick() {
        if timerIndex == dataSourceArray.count {
            timer?.invalidate()
            timer = nil
            timerIndex = 0
            return
        }
        let string = dataSourceArray[timerIndex]
        sendTextToKeyboard(string)
        timerIndex = timerIndex+1
    }
}
