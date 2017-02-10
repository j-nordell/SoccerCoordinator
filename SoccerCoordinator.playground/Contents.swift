// Team Treehouse
// iOS Techdegree - Project 1
// Jennifer Nordell

import UIKit


/*************************************************************
    Section #1:  Implementation of Dictionary
*************************************************************/


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


/****************************************************************
    Section #2:  Implmentation of logic to assign
        players to teams based on height
        and experience levels
****************************************************************/


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


// Creation of constants to hold the number of players and number of teams

let numPlayers = players.count
let numTeams = 3


// Force a rounding up in case number of players is not equally divisible among teams

let maxPlayers = Int(ceil(Double(numPlayers) / Double(numTeams)))


// Creation of constants to store the number of experienced and inexperienced players

let experiencedPlayers = countExperiencedPlayers()
let inexperiencedPlayers = players.count - experiencedPlayers


// Sort players by height

let sortedPlayers = players.sorted {
    (($0 as [String: Any])[height] as? Double)! > (($1 )[height] as? Double)!
}


// Creation of variables to hold running totals of the heights of players assigned
// to the respective teams.

var sharksHeight = 0.0
var dragonsHeight = 0.0
var raptorsHeight = 0.0


// Function to determine if the team has reached its max for 
// the particular experience level of the player

func experiencedMax(currentPlayer: [String: Any], currentTeam: [[String: Any]]) -> Bool{
    var expCount = 0
    var inexperiencedCount = 0
    
    // Force rounding up in case number of players is not evenly divisible across teams
    let maxExperiencedPlayers = Int(ceil(Double(experiencedPlayers) / Double(numTeams)))
    let maxInexperiencedPlayers = Int(ceil(Double(inexperiencedPlayers) / Double(numTeams)))

    // Calculate how many experienced and inexperienced players are currently in the team
    for player in currentTeam {
        if(player[experience] as! Bool) {
            expCount += 1
        } else {
            inexperiencedCount += 1
        }
    }
    
    
    // Check to ensure that the max number of players for that experience level has not been reached.  Return false if max has not been reached
    
    return (inexperiencedCount == maxInexperiencedPlayers && !(currentPlayer[experience]! as! Bool)) || (expCount == maxExperiencedPlayers && currentPlayer[experience] as! Bool)
}


// Function to assign players into the optimal teams

func assignPlayers() {
    for player in sortedPlayers {
        if (sharksHeight <= dragonsHeight) && (sharksHeight <= raptorsHeight) && !experiencedMax(currentPlayer: player, currentTeam: teamSharks) && (teamSharks.count < maxPlayers) {
            teamSharks.append(player)
            sharksHeight += player[height] as! Double
        } else if (dragonsHeight <= raptorsHeight) && !experiencedMax(currentPlayer: player, currentTeam: teamDragons) && (teamDragons.count < maxPlayers) {
            teamDragons.append(player)
            dragonsHeight += player[height] as! Double
        } else {
            teamRaptors.append(player)
            raptorsHeight += player[height] as! Double
        }
    }
}


/************************************************************************
    Section #3:  Implementation of collection of letters
        and display of letters and the 
        average heights of the teams
************************************************************************/


// Creation of collection to hold letters to guardians/parents,

var letters: [String] = []


// Creation of constants to hold practice dates and times for teams

let sharksDate = "March 17"
let sharksTime = "3pm"

let dragonsDate = "March 17"
let dragonsTime = "1pm"

let raptorsDate = "March 18"
let raptorsTime = "1pm"


// Function to add the correct number of spaces

func addSpaces(numSpaces: Int) -> String {
    var spaces = ""
    for _ in 1...numSpaces - 1 {
        spaces += " "
    }
    return spaces
}


// Constants for values used in multiple functions

let letterWidth = 120
let padding = 20
let leftMargin = "|    "
let rightMargin = "|"
let blankLine = "\(leftMargin)\(addSpaces(numSpaces: letterWidth - leftMargin.characters.count))\(rightMargin)\n"


// Function to add a letter to the letters collection

func addLetters() {
    var letterString = ""
    
    for player in teamSharks {
        letterString += writeLetter(currentPlayer: player, teamName: "Sharks")
        letters.append(letterString)
        letterString = ""
    }
    
    for player in teamDragons {
        letterString += writeLetter(currentPlayer: player, teamName: "Dragons")
        letters.append(letterString)
        letterString = ""
    }
    
    for player in teamRaptors {
        letterString += writeLetter(currentPlayer: player, teamName: "Raptors")
        letters.append(letterString)
        letterString = ""
    }
    
}


// Function to piece together the letter and divided up to be more modular

func writeLetter(currentPlayer: [String: Any], teamName: String) -> String {
    var letterContent = ""
    
    letterContent += writeLetterHeader(currentPlayer: currentPlayer, teamName: teamName)
    letterContent += writeLetterGreeting(currentPlayer: currentPlayer)
    letterContent += writeLetterBody(teamName: teamName)
    letterContent += writeLetterSignature()
    
    return letterContent
}


// Function to format the header of the letter

func writeLetterHeader(currentPlayer: [String: Any], teamName: String ) -> String {
    var headerContent = ""
    let playerColumn = "Player:"
    let teamColumn = "Team:"
    let dateColumn = "Practice date:"
    let timeColumn = "Practice time:"
    let playerHeading = "\(leftMargin)\(playerColumn)\(addSpaces(numSpaces: padding))\(teamColumn)\(addSpaces(numSpaces: padding))\(dateColumn)\(addSpaces(numSpaces: padding))\(timeColumn)"
    let currentPlayerLength = (currentPlayer[name] as! String).characters.count
    let teamLength = teamName.characters.count
    let teamDate = getDateForTeam(team: teamName)
    let teamTime = getTimeForTeam(team: teamName)
    
    headerContent += drawBorder()
    headerContent += blankLine
    headerContent += playerHeading
    headerContent += "\(addSpaces(numSpaces: letterWidth - playerHeading.characters.count))\(rightMargin)\n"
    headerContent += "\(leftMargin)\(currentPlayer[name]!)"
    headerContent += "\(addSpaces(numSpaces: padding + playerColumn.characters.count - currentPlayerLength))\(teamName)"
    headerContent += "\(addSpaces(numSpaces: padding + teamColumn.characters.count - teamLength))\(teamDate)"
    headerContent += "\(addSpaces(numSpaces: padding + dateColumn.characters.count - teamDate.characters.count))\(teamTime)"
    headerContent += "\(addSpaces(numSpaces: (letterWidth - playerHeading.characters.count) + timeColumn.characters.count - teamTime.characters.count))\(rightMargin)\n"
    headerContent += blankLine
    
    return headerContent
}


// Function to format the greeting of the letter

func writeLetterGreeting(currentPlayer: [String: Any]) -> String {
    var greetingString = ""
    let greeting = "Dear \(currentPlayer[guardians] as! String),"
    
    greetingString += blankLine
    greetingString += "\(leftMargin)\(greeting)\(addSpaces(numSpaces: letterWidth - leftMargin.characters.count - greeting.characters.count))\(rightMargin)\n"
    greetingString += blankLine
    
    return greetingString
}


// Function to format the body of the letter

func writeLetterBody(teamName: String) -> String {
    var letterBody = ""
    let teamDate = getDateForTeam(team: teamName)
    let teamTime = getTimeForTeam(team: teamName)
    let firstLine = "\(leftMargin)We welcome you and your child to a new season of soccer!  Your child has been assigned to the \(teamName) team."
    let secondLine = "\(leftMargin)The first practice will be held on \(teamDate) at \(teamTime).  We look forward to seeing you all at practice!"
    
    letterBody += "\(firstLine)\(addSpaces(numSpaces: letterWidth - firstLine.characters.count))\(rightMargin)\n"
    letterBody += "\(secondLine)\(addSpaces(numSpaces: letterWidth - secondLine.characters.count))\(rightMargin)\n"
    letterBody += blankLine
    
    return letterBody
}


// Function to write the signature of the letter and bottom border

func writeLetterSignature() -> String {
    var signatureString = ""
    let signOff = "\(leftMargin)All the best,"
    let signature = "\(leftMargin)The coaches"
    
    signatureString += "\(signOff)\(addSpaces(numSpaces: letterWidth - signOff.characters.count))\(rightMargin)\n"
    signatureString += blankLine
    signatureString += "\(signature)\(addSpaces(numSpaces: letterWidth - signature.characters.count))\(rightMargin)\n"
    signatureString += blankLine
    signatureString += drawBorder()
    
    return signatureString
}


// Function to print averge heights of teams

func printAverages() {
    var averageString = ""
    let title = "Average Height per Team in Inches"
    let firstLine = "\(leftMargin)\(addSpaces(numSpaces: (letterWidth - title.characters.count - leftMargin.characters.count)/2))\(title)"
    let sharksAverage = "\(leftMargin)Sharks:   \(sharksHeight / Double(teamSharks.count))"
    let dragonsAverage = "\(leftMargin)Dragons:  \(dragonsHeight / Double(teamDragons.count))"
    let raptorsAverage = "\(leftMargin)Raptors:  \(raptorsHeight / Double(teamRaptors.count))"
    
    averageString += drawBorder()
    averageString += blankLine
    averageString += firstLine
    averageString += "\(addSpaces(numSpaces: letterWidth - firstLine.characters.count))\(rightMargin)\n"
    averageString += blankLine
    averageString += "\(sharksAverage)\(addSpaces(numSpaces: letterWidth - sharksAverage.characters.count))\(rightMargin)\n"
    averageString += "\(dragonsAverage)\(addSpaces(numSpaces: letterWidth - dragonsAverage.characters.count))\(rightMargin)\n"
    averageString += "\(raptorsAverage)\(addSpaces(numSpaces: letterWidth - raptorsAverage.characters.count))\(rightMargin)\n"
    averageString += blankLine
    averageString += drawBorder()
    
    print(averageString)
}


//  Function to draw a border on the letters and averages table

func drawBorder() -> String {
    var border = ""
    for _ in 1...letterWidth {
        border += "="
    }
    border += "\n"
    return border
}


// Function to return a string containing the practice date based on the team sent in

func getDateForTeam(team: String) -> String {
    switch team {
        case "Sharks":
            return sharksDate
        case "Dragons":
            return dragonsDate
        case "Raptors":
            return raptorsDate
        default:
            return "Unknown"
    }
}


// Function to return a string containing the practice time based on the team sent in

func getTimeForTeam(team: String) -> String {
    switch team {
    case "Sharks":
        return sharksTime
    case "Dragons":
        return dragonsTime
    case "Raptors":
        return raptorsTime
    default:
        return "Unknown"
    }
}


/****************************************************************
    Section #4:  Call the functions to produce results
****************************************************************/


// Call function to assign players to the teams

assignPlayers()


// Print the average heights of the teams

printAverages()


// Add the letters to the collection for the respective teams

addLetters()


// Print all the letters for all teams

for letter in letters {
    print(letter)
}


















































