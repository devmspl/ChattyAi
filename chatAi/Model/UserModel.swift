//
//  UserModel.swift
//  chatAi
//
//  Created by MacBook M1 on 26/04/23.
//

import Foundation

struct userData: Encodable{
    let mail: String?
    let password: String?
}

struct loginRespone: Codable{
    let isSuccess: Bool?
    let statusCode: Int?
    let data: LoginData?
    enum CodingKeys: String, CodingKey{
        case isSuccess = "isSuccess"
        case statusCode = "statusCode"
        case data = "data"
    }
}
struct LoginData:Codable{
    
    
}
