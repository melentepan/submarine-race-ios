import Foundation
import UIKit


class Fish {
    
    let fishWidth: Int
    let fishHeight: Int
    let xFish: Int
    let yFish: Int
    let speedFish: CGFloat
    var fishView = UIImageView()
    var timerMove = Timer()
    
    init() {
        self.fishWidth = Int(Manager.shared.superView.frame.width) / 18
        self.fishHeight = fishWidth / 2
        self.xFish = Int(Manager.shared.superView.frame.width + CGFloat(fishWidth))
        self.yFish = 0
        self.speedFish = CGFloat.random(in: 30...45) / 100
    }
    
    
    func spawnFish(){
        self.fishView = UIImageView(frame: CGRect(
            x: self.xFish,
            y: self.randomFishY(),
            width: self.fishWidth,
            height: self.fishHeight))
        if self.speedFish < 0.35 {
            fishView.image = UIImage(named: "fish3")
        } else if speedFish > 0.4 {
            fishView.image = UIImage(named: "fish1")
        } else {
            fishView.image = UIImage(named: "fish2")
        }
        Manager.shared.superView.addSubview(fishView)
        moveFish()
    }
    
    func moveFish() {
        timerMove = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            UIView.animate(withDuration: 0.3) {
                if !Manager.shared.gameOver {
                    self.fishView.frame.origin.x -= self.speedFish
                }
                if self.fishView.frame.origin.x < 0 - self.fishView.frame.width * 2{
                    self.fishView.removeFromSuperview()
                    self.timerMove.invalidate()
                }
                if Manager.shared.submarineView.frame.intersects(self.fishView.frame) {
                    Manager.shared.gameOver = true
                    self.timerMove.invalidate()
                }
            }
        })
    }
    
    func randomFishY() -> Int {
        
        return Int.random(in: Int(Manager.shared.waterView.frame.origin.y * Manager.shared.waterLineTopYScale + CGFloat(fishHeight) * 1.5)...Int(Manager.shared.waterView.frame.maxY - CGFloat(fishHeight) * 1.5))
    }
    
}
