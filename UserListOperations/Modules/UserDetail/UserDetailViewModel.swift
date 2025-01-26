//
//  UserDetailViewModel.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import UIKit

class UserDetailViewModel {
    
    // MARK: - Properties
    
    private let user: Users
    
    // MARK: - Initializer
    
    init(user: Users) {
        self.user = user
    }
    
    // MARK: - Computed Properties
    
    var userName: String { user.name }
    var userEmail: String { user.email }
    var userPhone: String { user.phone }
    var userWebSite: String { user.website }
}

