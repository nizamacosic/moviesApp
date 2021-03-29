
import Foundation
import Reachability

//Reachability
//declare this property where it won't go out of scope relative to your listener


class NetworkManager: NSObject {
    var reachability: Reachability!
  
    static let sharedInstance: NetworkManager = {
        return NetworkManager()
    }()

    override init() {
        super.init()
        // Initialise reachability
        reachability = try! Reachability()
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    @objc func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    // Network is reachable/unreachable
     func isReachable() -> Bool {
        if (NetworkManager.sharedInstance.reachability).connection != .unavailable {
        return true
        }
        else {
            return false
        }
    }
}



