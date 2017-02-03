//
//  SessionListener.swift
//  GKSessionTest
//
//  Created by Kevin Carrogan on 03/02/2017.
//  Copyright © 2017 Kevin Carrogan. All rights reserved.
//

import Foundation
import GameKit

class SessionListener: NSObject, GKGameSessionEventListener {
    
    override init() {
        super.init()
        print("Setting up listener")
    }
    
    func session(_ session: GKGameSession, didAdd player: GKCloudPlayer) {
        print("Did add player")
    }
    
}
