//
//  InputViewController.swift
//  FirebaseAnonymousLogin
//
//  Created by 長坂豪士 on 2019/10/10.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.layer.cornerRadius = 20.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // navigation barを消す
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    @IBAction func done(_ sender: Any) {
        
        // ユーザー名をアプリ内に保存
        UserDefaults.standard.set(userNameTextField.text, forKey: "userName")
        
        // アイコンもアプリ内に保存
        let data = logoImageView.image?.jpegData(compressionQuality: 0.1)
        UserDefaults.standard.set(data, forKey: "userImage")
        
        // 画面遷移
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") as! NextViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //
        userNameTextField.resignFirstResponder()
    }
    
    @IBAction func imageViewTap(_ sender: Any) {
        
        // タップしたときに震えるアクション
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        // アラートを出す
        // カメラ or アルバムを選択させる
        showAlert()
        
    }
    
    func doCamera() {
        
        let sourceType:UIImagePickerController.SourceType = .camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    func doAlbum() {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    // カメラかアルバムからくるデータが入ってくるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.originalImage] as? UIImage != nil {
            
            let selectedImage = info[.originalImage] as! UIImage
       
            // そのままだと画像サイズが大きすぎるため、圧縮する
            UserDefaults.standard.set(selectedImage.jpegData(compressionQuality: 0.1), forKey: "userImage")
            
            logoImageView.image = selectedImage
            // pickerを閉じる
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // キャンセルされた場合もpickerを閉じる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // アラート
    func showAlert() {
        
        let alertController = UIAlertController(title: "選択", message: "どちらを使用しますか?", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            
            self.doCamera()
        }
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            
            self.doAlbum()
        }
        
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        // 上記で設定したactionをalertControllerに追加する
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        // 表示させる
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    
}
