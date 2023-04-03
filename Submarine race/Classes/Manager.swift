import Foundation
import UIKit

class Manager {
    
    static let shared = Manager()
    
    var gameOver = false
    var submarineView = UIView()
    var superView = UIView()
    var waterView = UIView()
    
    let waterLineTopYScale = 0.8
    
    private init() {}
}
