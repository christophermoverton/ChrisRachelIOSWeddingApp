//
//  ViewController.swift
//  ChrisRachelWeddingApp
//
//  Created by Christopher Martin Overton on 10/14/17.
//  Copyright © 2017 Christopher Martin Overton. All rights reserved.
//
import QuartzCore
import UIKit

class NavState{
    var nstate: Int = 0;
}

class RadialGradientLayer: CALayer {
    
    var center: CGPoint {
        return CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
    
    var radius: CGFloat {
        return (bounds.width + bounds.height)/2
    }
    // rgba(249,174,167,1) 0%,rgba(239,184,177,0.62) 49%,rgba(244,188,181,0.6) 51%,rgba(239,166,158,0.45) 71%,rgba(229,155,149,0.24) 99%,rgba(229,155,149,0.23) 100%
    var colors: [UIColor] = [UIColor(red: 249.0/255.0, green:174/255.0, blue: 167/255.0, alpha: 1.0), UIColor(red: 239/255.0, green: 184/255.0, blue: 177/255.0, alpha: 0.62), UIColor(red: 244/255.0, green: 188/255.0, blue: 181/255.0, alpha: 0.6),
        UIColor(red: 239/255.0, green: 166/255.0, blue: 158/255.0, alpha: 0.45),
        UIColor(red: 229/255.0, green: 155/255.0, blue: 149/255.0, alpha: 0.24),
        UIColor(red: 229/255.0, green: 155/255.0, blue: 149/255.0, alpha: 0.23)] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var cgColors: [CGColor] {
        return colors.map({ (color) -> CGColor in
            return color.cgColor
        })
    }
    
    override init() {
        super.init()
        needsDisplayOnBoundsChange = true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override func draw(in ctx: CGContext) {
        ctx.saveGState()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 0.49,0.51,0.71,0.99,1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: locations) else {
            return
        }
        ctx.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
    }
    
}

class ViewController: UIViewController {

    var navState: NavState!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var text5: UITextView!
    @IBOutlet weak var text4: UITextView!
    @IBOutlet weak var text3: UITextView!
    @IBOutlet weak var text2: UITextView!
    @IBOutlet weak var text1: UITextView!
    var gradientlayer: CALayer!
    var gradientlayer2: CALayer!
    var gradientlayer3: CALayer!
    var gradientlayer4: CALayer!
    var gradientlayer5: CALayer!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cSend" {
            if let destination = segue.destination as? CeremonyViewController {
                destination.navState = self.navState
            }
        }
        if segue.identifier == "celSend" {
            if let destination = segue.destination as? CelebrationViewController {
                destination.navState = self.navState
            }
        }
        if segue.identifier == "gShow" {
            if let destination = segue.destination as? GuestBookViewController {
                destination.navState = self.navState
            }
        }
        
        if segue.identifier == "aShow" {
            if let destination = segue.destination as? AboutUsViewController {
                destination.navState = self.navState
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navState = NavState()
        // Do any additional setup after loading the view, typically from a nib.
        //text1.font = UIFont(name:"destain", size: 45)
        //text2.font = UIFont(name:"destain", size: 45)

        text1.layer.shadowColor = UIColor.white.cgColor
        text1.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text1.layer.shadowOpacity = 1.0
        text1.layer.shadowRadius = 2.0
        text2.layer.shadowColor = UIColor.white.cgColor
        text2.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text2.layer.shadowOpacity = 1.0
        text2.layer.shadowRadius = 2.0
        text3.layer.shadowColor = UIColor.white.cgColor
        text3.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text3.layer.shadowOpacity = 1.0
        text3.layer.shadowRadius = 2.0
        text4.layer.shadowColor = UIColor.white.cgColor
        text4.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text4.layer.shadowOpacity = 1.0
        text4.layer.shadowRadius = 2.0
        text5.layer.shadowColor = UIColor.white.cgColor
        text5.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        text5.layer.shadowOpacity = 1.0
        text5.layer.shadowRadius = 2.0
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkNavState()
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

    func checkNavState(){
        if (navState.nstate == 1){
            navState.nstate = 0
            performSegue(withIdentifier: "cSend", sender: self)
        }
        else if (navState.nstate == 2){
            navState.nstate = 0
            performSegue(withIdentifier: "celSend", sender: self)
        }
        
        else if (navState.nstate == 3){
            navState.nstate = 0
            performSegue(withIdentifier: "gShow", sender: self)
        }
        
        else if (navState.nstate == 4){
            navState.nstate = 0
            performSegue(withIdentifier: "aShow", sender: self)
        }
        
    }
}

