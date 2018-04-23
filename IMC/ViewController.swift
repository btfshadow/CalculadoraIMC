//
//  ViewController.swift
//  IMC
//
//  Created by Thiago Goncalves on 20/04/2018.
//  Copyright © 2018 Pastelaria de Sofware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tf_weight: UITextField!
    @IBOutlet weak var tf_height: UITextField!
    @IBOutlet weak var lb_result: UILabel!
    @IBOutlet weak var iv_result: UIImageView!
    
    @IBOutlet weak var vi_result: UIView!
    
    var imc: Double = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tf_weight.text!), let height = Double(tf_height.text!){
            imc = weight / pow(height,2)
            showResults()
        }
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Puro Osso"
                image = "abaixo"
            case 16..<18.5:
                result = "Olivia Palito"
                image = "magreza"
            case 18.5..<25:
                result = "Idealzinho de merda"
                image = "ideal"
            case 25..<30:
                result = "Ta ficando grande em"
                image = "sobre"
            default:
                result = "Chupeta de Baleia"
                image = "obesidade"
        }
        lb_result.text = "\(Int(imc)): \(result)"
        iv_result.image = UIImage(named: image)
        vi_result.isHidden = false
        view.endEditing(true)
    }
    
}

