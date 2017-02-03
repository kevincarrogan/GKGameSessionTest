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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = session.title
        
        sessionTitleLabel.text = session.title
        playerCountLabel.text = String(session.players.count)
        identifierLabel.text = session.identifier
    }

}
