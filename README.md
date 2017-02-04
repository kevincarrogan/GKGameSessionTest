# GKGameSessionTest

A test application to document how GKGameSession works.

## Notes

 - `func sendMessage(withLocalizedFormatKey key: String, arguments: [String], data: Data?, to players: [GKCloudPlayer], badgePlayers: Bool, completionHandler: @escaping (Error?) -> Void)` with `Data?` as `nil` will result in listeners erroring.
