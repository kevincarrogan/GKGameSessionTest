//
//  SessionTableViewController.swift
//  GKSessionTest
//
//  Created by Kevin Carrogan on 03/02/2017.
//  Copyright © 2017 Kevin Carrogan. All rights reserved.
//

import GameKit
import UIKit

class SessionTableViewController: UITableViewController {
    
    private var sessions: [GKGameSession] = []

    @IBAction func addSession(_ sender: Any) {
        GKGameSession.createSession(inContainer: nil, withTitle: "Session \(sessions.count + 1)", maxConnectedPlayers: 0) { (session, error) in
            self.loadSessions()
        }
    }
    
    func loadSessions() {
        GKGameSession.loadSessions(inContainer: nil) {
            (sessions, error) in
            if let sessions = sessions {
                self.sessions = sessions
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSessions()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath)
        
        let session = sessions[indexPath.row]
        cell.textLabel?.text = session.title

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sessionDetailTableViewController = segue.destination as? SessionDetailTableViewController,
            let cell = sender as? UITableViewCell {
            if let indexPath = tableView.indexPath(for: cell) {
                sessionDetailTableViewController.session = sessions[indexPath.row]
            }
        }
    }

}
