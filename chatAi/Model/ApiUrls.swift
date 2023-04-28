//
//  ApiUrls.swift
//  chatAi
//
//  Created by MacBook M1 on 27/04/23.
//

import Foundation
import UIKit

public var baseUrl = "http://93.188.167.68:4007/api/"

struct ApiUrls{
    public static var  login           = baseUrl+"users/login"
    public static var  SignUp          = baseUrl+"users/createUser"
    public static var  GetUser         = baseUrl+"users/getById/"
}
