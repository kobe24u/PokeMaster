//
//  AppError.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 24/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Foundation

enum AppError: Error, Identifiable {
  var id: String {
    localizedDescription
  }
  
  case passwordWrong
}

extension AppError: LocalizedError {
  var localizedDescription: String {
    switch self {
    case .passwordWrong: return "Password is wrong"
    }
  }
}
