//
//  AppState.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 22/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Foundation
import SwiftUI

struct AppState {
  var settings = Settings()
}

extension AppState {
  struct Settings {
    enum Sorting: CaseIterable {
      case id, name, color, favorite
    }
    
    enum AccountBehavior: CaseIterable {
      case register, login
    }
    
    // Options
    var showEnglishName: Bool = true
    var sorting: Sorting = .id
    var showFavoriteOnly = false
    
    // Signup & login
    var accountBehavior = AccountBehavior.login
    var email = ""
    var password = ""
    var verifyPassword = ""
    
    var loginUser: User?
    
    var isLoading: Bool = false
    var loginError: AppError?
  }
}

extension AppState.Settings.AccountBehavior {
  var text: String {
    switch self {
    case .register: return "Sign up"
    case .login: return "Login"
    }
  }
}

extension AppState.Settings.Sorting {
  var text: String {
    switch self {
    case .id: return "ID"
    case .name: return "Name"
    case .color: return "Color"
    case .favorite: return "Favorite"
    }
  }
}
