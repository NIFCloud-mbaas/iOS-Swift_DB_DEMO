//
//  ViewController.swift
//  DB_Swift
//
//  Created by Natsumo Ikeda on 2016/04/12.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {

    @IBAction func startBtn(sender: UIButton) {
        // 保存先クラスを作成
        let obj = NCMBObject(className: "TestClass")
        // 値を設定
        obj["message"] = "Hello,NCMB!"
        // 保存を実施
        obj.saveInBackground(callback: { result in
            switch result {
            case .success:
                // 保存に成功した場合の処理
                print("保存に成功しました。objectId:\(String(describing: obj.objectId))")
                DispatchQueue.main.async {
                    self.alertText.text = "保存に成功しました。objectId:\(String(describing: obj.objectId))"
                }
            case let .failure(error):
                // 保存に失敗した場合の処理
                print("エラーが発生しました。エラーコード:\(error)")
                DispatchQueue.main.async {
                    self.alertText.text = "エラーが発生しました。エラーコード:\(error)"
                }
            }
        })

        
    }
    @IBOutlet weak var alertText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

