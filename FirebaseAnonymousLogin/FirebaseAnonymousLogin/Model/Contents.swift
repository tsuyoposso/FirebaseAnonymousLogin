//
//  Contents.swift
//  FirebaseAnonymousLogin
//
//  Created by 長坂豪士 on 2019/10/11.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//


// 送信する際に全てのデータをdictionaryに入れて送信するためにこのクラスを作る

import Foundation

class Contents {
    
    var userNameString:String = ""
    var profileImageString:String = ""
    var contentImageString:String = ""
    var commentString:String = ""
    var postDateString:String = ""
    
    init(userNameString:String, profileImageString:String, contentImageString:String, commentString:String, postDateString:String){
        
        self.userNameString = userNameString
        self.profileImageString = profileImageString
        self.contentImageString = contentImageString
        self.commentString = commentString
        self.postDateString = postDateString

        
        
        
    }
    
}
