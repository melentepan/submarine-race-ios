import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var waterView: UIView!
    
    var timerMoveShip = Timer()
    var timerMoveFish = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.shared.superView = view
        Manager.shared.waterView = waterView
        Submarine.shared.createSubmarine()
        SpawnShip()
        SpawnFish()
        Manager.shared.submarineView = Submarine.shared.SubmarineView
        let panRecongnizer = UIPanGestureRecognizer(target: self, action: #selector(moveSubmarine(_:)))
        view.addGestureRecognizer(panRecongnizer)
    }
    
    
    @IBAction func moveSubmarine(_ recognizer: UIPanGestureRecognizer) {
        let tapPosition = recognizer.location(in: view)
        
        if tapOnScreenY(tapPosition) && !Manager.shared.gameOver {
            Submarine.shared.SubmarineView.frame.origin.y = tapPosition.y - Submarine.shared.SubmarineView.frame.height / 2
        }
    }
    
}

private extension GameViewController {
    
    
    func tapOnScreenY(_ tapPosition: CGPoint) -> Bool {
        if tapPosition.y < waterView.frame.origin.y * Manager.shared.waterLineTopYScale {return false}
        if tapPosition.y > waterView.frame.origin.y + waterView.frame.height {return false}
        return true
    }
    
    func SpawnShip() {
        let timeInterval = TimeInterval(Float.random(in: 2...5))
        _ = Timer.scheduledTimer(
            withTimeInterval: timeInterval,
            repeats: false,
            block: { _ in
                if !Manager.shared.gameOver {
                    let newShip = Ship()
                    newShip.spawnShip()
                    self.SpawnShip()
                }
            })
        
    }
    
    func SpawnFish() {
        let timeInterval = TimeInterval(Float.random(in: 0.25...1.5))
        _ = Timer.scheduledTimer(
            withTimeInterval: timeInterval,
            repeats: false,
            block: { _ in
                if !Manager.shared.gameOver {
                    let newFish = Fish()
                    newFish.spawnFish()
                    self.SpawnFish()
                }
            })
        
    }
}

