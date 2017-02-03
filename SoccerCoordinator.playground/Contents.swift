// Team Treehouse
// iOS Techdegree - Project 1
// Jennifer Nordell

import UIKit


// Implementation of constants to guard against
// typos in keys and standard values

let name = "name"
let height = "height"
let experience = "experience"
let guardians = "guardians"
let yes = "yes"
let no = "no"

// Single collection that contains all 18 players
// Each player is its own dictionary stored in an array

let players = [
    [name: "Joe Smith",
     height: "42",
     experience: yes,
     guardians: "Jim and Jan Smith"
    ],
    [name: "Jill Tanner",
     height: "36",
     experience: yes,
     guardians: "Clara Tanner"
    ],
    [name: "Bill Bon",
     height: "43",
     experience: yes,
     guardians: "Sara and Jenny Bon"
    ],
    [name: "Eva Gordon",
     height: "45",
     experience: no,
     guardians: "Wendy and Mike Gordon"
    ],
    [name: "Matt Gill",
     height: "40",
     experience: "no",
     guardians: "Charles and Sylvia Gill"
    ],
    [name: "Kimmy Stein",
     height: "41",
     experience: no,
     guardians: "Bill and Hillary Stein"
    ],
    [name: "Sammy Adams",
     height: "45",
     experience: no,
     guardians: "Jeff Adams"
    ],
    [name: "Karl Saygan",
     height: "42",
     experience: yes,
     guardians: "Heather Bledsoe"
    ],
    [name: "Suzanne Greenberg",
     height: "44",
     experience: yes,
     guardians: "Henrietta Dumas"
    ],
    [name: "Sal Dali",
     height: "41",
     experience: no,
     guardians: "Gala Dali"
    ],
    [name: "Joe Kavalier",
     height: "39",
     experience: no,
     guardians: "Sam and Elaine Kavalier"
    ],
    [name: "Ben Finkelstein",
     height: "44",
     experience: no,
     guardians: "Aaron and Jill Finkelstein"
    ],
    [name: "Diego Soto",
     height: "41",
     experience: yes,
     guardians: "Robin and Sarika Soto"
    ],
    [name: "Chloe Alaska",
     height: "47",
     experience: no,
     guardians: "David and Jamie Alaska"
    ],
    [name: "Arnold Willis",
     height: "43",
     experience: no,
     guardians: "Claire Willis"
    ],
    [name: "Phillip Helm",
     height: "44",
     experience: yes,
     guardians: "Thomas Helm and Eva Jones"
    ],
    [name: "Les Clay",
     height: "42",
     experience: yes,
     guardians: "Wynonna Brown"
    ],
    [name: "Herschel Krustofski",
     height: "45",
     experience: yes,
     guardians: "Hyman and Rachel Krustofski"
    ]
]


// Creation of empty arryas to hold the tea<m roster
var teamSharks: [Dictionary<String, String>] = []
var teamDragons: [Dictionary<String, String>] = []
var teamRaptors: [Dictionary<String, String>] = []
var allTeams = [teamSharks, teamDragons, teamRaptors]


// Creation of empty arrays to hold sorted experienced and inexperienced players
var inexperienced: [Dictionary<String, String>] = []
var experienced: [Dictionary<String, String>] = []

// Function to sort players into experienced and inexperienced subgroups
func sortExperience() {
    for player in players {
        if player[experience] == yes {
            experienced.append(player)
        } else {
            inexperienced.append(player)
        }
    }
}

// Function to evenly sort experienced and inexperienced players into teams
func sortTeams(experienceGroup: [Dictionary<String, String>]) {
    var counter = 0
    for player in experienceGroup {
        allTeams[counter % allTeams.count].append(player)
        counter += 1
    }
}
sortExperience()
sortTeams(experienceGroup: experienced)
sortTeams(experienceGroup: inexperienced)

print(allTeams[0])





















































