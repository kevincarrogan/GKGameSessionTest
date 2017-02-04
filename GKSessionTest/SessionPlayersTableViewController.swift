//
//  SessionPlayersTableViewController.swift
//  GKSessionTest
//
//  Created by Kevin Carrogan on 04/02/2017.
//  Copyright © 2017 Kevin Carrogan. All rights reserved.
//

import GameKit
import UIKit

class SessionPlayersTableViewController: UITableViewController {
    
    public var session: GKGameSession!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return session.players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = session.players[indexPath.row]
        cell.textLabel?.text = player.playerID
        cell.detailTextLabel?.text = player.displayName

        return cell
    }

}
