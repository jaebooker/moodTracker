//
//  ViewController.swift
//  moodTracker
//
//  Created by Jaeson Booker on 11/8/18.
//  Copyright © 2018 Jaeson Booker. All rights reserved.
//

import UIKit
struct MoodEntry {
    var mood: Mood
    var date: Date
    
    enum Mood: Int {
        case none
        case amazing
        case good
        case neutral
        case bad
        case terrible
        case shitty
        case iHateYou
        case high
        case meloncholy
        case murderous
        case treasonous
        case brooding
        case kafkaesque
        
        var stringValue: String {
            switch self {
            case .none:
                return ""
            case .amazing:
                return "Amazing"
            case .good:
                return "Good"
            case .neutral:
                return "Neutral"
            case .bad:
                return "Bad"
            case .terrible:
                return "Terrible"
            case .shitty:
                return "Shitty"
            case .iHateYou:
                return "I Hate Everything"
            case .high:
                return "Lucy in the Sky with Diamonds"
            case .meloncholy:
                return "*Sigh*"
            case .murderous:
                return "Imma kill ya!"
            case .treasonous:
                return "Oh... I'm peachy... you?"
            case .brooding:
                return "Soon..."
            case .kafkaesque:
                return "I'm a roach! How do you THINK I'm feeling???"
            }
        }
    }
}
class ViewController: UIViewController {
    var entries: [MoodEntry] = []
    @IBOutlet weak var tableView: UITableView!
    @IBAction func pressAddItem(_ sender: UIBarButtonItem) {
        let now = Date()
        let newMood = MoodEntry(mood: .amazing, date: now)
        entries.insert(newMood, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        let terribleEntry = MoodEntry(mood: .terrible, date: Date())
        let shittyEntry = MoodEntry(mood: .shitty, date: Date())
        let hateEntry = MoodEntry(mood: .iHateYou, date: Date())
        let highEntry = MoodEntry(mood: .high, date: Date())
        let murderousEntry = MoodEntry(mood: .murderous, date: Date())
        let meloncholyEntry = MoodEntry(mood: .meloncholy, date: Date())
        let treasonousEntry = MoodEntry(mood: .treasonous, date: Date())
        let broodingEntry = MoodEntry(mood: .brooding, date: Date())
        let kafkaesque = MoodEntry(mood: .kafkaesque, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry, terribleEntry, shittyEntry, hateEntry, highEntry, murderousEntry, meloncholyEntry, treasonousEntry, broodingEntry, kafkaesque]
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath) as! MoodEntryTableViewCell
        let entry = entries[indexPath.row]
        cell.labelMoodTitle.text = entry.mood.stringValue
        //cell.imageViewMoodColor.backgroundColor = entry.mood.colorValue
        cell.labelMoodDate.text = String(describing: entry.date)
        //cell.detailTextLabel?.text = String(describing: entry.date)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = entries[indexPath.row]
        print("Selected mood was \(selectedEntry.mood.stringValue)")
    }
}
class MoodEntryTableViewCell: UITableViewCell {
    @IBOutlet weak var labelMoodTitle: UILabel!
    @IBOutlet weak var labelMoodDate: UILabel!
    @IBOutlet weak var imageViewMoodColor: UIImageView!
    
}
