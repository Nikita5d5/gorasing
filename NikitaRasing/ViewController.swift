//
//  ViewController.swift
//  SolovevRacing
//
//  Created by WSR on 25.09.2020.
//  Copyright © 2020 WSR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PcCar: UIImageView!
    @IBOutlet weak var MyCar: UIImageView!
    @IBOutlet weak var SemaforLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var FinishLine: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    var semafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    

    @IBAction func startButton(_ sender: Any)
    {
        ResultLabel.isHidden = true
        timerGame = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalGame), userInfo: nil, repeats: true)
        
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(intervalPC), userInfo: nil, repeats: true)
    }
    @objc func intervalGame()
    {
        semafor += 1
        if semafor > 2
        {
            semafor = 1
        }
        switch semafor
        {
        case 1:
            SemaforLabel.text = "STOP"
            SemaforLabel.textColor = .red
        case 2:
            SemaforLabel.text = "GO GO"
            SemaforLabel.textColor = .green
        default:
            break;
        }
    }
    @objc func intervalPC()
    {
        ResultLabel.isHidden = false
        if semafor == 2
        {
            PcCar.center.x += 10
        }
        if PcCar.center.x >= FinishLine.center.x
        {
            ResultLabel.text = "YOU LOSE"
            ResultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
        
    }
    
    @IBAction func driveCar(_ sender: Any)
    {
        ResultLabel.isHidden = false
        if semafor == 1
        {
             MyCar.center.x -= 10
        }
        else if semafor == 2
        {
            MyCar.center.x += 10
        }
        if MyCar.center.x >= FinishLine.center.x
        {
            ResultLabel.text = "YOU WIN"
            ResultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
}

