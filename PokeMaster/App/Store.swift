//
//  Store.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 22/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Combine

class Store: MVIType {
  @Published var appState = AppState()
  var cancellables = Set<AnyCancellable>()
  
  func reduce(currentState: AppState, action: AppAction) -> AppState {
    var newState = currentState
    switch action {
    case .login(_, _):
      newState.settings.isLoading = true
    }
    return newState
  }
  
  
  func runSideEffect(action: AppAction, currentState: AppState) {
    switch action {
    case .login(let email, let password):
      loginAction(email, password)
    }
  }
  
  fileprivate func loginAction(_ email: String, _ password: String) {
    LoginRequest(email: email, password: password)
      .publisher
      .sink { [weak self] completion in
        self?.appState.settings.isLoading = false
        switch completion {
        case .finished: break
        case .failure(let error):
          self?.appState.settings.loginError = error
        }
      } receiveValue: { [weak self] user in
        self?.appState.settings.loginUser = user
      }
      .store(in: &cancellables)
  }
}


