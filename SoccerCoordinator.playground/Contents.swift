// Team Treehouse
// iOS Techdegree - Project 1
// Jennifer Nordell

import UIKit


// Implementation of constants to guard against typos in keys
// typos in keys and standard values

let name = "name"
let height = "height"
let experience = "experience"
let guardians = "guardians"


// Single collection that contains all 18 players
// Each player is its own dictionary stored in an array

let players = [
    [name: "Joe Smith",
     height: 42,
     experience: true,
     guardians: "Jim and Jan Smith"
    ],
    [name: "Jill Tanner",
     height: 36,
     experience: true,
     guardians: "Clara Tanner"
    ],
    [name: "Bill Bon",
     height: 43,
     experience: true,
     guardians: "Sara and Jenny Bon"
    ],
    [name: "Eva Gordon",
     height: 45,
     experience: false,
     guardians: "Wendy and Mike Gordon"
    ],
    [name: "Matt Gill",
     height: 40,
     experience: false,
     guardians: "Charles and Sylvia Gill"
    ],
    [name: "Kimmy Stein",
     height: 41,
     experience: false,
     guardians: "Bill and Hillary Stein"
    ],
    [name: "Sammy Adams",
     height: 45,
     experience: false,
     guardians: "Jeff Adams"
    ],
    [name: "Karl Saygan",
     height: 42,
     experience: true,
     guardians: "Heather Bledsoe"
    ],
    [name: "Suzanne Greenberg",
     height: 44,
     experience: true,
     guardians: "Henrietta Dumas"
    ],
    [name: "Sal Dali",
     height: 41,
     experience: false,
     guardians: "Gala Dali"
    ],
    [name: "Joe Kavalier",
     height: 39,
     experience: false,
     guardians: "Sam and Elaine Kavalier"
    ],
    [name: "Ben Finkelstein",
     height: 44,
     experience: false,
     guardians: "Aaron and Jill Finkelstein"
    ],
    [name: "Diego Soto",
     height: 41,
     experience: true,
     guardians: "Robin and Sarika Soto"
    ],
    [name: "Chloe Alaska",
     height: 47,
     experience: false,
     guardians: "David and Jamie Alaska"
    ],
    [name: "Arnold Willis",
     height: 43,
     experience: false,
     guardians: "Claire Willis"
    ],
    [name: "Phillip Helm",
     height: 44,
     experience: true,
     guardians: "Thomas Helm and Eva Jones"
    ],
    [name: "Les Clay",
     height: 42,
     experience: true,
     guardians: "Wynonna Brown"
    ],
    [name: "Herschel Krustofski",
     height: 45,
     experience: true,
     guardians: "Hyman and Rachel Krustofski"
    ]
]


// Creation of empty arrays to hold the team roster

var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []


// Creation of constants to hold the number of players and the number of teams to avoid "magic numbers"
let numPlayers: Int = players.count
let numTeams: Int = [teamSharks, teamDragons, teamRaptors].count


// Creation of empty arrays to hold sorted experienced and inexperienced players

var inexperienced: [[String: Any]] = []
var experienced: [[String: Any]] = []


// Sort players by height

let sortedPlayers = players.sorted{
    (($0 as Dictionary<String, Any>)[height] as? Int)! > (($1 )[height] as? Int)!
}

/* Unsure this is even needed
// Function to sort players into experienced and inexperienced subgroups

func sortExperience() {
    for player in players {
        if player[experience] as! Bool {
            experienced.append(player)
        } else {
            inexperienced.append(player)
        }
    }
}
*/

print()
print(sortedPlayers)




















































