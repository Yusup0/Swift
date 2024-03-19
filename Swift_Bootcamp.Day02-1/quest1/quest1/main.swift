//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 26.12.2023.
//

import Foundation

enum  Activity {
    case IT
    case Banking
    case PublicServices
}

enum Profession {
    case Developer
    case QA
    case ProjectManager
    case Analyst
    case Designer
}

enum Level : Int {
    case Junior
    case Middle
    case Senior
}

struct Company {
    var name: String
    var activity: Activity
    var description: String?
    var job_openings: [Vacancy]
    var contacts: String
    func Interview(_ index: Int, _ candidate: Candidate) -> Bool {
        let count = Double(job_openings[index].skills.intersection(candidate.skills).count)
        let half = (Double(job_openings[index].skills.count) / 2.0).rounded(.up)
        if count >= half && Bool.random() {
            return true
        }
        return false
    }
    init(_ name: String, _ activity: Activity, _ contacts: String, _ job_openings: [Vacancy]) {
        self.name = name
        self.activity = activity
        self.contacts = contacts
        self.job_openings = job_openings
    }
}

struct Candidate {
    let name: String
    let profession: Profession
    let level: Level
    let salary: Int
    let skills: Set<String>
    init(_ name: String, _ profession: Profession, _ level: Level, _ salary: Int, _ skills: Set<String>) {
        self.name = name
        self.profession = profession
        self.level = level
        self.salary = salary
        self.skills = skills
    }
}

struct Vacancy {
    var profession: Profession
    var level: Level
    var salary: Int
    var skills: Set<String>
    init(_ profession: Profession, _ level: Level, _ salary: Int, _ skills: Set<String>) {
        self.profession = profession
        self.level = level
        self.salary = salary
        self.skills = skills
    }
}

func main() {
    let me = Candidate("Usup", Profession.Developer, Level.Junior, 80000, ["swift", "sql", "Bash", "Git", "С++", "QT", "ООП", "python", "Linux", "STL", "iOS", "Xcode"])
    
    var company = [Company]()
    
    var yandex_vacancy = [Vacancy]()
    yandex_vacancy.append(Vacancy(Profession.Developer, Level.Junior, 120000, ["swift", "sql", "Bash", "Git", "CocoaPods"]))
    yandex_vacancy.append(Vacancy(Profession.Designer, Level.Junior, 90000, ["Adobe Photoshop", "SketchUp", "Adobe Illustrator"]))
    company.append(Company("Yandex", Activity.IT, "job@yandex-team.ru", yandex_vacancy))
    
    var leg_vacancy = [Vacancy]()
    leg_vacancy.append(Vacancy(Profession.QA, Level.Middle, 160000, ["Atlassian Jira", "Scrum", "Swagger"]))
    company.append(Company("ООО Легалтэк", Activity.IT, "LEGALHELP@yandex.ru", leg_vacancy))
    
    var dom_vacancy = [Vacancy]()
    dom_vacancy.append(Vacancy(Profession.ProjectManager, Level.Senior, 230000, ["Agile", "Jira", "Confluence"]))
    company.append(Company("ДОМ.РФ", Activity.Banking, "DOMRF@yandex.ru", dom_vacancy))
    
    
    var tochka_vacancy = [Vacancy]()
    tochka_vacancy.append(Vacancy(Profession.Analyst, Level.Junior, 80000, ["Data Mining: SPSS", "PowerPoint", "excel"]))
    tochka_vacancy.append(Vacancy(Profession.Developer, Level.Middle, 180000, ["SIP", "VoIP", "Atlassian Jira", "С++"]))
    tochka_vacancy.append(Vacancy(Profession.Developer, Level.Junior, 90000, ["SIP", "VoIP", "Atlassian Jira", "С++"]))
    company.append(Company("Точка Роста", Activity.PublicServices, "office@tochkarosta.ru", tochka_vacancy))
    
    var sber_vacancy = [Vacancy]()
    sber_vacancy.append(Vacancy(Profession.Developer, Level.Junior, 100000, ["С++", "sql", "QT", "Git"]))
    sber_vacancy.append(Vacancy(Profession.Developer, Level.Junior, 130000, ["swift", "iOS", "Xcode", "Git"]))
    company.append(Company("Сбер", Activity.IT, "sber@yandex.ru", sber_vacancy))
    
    
    var my_vacancies = [Int : (Company, Vacancy, Int)]()
    var i = 1
    for firm in company {
        for (index, vacancy) in firm.job_openings.enumerated() {
            if (vacancy.profession == me.profession && me.salary <= vacancy.salary && me.level.rawValue >= vacancy.level.rawValue) {
                my_vacancies[i] = (firm, vacancy, index)
                i += 1
            }
        }
    }
    
    print("\(me.profession). \(me.level). >= \(me.salary)\n")
    for i in my_vacancies.sorted(by: {$0.key < $1.key}) {
        print("\(i.key).")
        print("\(i.value.1.level) \(i.value.1.profession)      ---    >= \(i.value.1.salary)")
        print("\(i.value.0.name)\n\(i.value.0.activity)\n\(i.value.1.skills)\n-----------------------\n")
    }
    
    if (!my_vacancies.isEmpty) {
        while true {
            if let decision = readLine(), let number = Int(decision), let vac = my_vacancies[number] {
                print("Processing Interview...")
                if vac.0.Interview(vac.2, me) {
                    print("Success, candidate was applied.")
                } else {
                    print("Failure , the candidate was expelled")
                }
                break
            } else {
                print("It doesn't look like a correct input.")
            }
        }
    }
        
}
    

main()



