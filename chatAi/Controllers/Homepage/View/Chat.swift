//
//  Chat.swift
//  chatAi
//
//  Created by MacBook M1 on 19/04/23.
//

import Foundation


struct chat {
    let userName: String?
    let Message: String?
    let type: ChatType?
}

enum ChatType{
    case Sender
    case Recever
}
