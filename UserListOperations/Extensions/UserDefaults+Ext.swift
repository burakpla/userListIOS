//
//  UserDefaults+Ext.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//
import UIKit

extension UserDefaults{
    
    class var userName: String? {
        get {
            standard.string(forKey: "userName")
        }
        set {
            standard.set(newValue, forKey: "userName")
            standard.synchronize()
        }
    }
    
    class var userMail: String? {
        get {
            standard.string(forKey: "userMail")
        }
        set {
            standard.set(newValue, forKey: "userMail")
            standard.synchronize()
        }
    }
    
    class var userPhone: String? {
        get {
            standard.string(forKey: "userPhone")
        }
        set {
            standard.set(newValue, forKey: "userPhone")
            standard.synchronize()
        }
    }
    
    class var userWebsite: String? {
        get {
            standard.string(forKey: "userWebsite")
        }
        set {
            standard.set(newValue, forKey: "userWebsite")
            standard.synchronize()
        }
    }
}
