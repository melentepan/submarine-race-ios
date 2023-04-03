import Foundation
import UIKit

class Submarine {
    
    static let shared = Submarine()
    
    let submarineWidth: CGFloat
    let submarineHeight: CGFloat
    let submarineX: CGFloat
    let submarineY: CGFloat
    var SubmarineView = UIImageView()
    
    private init() {
        self.submarineWidth = Manager.shared.superView.frame.width / 10
        self.submarineHeight = submarineWidth / 2
        self.submarineX = Manager.shared.submarineView.frame.origin.x + submarineWidth
        self.submarineY = Manager.shared.waterView.frame.midY + submarineHeight
    }
    
    func createSubmarine() {
        
        SubmarineView = UIImageView(frame: CGRect(x: submarineX, y: submarineY, width: submarineWidth, height: submarineHeight))
        SubmarineView.image = UIImage(named: "submarine")
        Manager.shared.superView.addSubview(SubmarineView)
    }
}
