//
//  TourokuViewController.swift
//  FirebaseAnonymousLogin
//
//  Created by 長坂豪士 on 2019/10/10.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit
import Firebase

class TourokuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signInAnonymously { (authResult, error) in
            
            let user = authResult?.user
            print(user)
            
            // 画面遷移
            let inputVC = self.storyboard?.instantiateViewController(identifier: "inputVC") as! InputViewController
            
            self.navigationController?.pushViewController(inputVC, animated: true)
            
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
