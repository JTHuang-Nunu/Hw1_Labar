//
//  ViewController.swift
//  Hw1_Labar
//
//  Created by mac03 on 2023/3/9.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var labarTitle: UILabel!
    
    let symbol = ["🍎","🍐"]
//    let symbol = ["🍎","🍐","🍊","🍌","🍉","🍇"]
    var score = 0
    var col0 = [String]()
    var col1 = [String]()
    var col2 = [String]()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component==0){
            return col0.count
        }else if (component == 1){
            return col1.count
        }
            return col2.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component==0){
            return col0[row]
        }else if (component == 1){
            return col1[row]
        }
        return col2[row]
    }
//
//
//    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        scoreValue.text = String(999)
//        scoreValCompute(sym0: col0[row],sym1: col1[row],sym2: col2[row])
//    }
        

        
    @IBAction func labarRun(_ sender: UIButton) {
        let rand0 = Int(arc4random()) % 100
        let rand1 = Int(arc4random()) % 100
        let rand2 = Int(arc4random()) % 100
        pickerView.selectRow(rand0, inComponent: 0, animated: true)
        pickerView.selectRow(rand1, inComponent: 1, animated: true)
        pickerView.selectRow(rand2, inComponent: 2, animated: true)
        
        scoreValCompute(sym0: col0[rand0],sym1: col1[rand1],sym2: col2[rand2])
        
    }
    var value: Int = 0
    func scoreValCompute(sym0: String, sym1: String, sym2: String){
        if(Set([sym0,sym1,sym2]).count==1){
            value = Int(scoreValue.text!)!
            scoreValue.text = String(value + 100)
        }else if(Set([sym0,sym1,sym2]).count==2){
            value = Int(scoreValue.text!)!
            scoreValue.text = String(value + 10)
        }
    }
    
    func login(){
        let alert = UIAlertController(title: "Login", message: "Please input your acount name and password", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(action) in self.loginCancelAlert()})
        
        
        let confirmAction = UIAlertAction(title: "Comfirm", style: .default, handler: {(action) in
            if(alert.textFields?[0].text != "" && alert.textFields?[1].text != ""){
                self.loginConfirm(userName: (alert.textFields?[0].text)!)
            }else{
                self.login()
            }
            
        })
        
        alert.addTextField{(textField) in textField.placeholder = "Account"}
        alert.addTextField{(textField) in textField.placeholder = "Password"}
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
//        if(
        present(alert, animated: true, completion: nil)
    }
    func loginConfirm(userName: String){
//      [access] is for route testing
        let access: Bool = true
        if (access) {
            labarTitle.text = "Welcome, " + userName
        }
    }
    func loginCancelAlert(){
        let cancelAlert = UIAlertController(title: "", message: "You need input account", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in self.login()})
        cancelAlert.addAction(OKAction)
        
        present(cancelAlert, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        login()
        
    }
    
    override func viewDidLoad() {
        
        scoreValue.text = String(0)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        for _ in 1...100{
//            col0.append(symbol[(Int)(arc4random()%6)])
//            col1.append(symbol[(Int)(arc4random()%6)])
//            col2.append(symbol[(Int)(arc4random()%6)])
//        }
        for _ in 1...100{
            col0.append(symbol[(Int)(arc4random()%2)])
            col1.append(symbol[(Int)(arc4random()%2)])
            col2.append(symbol[(Int)(arc4random()%2)])
        }

        pickerView.selectRow(Int(arc4random()) % 100, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random()) % 100, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random()) % 100, inComponent: 2, animated: true)
    }
    




}
