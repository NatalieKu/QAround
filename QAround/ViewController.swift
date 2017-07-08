//
//  ViewController.swift
//  QAround
//
//  Created by MEI KU on 2017/7/8.
//  Copyright © 2017年 Natalie KU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myPic: UIImageView!
    
    @IBOutlet weak var questionNum: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var btn: [UIButton]!
    
    
    
    
    struct QAlist {
        var question:String
        var choice:[String] = []
        var ans:String
    }
    
    
    
    
    let questions = [QAlist(question:"阿朱是段正淳跟誰所生?", choice:["刀白鳳","甘寶寶","秦紅棉","阮星竹"], ans:"阮星竹"),QAlist(question:"滅絕師太是誰的師傅?", choice:["周芷若","華真真","高亞男","郭襄"], ans:"周芷若"), QAlist(question:"梅超風的原名是?", choice:["梅碧華","梅若汝","梅若華","梅天華"], ans:"梅天華"), QAlist(question:"段譽不懂下列那種武功?", choice:["凌波微步","六脈神劍","天山折梅手","北冥神功"],ans:"天山折梅手"),QAlist(question:"屠龍刀、倚天劍裡面各藏有？", choice:["九陰真經、武穆遺書","九陽真經、武穆遺書","武穆遺書、九陰真經","武穆遺書、九陽真經"],ans:"武穆遺書、九陰真經"), QAlist(question:"降龍十八掌不包含下列那招？", choice:["潛龍勿用","狄青降龍","見龍在田","飛龍在天"],ans:"狄青降龍"), QAlist(question:"打狗棒法不包含下列那一訣?",choice:["劈","封","轉","刺"],ans:"刺"), QAlist(question:"古龍原名是？", choice:["熊天平","熊耀華","查良鏞","黃易"],ans:"熊耀華"), QAlist(question:"<沅花洗劍錄>的主人公為？", choice:["方世玉","鐵中棠","方寶玉","韋小寶"],ans:"方寶玉"), QAlist(question:"哪位不是<絕代雙驕>中的十大惡人？",choice:["屠嬌嬌","黑蜘蛛","李大嘴","杜殺"],ans:"黑蜘蛛"), QAlist(question:"《風雲第一刀》中李尋歡最後的妻子是誰？", choice:["藍蠍子","林詩音","林仙兒","以上皆非"],ans:"以上皆非"),QAlist(question:"古龍塑造的從沒殺過人的人物形象是？",choice:["李尋歡","陸小鳳","楚留香","沈浪"],ans:"楚留香"), QAlist(question:"《絕代雙驕》中，給燕南天治病的那個神醫是誰？",choice:["葉星士","施經墨","張簡齋","萬春流"],ans:"萬春流"),QAlist(question:"《三少爺的劍》中天尊的首領是誰？",choice:["連城璧","慕容秋荻","謝曉峰","小弟"],ans:"慕容秋荻"), QAlist(question:"下列哪個人物不是古龍筆下的人物？", choice:["水靈光","葉開","燕七 ","小昭"],ans:"小昭"),QAlist(question:"下列那部作品不屬於楚留香傳奇系列？", choice:["《午夜蘭花》","《新月傳奇》","《鳳舞九天》","《蝙蝠傳奇》"],ans:"《鳳舞九天》"),QAlist(question:"丁鵬使用的武器？",choice:["圓月彎刀","碧血劍","打狗棒","小李飛刀"],ans:"圓月彎刀"), QAlist(question:"《絕代雙驕》中花無缺應該稱呼蘇櫻為什麼?",choice:["夫人","姐姐","弟妹","妹妹"],ans:"弟妹"), QAlist(question:"《神鵰俠侶》中李莫愁所唱的“問世間情為何物，直教人生死相許”是出自哪個詞人的哪首詞？",choice:["蘇軾<水調歌頭>","李清照<菩薩蠻>","元好問<摸魚兒>","晏殊<清平樂>"],ans:"元好問<摸魚兒>"),QAlist(question:"《書劍恩仇錄》中陳家洛的師父叫甚麼名字？",choice:["袁士霄","陳近南","霍青桐","駱冰","福康安"],ans:"袁士霄")]
    
    var questionNumber = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var questionCount = 0
    var rightAns = ""
    var score:Int = 0
    var winScore:Int = 0
    var loseScore:Int = 0
    
    @IBAction func choose(_ sender: UIButton) {
        
        
        if sender.currentTitle == rightAns
        {
            winScore = winScore + 1
            score = score + 10
        }
        else {
            loseScore = loseScore + 1
        }
        
        scoreLabel.text = "勝\(winScore)回, 敗\(loseScore)回"
        scoreLabel.isHidden = false
        
        
        if questionCount == 10
        {
            show_alertController()
            
        }
        else
        {
            showQuestion()
            
            
        }
        
    }
    
  /*  @IBAction func playAgain(_ sender: Any)
    {
        initialize()
        showQuestion()
        playagain.isHidden = true
        
    }
*/
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showQuestion()
    {
        questionCount = questionCount + 1
        let random_number = Int(arc4random_uniform(UInt32(questionNumber.count)))
        let value = questionNumber[random_number]
        
        questionNum.text = "第\(questionCount)回合"
        questionLabel.text = questions[value].question
        rightAns = questions[value].ans
        questionNumber.remove(at: random_number)
        
        
        var choice_index = [0,1,2,3]
        for i in 0..<btn.count
        {
            let random_number_for_choice_index = Int(arc4random_uniform(UInt32(choice_index.count)))
            let choice_value = choice_index[random_number_for_choice_index]
            btn[i].setTitle(questions[value].choice[choice_value], for: .normal)
            choice_index.remove(at: random_number_for_choice_index)
        }
    }
    
    func show_alertController()
    {
        let alertController = UIAlertController(
            title: "比武結束",
            message: "武功經驗值\(score),(武林盟主經驗值需100)",
            preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "再戰江湖",
                                     style: .default,
                                     handler:{
                                        (action: UIAlertAction!) -> Void in
                                        self.questionNumber.removeAll()
                                        self.initialize()
                                        self.showQuestion()
                                        
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func initialize()
    {
        questionNumber = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        questionCount = 0
        winScore = 0
        loseScore = 0
        score = 0
        scoreLabel.isHidden = true
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

