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
     height: 42.0,
     experience: true,
     guardians: "Jim and Jan Smith"
    ],
    [name: "Jill Tanner",
     height: 36.0,
     experience: true,
     guardians: "Clara Tanner"
    ],
    [name: "Bill Bon",
     height: 43.0,
     experience: true,
     guardians: "Sara and Jenny Bon"
    ],
    [name: "Eva Gordon",
     height: 45.0,
     experience: false,
     guardians: "Wendy and Mike Gordon"
    ],
    [name: "Matt Gill",
     height: 40.0,
     experience: false,
     guardians: "Charles and Sylvia Gill"
    ],
    [name: "Kimmy Stein",
     height: 41.0,
     experience: false,
     guardians: "Bill and Hillary Stein"
    ],
    [name: "Sammy Adams",
     height: 45.0,
     experience: false,
     guardians: "Jeff Adams"
    ],
    [name: "Karl Saygan",
     height: 42.0,
     experience: true,
     guardians: "Heather Bledsoe"
    ],
    [name: "Suzanne Greenberg",
     height: 44.0,
     experience: true,
     guardians: "Henrietta Dumas"
    ],
    [name: "Sal Dali",
     height: 41.0,
     experience: false,
     guardians: "Gala Dali"
    ],
    [name: "Joe Kavalier",
     height: 39.0,
     experience: false,
     guardians: "Sam and Elaine Kavalier"
    ],
    [name: "Ben Finkelstein",
     height: 44.0,
     experience: false,
     guardians: "Aaron and Jill Finkelstein"
    ],
    [name: "Diego Soto",
     height: 41.0,
     experience: true,
     guardians: "Robin and Sarika Soto"
    ],
    [name: "Chloe Alaska",
     height: 47.0,
     experience: false,
     guardians: "David and Jamie Alaska"
    ],
    [name: "Arnold Willis",
     height: 43.0,
     experience: false,
     guardians: "Claire Willis"
    ],
    [name: "Phillip Helm",
     height: 44.0,
     experience: true,
     guardians: "Thomas Helm and Eva Jones"
    ],
    [name: "Les Clay",
     height: 42.0,
     experience: true,
     guardians: "Wynonna Brown"
    ],
    [name: "Herschel Krustofski",
     height: 45.0,
     experience: true,
     guardians: "Hyman and Rachel Krustofski"
    ]
]


// Creation of empty arrays to hold the team roster

var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []


// Function to count the number of experienced players

func countExperiencedPlayers() -> Int{
    var count = 0
    for player in players {
        if(player[experience] as! Bool){
            count += 1
        }
    }
    return count
}


// Creation of constants to hold the number of players, number of teams, max 
// players per team, and max experienced players per team to avoid "magic numbers"

let numPlayers: Int = players.count
let numTeams: Int = [teamSharks, teamDragons, teamRaptors].count
let maxPlayers: Int = Int(ceil(Double(numPlayers / numTeams)))
let expPlayers: Int = countExperiencedPlayers()
let inexpPlayers: Int = players.count - expPlayers

// Sort players by height

let sortedPlayers = players.sorted{
    (($0 as Dictionary<String, Any>)[height] as? Double)! > (($1 )[height] as? Double)!
}


// Creation of variables to hold running totals of the heights of players assigned
// to the respective teams.

var sharksHeight: Double = 0.0
var dragonsHeight: Double = 0.0
var raptorsHeight: Double = 0.0

// Function to determine if the team has reached its max for 
// the particular experience level of the player

func expMax(currentPlayer: [String: Any], currentTeam: [[String: Any]]) -> Bool{
    var expCount = 0
    var inexpCount = 0
    let maxExpPlayers = expPlayers / numTeams
    let maxInexpPlayers = inexpPlayers / numTeams

    for player in currentTeam {
        if(player[experience] as! Bool) {
            expCount += 1
        } else {
            inexpCount += 1
        }
    }
    if(inexpCount == maxInexpPlayers && !(currentPlayer[experience]! as! Bool)) || (expCount == maxExpPlayers && currentPlayer[experience] as! Bool){
        return true
    } else {
        return false
    }
}


// Function to assign players into the optimal teams

func assignPlayers() {
    for player in sortedPlayers {
        if (sharksHeight <= dragonsHeight) && (sharksHeight <= raptorsHeight) && !expMax(currentPlayer: player, currentTeam: teamSharks) && (teamSharks.count < maxPlayers) {
            teamSharks.append(player)
            sharksHeight += player[height] as! Double
        } else if (dragonsHeight <= raptorsHeight) && !expMax(currentPlayer: player, currentTeam: teamDragons) && (teamDragons.count < maxPlayers) {
            teamDragons.append(player)
            dragonsHeight += player[height] as! Double
        } else {
            teamRaptors.append(player)
            raptorsHeight += player[height] as! Double
        }
    }
}


assignPlayers()
/*
print(teamSharks)
print()
print(teamDragons)
print()
print(teamRaptors)
print("\n")
*/
print("Team heights: ")
print("Sharks: \(sharksHeight)")
print("Dragons: \(dragonsHeight)")
print("Raptors: \(raptorsHeight)")
print()
print()
print("Team height average: ")
print("Sharks: \(Double(sharksHeight / Double(teamSharks.count)))")
print("Dragons: \(Double(dragonsHeight / Double(teamDragons.count)))")
print("Raptors: \(Double(raptorsHeight / Double(teamRaptors.count)))")
print()





















































