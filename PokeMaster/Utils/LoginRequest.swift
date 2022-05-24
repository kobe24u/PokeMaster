//
//  LoginRequest.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 24/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Combine
import Foundation

struct LoginRequest {
  let email: String
  let password: String
  
  var publisher: AnyPublisher<User, AppError> {
    Future { promise in
      DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
        if self.password == "password" {
          let user = User(
            email: self.email,
            favoritePokemonIDs: []
          )
          promise(.success(user))
        } else {
          promise(.failure(.passwordWrong))
        }
      }
    }
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }
}
