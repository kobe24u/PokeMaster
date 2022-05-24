//
//  MVIType.swift
//  PokeMaster
//
//  Created by Vinnie Liu on 24/5/2022.
//  Copyright © 2022 Vinnie Pty Ltd. All rights reserved.
//

import Foundation

protocol MVIType: ObservableObject {
  var appState: AppState { get set }
  func reduce(currentState: AppState, action: AppAction) -> AppState
  func runSideEffect(action: AppAction, currentState: AppState)
}

extension MVIType {
  func dispatch(action: AppAction) {
    let newState = self.reduce(currentState: appState, action: action)
    self.appState = newState
    self.runSideEffect(action: action, currentState: newState)
  }
}
