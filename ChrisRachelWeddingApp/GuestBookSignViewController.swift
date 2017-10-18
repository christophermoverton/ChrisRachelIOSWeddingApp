//
//  GuestBookSignViewController.swift
//  ChrisRachelWeddingApp
//
//  Created by Christopher Martin Overton on 10/16/17.
//  Copyright © 2017 Christopher Martin Overton. All rights reserved.
//

import UIKit

class GuestBookSignViewController: UIViewController {
    private var model: [String:String]! = [:]
    @IBOutlet weak var text1: UITextView!
    @IBOutlet weak var nametv: UITextView!
    @IBOutlet weak var emailtv: UITextView!
    @IBOutlet weak var messagetv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.layer.shadowColor = UIColor.white.cgColor
        text1.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text1.layer.shadowOpacity = 1.0
        text1.layer.shadowRadius = 2.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postData(postString: String){
        let url = URL(string: "http://chrisandrachelwedding.atwebpages.com/insert.php")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        //let postString = "id=13&name=Jack"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Thank You", message:
                "Thank you for signing our Guest Book!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: { action in
                switch action.style{
                    
                case .default:
                    self.dismiss(animated:true)
                case .cancel:
                    ""
                case .destructive:
                    ""
                }
            }))
                self.present(alertController, animated: true, completion: nil)
                
            }
            
        }
        task.resume()
    }
    
    @IBAction func CancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func PostAction(_ sender: Any) {
        let name: String = nametv.text
        let message: String = messagetv.text
        let email: String = emailtv.text
        var t1: Bool = false
        var t2: Bool = false
        if (name.count == 0){
            t1 = true
        }
        if (message.count == 0){
            t2 = true
        }
        
        if (t1 && t2){
            let alertController = UIAlertController(title: "Incomplete Forms", message:
                "Name and Message fields are empty!  Please fill these in!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else if (t1 && !t2){
            let alertController = UIAlertController(title: "Incomplete Forms", message:
                "Name field is empty!  Please fill this in!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else if (!t1 && t2){
            let alertController = UIAlertController(title: "Incomplete Forms", message:
                "Message field is empty!  Please fill this in!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else{
            model["name"] = name
            model["email"] = email
            model["message"] = message
              do {
            let data = try JSONSerialization.data(withJSONObject: model, options: .prettyPrinted)
                let poststring: String = String(data: data, encoding: String.Encoding.utf8) ?? ""
                print(poststring)
                postData(postString: poststring)
                return
            }
              catch{
                print("Unable to post!  Error with data JSON serialization")
            }
        }
        self.dismiss(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
