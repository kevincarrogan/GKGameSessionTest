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
        print("didAdd player")
    }
    
    func session(_ session: GKGameSession, didReceiveMessage message: String, with data: Data, from player: GKCloudPlayer) {
        print("didReceiveMessage")
        print(message)
    }
    
    func session(_ session: GKGameSession, didRemove player: GKCloudPlayer) {
        print("didRemove player")
    }
    
    func session(_ session: GKGameSession, player: GKCloudPlayer, didSave data: Data) {
        print("player didSave data")
    }
    
    func session(_ session: GKGameSession, didReceive data: Data, from player: GKCloudPlayer) {
        print("didReceive data from player")
    }
    
    func session(_ session: GKGameSession, player: GKCloudPlayer, didChange newState: GKConnectionState) {
        print("player didChange")
    }
    
}
