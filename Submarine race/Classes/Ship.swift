import Foundation
import UIKit


class Ship {
    
    let shipWidth: Int
    let shipHeight: Int
    let xShip: Int
    let yShip: Int
    let speedShip: CGFloat
    var shipView = UIImageView()
    var timerMove = Timer()
    
    init() {
        self.shipWidth = Int(Manager.shared.superView.frame.width) / 9
        self.shipHeight = shipWidth / 2
        self.xShip = Int(Manager.shared.superView.frame.width + CGFloat(self.shipWidth * 2))
        self.yShip = Int(Manager.shared.waterView.frame.origin.y * Manager.shared.waterLineTopYScale - CGFloat(shipHeight / 2))
        self.speedShip = CGFloat.random(in: 20...30) / 100
    }
    
    func spawnShip(){
        self.shipView = UIImageView(frame: CGRect(
            x: self.xShip,
            y: self.yShip,
            width: self.shipWidth,
            height: self.shipHeight))
        if self.speedShip < 0.23 {
            self.shipView.image = UIImage(named: "ship3")
        } else if speedShip > 0.255 {
            self.shipView.image = UIImage(named: "ship1")
        } else {
            self.shipView.image = UIImage(named: "ship2")
        }
        Manager.shared.superView.addSubview(self.shipView)
        moveShip()
    }
    
    func moveShip() {
        timerMove = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            UIView.animate(withDuration: 0.3) {
                if !Manager.shared.gameOver {
                    self.shipView.frame.origin.x -= self.speedShip
                }
                if self.shipView.frame.origin.x < 0 - self.shipView.frame.width * 2{
                    self.shipView.removeFromSuperview()
                    self.timerMove.invalidate()
                }
                if Manager.shared.submarineView.frame.intersects(self.shipView.frame) {
                    Manager.shared.gameOver = true
                    self.timerMove.invalidate()
                }
            }
        })
    }
    
}
