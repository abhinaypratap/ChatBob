//
//  Constants.swift
//  ChatBob
//
//  Created by Abhinay Pratap on 08/07/22.
//

struct K {
    static let segue1 = "RegisterToChat"
    static let segue2 = "LoginToChat"
    static let appName = "ChatBob"
    static let cell1 = "ChatCell"
    static let cellNibName = "MessageCell"
    
    // Colors
    static let currentUserCellColor = "CurrentUserCellColor"
    static let otherUserCellColor = "OtherUserCellColor"
    
    
    struct FireStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
