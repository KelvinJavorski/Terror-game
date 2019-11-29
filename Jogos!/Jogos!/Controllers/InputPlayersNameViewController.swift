//
//  InputPlayersNameViewController.swift
//  Jogos!
//
//  Created by Kelvin Javorski Soares on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class InputPlayersNameViewController: UIViewController {

    @IBOutlet weak var nameText : UITextField!
    
    
	func refreshInterface () {
		// RELOAD INFO THAT SHOWS ONSCREEN
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		refreshInterface()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshInterface()
	}
    
    @IBAction func createNewPlayerName(_ sender: Any){
        if(nameText.text != ""){
            GameManager.shared.players.append(Player(name: nameText.text!))
            nameText.text = ""
        }
        
        if (verifyMaxNumberWasReached()){
            print("Players names have been filled")
            //            performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func verifyMaxNumberWasReached() -> Bool{
        let currentPlayer = GameManager.shared.players.count
        let numberOfPlayers = GameManager.shared.numberOfPlayers
        if (currentPlayer < numberOfPlayers!){
            return false
        }
        return true
    }
    
    @IBAction func passDevice(_ sender: UIButton) {
		if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: PassDeviceViewController.self) }) {
			self.navigationController?.popToViewController(vc, animated: true)
		} else  {
			if let vc = storyboard?.instantiateViewController(identifier: "Pass Device") as? PassDeviceViewController {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		}
    }

    

}

