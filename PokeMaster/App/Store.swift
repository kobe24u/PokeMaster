//
//  Store.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 22/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Combine

class Store: ObservableObject {
  @Published var appState = AppState()
  
  static func reduce(
    state: AppState,
    action: AppAction
  ) -> AppState {
    var appState = state
    
    switch action {
    case .login(let email, let password):
      if password == "password" {
        let user: User = .init(email: email, favoritePokemonIDs: [])
        appState.settings.loginUser = user
      }
    }
    
    return appState
  }
  
  func dispatch(_ action: AppAction) {
    let newState = Store.reduce(state: appState, action: action)
    appState = newState
  }
}

