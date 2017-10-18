//
//  GuestBookViewController.swift
//  ChrisRachelWeddingApp
//
//  Created by Christopher Martin Overton on 10/15/17.
//  Copyright © 2017 Christopher Martin Overton. All rights reserved.
//

import UIKit

class GuestBookViewController: UIViewController {
    
    @IBOutlet var GBMainView: UIView!
    var navState: NavState!
    var names: [String]!
    var messages: [String]!
    var gradientlayer: CALayer!
    var gradientlayer2: CALayer!
    var gradientlayer3: CALayer!
    var gradientlayer4: CALayer!
    var gradientlayer5: CALayer!
    var PageScrollView2: FadeScrollView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var text1: UITextView!
    
    private var InfoAttributes : [[NSAttributedStringKey: Any]] = [[NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black,
        NSAttributedStringKey(rawValue: NSAttributedStringKey.backgroundColor.rawValue): UIColor.clear,
        NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont(name: "Terry Script", size: 14.0)!],
       [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.black,
        NSAttributedStringKey(rawValue: NSAttributedStringKey.backgroundColor.rawValue): UIColor.clear,
        NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont(name: "Terry Script", size: 12.0)!]]
    
    //private var InfoAttributes2 = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        text1.layer.shadowColor = UIColor.white.cgColor
        text1.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text1.layer.shadowOpacity = 1.0
        text1.layer.shadowRadius = 2.0
        // Do any additional setup after loading the view.
        let black: UIColor = UIColor.black
        let semi = black.withAlphaComponent(0.5)
        gradientlayer = RadialGradientLayer()
        gradientlayer.cornerRadius = 10.0
        gradientlayer.opacity = 0.7
        gradientlayer2 = RadialGradientLayer()
        gradientlayer2.cornerRadius = 10.0
        gradientlayer2.opacity = 0.7
        gradientlayer3 = RadialGradientLayer()
        gradientlayer3.cornerRadius = 10.0
        gradientlayer3.opacity = 0.7
        gradientlayer4 = RadialGradientLayer()
        gradientlayer4.cornerRadius = 10.0
        gradientlayer4.opacity = 0.7
        gradientlayer5 = RadialGradientLayer()
        gradientlayer5.cornerRadius = 10.0
        gradientlayer5.opacity = 0.7
        
        gradientlayer.frame = button1.bounds
        button1.clipsToBounds = true
        
        button1.layer.borderColor = semi.cgColor
        button1.layer.borderWidth = 0.3
        button1.layer.cornerRadius = 10.0
        button1.layer.shadowColor = UIColor.gray.cgColor
        button1.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button1.layer.shadowOpacity = 0.5
        button1.layer.shadowRadius = 1.0
        button1.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)
        gradientlayer2.frame = button2.bounds
        button2.clipsToBounds = true
        
        button2.layer.borderColor = semi.cgColor
        button2.layer.borderWidth = 0.3
        button2.layer.cornerRadius = 10.0
        button2.layer.shadowColor = UIColor.gray.cgColor
        button2.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button2.layer.shadowOpacity = 0.5
        button2.layer.shadowRadius = 1.0
        button2.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)
        gradientlayer3.frame = button3.bounds
        button3.clipsToBounds = true
        
        button3.layer.borderColor = semi.cgColor
        button3.layer.borderWidth = 0.3
        button3.layer.cornerRadius = 10.0
        button3.layer.shadowColor = UIColor.gray.cgColor
        button3.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button3.layer.shadowOpacity = 0.5
        button3.layer.shadowRadius = 1.0
        button3.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)
        gradientlayer4.frame = button4.bounds
        button4.clipsToBounds = true
        
        button4.layer.borderColor = semi.cgColor
        button4.layer.borderWidth = 0.3
        button4.layer.cornerRadius = 10.0
        button4.layer.shadowColor = UIColor.gray.cgColor
        button4.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button4.layer.shadowOpacity = 0.5
        button4.layer.shadowRadius = 1.0
        button4.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)
        gradientlayer5.frame = button5.bounds
        button5.clipsToBounds = true
        
        button5.layer.borderColor = semi.cgColor
        button5.layer.borderWidth = 0.3
        button5.layer.cornerRadius = 10.0
        button5.layer.shadowColor = UIColor.gray.cgColor
        button5.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button5.layer.shadowOpacity = 0.5
        button5.layer.shadowRadius = 1.0
        button5.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)
        fetchData()
        //loadScrollPageTV()
    }
    

    
    func fetchData(){
        let url = URL(string: "http://chrisandrachelwedding.atwebpages.com/getrecords.php")
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            self.names = [String]()
            self.messages = [String]()
            var dataToString = String(data: data!, encoding: String.Encoding.utf8)
            dataToString = dataToString?.replacingOccurrences(of: "\n", with: "")
            let ndata = dataToString!.data(using: String.Encoding.utf8)
            do {
                if let ndata = ndata,
                    let json = try JSONSerialization.jsonObject(with: ndata) as? [String: Any],
                    let blogs = json["records"] as? [[String: Any]] {
                    for blog in blogs {
                        if let name = blog["name"] as? String {
                            self.names.append(name)
                        }
                        if let message = blog["message"] as? String {
                            self.messages.append(message)
                        }
                    }
                }
            } catch {
                print("Error deserializing JSON: \(error)")
            }
            DispatchQueue.main.async {self.loadScrollPageTV()}
            print(self.names)
            print(self.messages)
        }
        
        task.resume()
    }
    

    
    func loadScrollPageTV(){
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        self.PageScrollView2 = FadeScrollView()
        self.PageScrollView2.frame = CGRect(x: 10, y: 100,width: width,height: height*0.5)
        self.PageScrollView2.alpha = 1
        
 
        
        self.PageScrollView2.contentSize.height = 12000
        var i = 0
        var y = 90.0
        let x = 20.0
        print(names)
        for name: String in names{
            //create view
            let nView = UIView()

            nView.backgroundColor = UIColor(red: 200.0/255.0, green:200.0/255.0, blue: 200.0/255.0, alpha: 0.3)
            nView.layer.cornerRadius = 10
            nView.layer.shadowColor = UIColor.white.cgColor
            nView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            nView.layer.shadowOpacity = 1.0
            nView.layer.shadowRadius = 2.0
            let ycg = CGFloat(y)
            let xcg = CGFloat(x)
            let lw = CGFloat(max((Float(messages[i].count) / 48.0)*30.0,30.0))
            let nvh = lw+30.0
            nView.frame = CGRect(x: xcg,y: ycg,width: 300.0,height: nvh)
            nView.isUserInteractionEnabled = false
            let textView = UITextView()
            let acstr: String = name
            let myAttributes = self.InfoAttributes[0]
            let myAttrString1 = NSAttributedString(string: acstr,
                                                   attributes: myAttributes)
            textView.attributedText = myAttrString1
            textView.frame = CGRect(x: 10,y: 5,width: 300.0,height: 30.0)
            textView.alpha = 1
            textView.isUserInteractionEnabled = false
            textView.backgroundColor = UIColor.clear
            nView.addSubview(textView)
            let textView2 = UITextView()
            let acstr2: String = messages[i]
            let myAttributes2 = self.InfoAttributes[1]
            let myAttrString2 = NSAttributedString(string: acstr2,
                                                   attributes: myAttributes2)
            textView2.attributedText = myAttrString2
            //40 chars per line wrap
            
            textView2.frame = CGRect(x: 50,y: 30,width: 230.0,height: lw)
            textView2.alpha = 1
            textView2.isUserInteractionEnabled = false
            textView2.backgroundColor = UIColor.clear
            nView.addSubview(textView2)
            self.PageScrollView2.addSubview(nView)
            y += Double(nvh) + 30.0
            i += 1
        }
        self.GBMainView.insertSubview(self.PageScrollView2,at: 4)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //gradient or attached sublayers insert added in viewDidAppear
        //properly places the layer as background...otherwise
        //in viewDidLoad layer is z indexed as foreground relative to
        //button provided image in xcode
        button1.layer.insertSublayer(gradientlayer, at: 0)
        button2.layer.insertSublayer(gradientlayer2, at: 0)
        button3.layer.insertSublayer(gradientlayer3, at: 0)
        button4.layer.insertSublayer(gradientlayer4, at: 0)
        button5.layer.insertSublayer(gradientlayer5, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HomeNavigation(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func CeremonyNavigation(_ sender: Any) {
        navState.nstate = 1
        self.dismiss(animated: false)
    }
    
    @IBAction func CelebrationNavigation(_ sender: Any) {
        navState.nstate = 2
        self.dismiss(animated: false)
    }
    
    @IBAction func AboutUsNavigation(_ sender: Any) {
        navState.nstate = 4
        self.dismiss(animated: false)
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
