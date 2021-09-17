//
//  ViewController.swift
//  leran_1
//
//  Created by bytedance on 2021/9/17.
//

import UIKit

class ViewController: UIViewController {
    var playBtn:UIButton = UIButton(type:.custom);
    var pause:UIButton = UIButton();
    var retBtn:UIButton = UIButton();
    var timeLabel:UILabel = UILabel();
    var timeCount = 0.0;
    var timer = Timer();
    var isPlaying = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(playBtn);
        self.view.addSubview(pause);
        self.view.addSubview(timeLabel);
        self.view.addSubview(retBtn);
        self.timeLabel.text = String(format:"%.1f",timeCount);
        self.timeLabel.backgroundColor = UIColor.yellow;
        timeLabel.textAlignment = .center;
        timeLabel.frame = CGRect.init(x: 100, y: 300, width: 200, height: 45);
        configButton(btn:playBtn, title: "开始", faram: CGRect.init(x: 50, y: 500, width: 90, height: 45));
        configButton(btn:pause, title: "暂停", faram: CGRect.init(x: 250, y: 500, width: 90, height: 45));
        configButton(btn:retBtn, title: "重置", faram: CGRect.init(x: 250, y: 100, width: 90, height: 45));
        playBtn.addTarget(self, action: #selector(clickStartButton), for: .touchUpInside);
        pause.addTarget(self, action: #selector(clickPauseButton), for: .touchUpInside);
        retBtn.addTarget(self, action: #selector(restButton), for: .touchUpInside);
    }
    
    
    func configButton(btn:UIButton, title:String, faram:CGRect) {
        btn.setTitle(title, for: .normal);
        btn.frame = faram;
        btn.backgroundColor = UIColor.red;
    }
    
  @objc func clickStartButton(){
        if (isPlaying) {
            return;
        }
        playBtn.isEnabled = false;
        pause.isEnabled = true;
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true);
        isPlaying = true;
    }
    
    
    @objc func restButton()
    {
        playBtn.isEnabled = true;
        pause.isEnabled = true;
        timer.invalidate();
        timeCount = 0;
        timeLabel.text = String(format:"%.1f",timeCount);
        isPlaying = false;
      }
      
    
  @objc func clickPauseButton()
  {
    playBtn.isEnabled = true;
    pause.isEnabled = false;
    timer.invalidate();
    isPlaying = false;
  }
    
  @objc func updateTimer()
  {
    timeCount = timeCount + 0.1;
    timeLabel.text = String(format:"%.1f",timeCount);
  }
    


}

