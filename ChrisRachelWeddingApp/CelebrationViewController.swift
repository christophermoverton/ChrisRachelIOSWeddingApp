//
//  CelebrationViewController.swift
//  ChrisRachelWeddingApp
//
//  Created by Christopher Martin Overton on 10/15/17.
//  Copyright © 2017 Christopher Martin Overton. All rights reserved.
//

import UIKit

class CelebrationViewController: UIViewController {
    var navState: NavState!
    var gradientlayer: CALayer!
    var gradientlayer2: CALayer!
    var gradientlayer3: CALayer!
    var gradientlayer4: CALayer!
    var gradientlayer5: CALayer!
    @IBOutlet weak var Text1: UITextView!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Text1.layer.shadowColor = UIColor.white.cgColor
        Text1.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        Text1.layer.shadowOpacity = 1.0
        Text1.layer.shadowRadius = 2.0
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
        
        //button animations
        /*
         UIView.animateKeyframes(withDuration: 1, delay: 0.0, options: [.repeat,.calculationModeLinear], animations: {
         
         UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {self.button1.imageEdgeInsets = UIEdgeInsetsMake(2,2,2,2)})
         UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {self.button1.imageEdgeInsets = UIEdgeInsetsMake(8,8,8,8)})
         }, completion: nil)*/
        /*
        UIView.animate(withDuration: 1.0, delay: 6.0, options: [.repeat, .autoreverse],
                       animations: {
                        self.button1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion:{
            _ in
            UIView.animate(withDuration: 0.6) {
                self.button1.transform = CGAffineTransform.identity
            }
        })
        UIView.animate(withDuration: 1.0, delay: 7.2, options: [.repeat, .autoreverse],
                       animations: {
                        self.button2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion:{
            _ in
            UIView.animate(withDuration: 0.6) {
                self.button2.transform = CGAffineTransform.identity
            }
        })
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HomeNavigate(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func CeremonyNavigation(_ sender: Any) {
        navState.nstate = 1
        self.dismiss(animated: false)
    }
    
    @IBAction func GuestNavigation(_ sender: Any) {
        navState.nstate = 3
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
