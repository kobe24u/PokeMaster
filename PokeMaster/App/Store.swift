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
}

