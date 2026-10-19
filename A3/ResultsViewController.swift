//
//  ResultsViewController.swift
//  A3
//
//  Created by hphngan on 2024-03-23.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses : [Answer]
    
    // Custom initializer for creating an instance of ResultsViewController with the user's responses.
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    // Required initializer declaration
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true // Hides the back button in the navigation bar.
        calculatePersonalityResult() // Calculates and displays the quiz result
        // Do any additional setup after loading the view.
    }
    
    // Calculates the quiz result based on the user's responses.
    func calculatePersonalityResult() {
        // Counts the frequency of each AnimalType among the user's responses.
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) {
        (counts, answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            } else {
                counts[answer.type] = 1
            }
        }
        // Finds the most common answer
        /*let frequentAnswerSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) in
            return pair1.value > pair2.value})*/
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        // Updates the UI to show the quiz result.
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
