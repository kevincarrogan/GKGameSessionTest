//
//  SessionDetailTableViewController.swift
//  GKSessionTest
//
//  Created by Kevin Carrogan on 03/02/2017.
//  Copyright © 2017 Kevin Carrogan. All rights reserved.
//

import GameKit
import UIKit

class SessionDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!

    public var session: GKGameSession!
    
    @IBAction func share(_ sender: Any) {
        session.getShareURL {
            (url, error) in
            if let url = url {
                let shareSheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                self.present(shareSheet, animated: true, completion: nil)
            }
        }
    }

    @IBAction func sendMessage(_ sender: Any) {
        //Do not send with data: nil or you will crash
        // receiving listeners
        session.sendMessage(withLocalizedFormatKey: "Test message", arguments: [], data: Data(), to: session.players, badgePlayers: true) {
            (error) in
            if let error = error {
                print("Failed to send message")
                print(error)
            }
        }
    }

    @IBAction func deleteSession(_ sender: Any) {
        GKGameSession.remove(withIdentifier: session.identifier) {
            (error) in
            if let error = error {
                print("Error removing session")
                print(error)
            } else {
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = session.title
        
        sessionTitleLabel.text = session.title
        playerCountLabel.text = String(session.players.count)
        identifierLabel.text = session.identifier
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayers",
            let playersViewController = segue.destination as? SessionPlayersTableViewController {
            playersViewController.session = session
        }
    }

}
