//
//  StatusCell.swift
//  FeroFly
//
//  Created by Goutham Devaraju on 11/01/21.
//

import UIKit

class StatusCell: UITableViewCell {

    @IBOutlet var view_on_way: UIView!
    @IBOutlet var view_delivered: UIView!
    @IBOutlet var view_done: UIView!
    @IBOutlet var view_picked: UIView!
    @IBOutlet var view_cooking: UIView!
    
    @IBOutlet var progressView: UIProgressView!
    
    var timer: Timer?
    var timer_count = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressView.progress = 0
        
        // Initialization code
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.loop), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func loop() {
        
        timer_count = timer_count + 0.1
        
        progressView.progress = Float(timer_count)/20

//        print("count: \(timer_count)")
//        print("timer: \(Float(timer_count)/20)")
        
        if(timer_count > 5 && timer_count < 5.1){
            view_picked.isHidden = false
        }
        else if(timer_count > 10.0 && timer_count < 10.1){
            view_on_way.isHidden = false
        }
        else if(timer_count > 15.0 && timer_count < 15.1){
            view_delivered.isHidden = false
        }
        else if(timer_count > 20.0){
            view_done.isHidden = false
            timer?.invalidate()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func mapAction(_ sender: UIButton) {
        //
        let directionsURL = "http://maps.apple.com/?address=28.6739206,77.1324708"
        //UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?address=1600,PennsylvaniaAve.,20500")!)

        guard let url = URL(string: directionsURL) else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }

    }
    
}
