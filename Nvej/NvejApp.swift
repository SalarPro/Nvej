//
//  NvejApp.swift
//  Nvej
//
//  Created by Salar Pro on 9/19/22.
//

import SwiftUI


let db = DataBaseHelper()

@main
struct NvejApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {


        db.insert(prayTimeDate: PrayTimeDate(month: 9, day: 19, fajir: Date(), shroq: Date(), duhr: Date(), asr: Date(), maghrab: Date(), ishaa: Date()))
        db.insert(prayTimeDate: PrayTimeDate(month: 9, day: 20, fajir: Date(), shroq: Date(), duhr: Date(), asr: Date(), maghrab: Date(), ishaa: Date()))
        db.insert(prayTimeDate: PrayTimeDate(month: 9, day: 21, fajir: Date(), shroq: Date(), duhr: Date(), asr: Date(), maghrab: Date(), ishaa: Date()))
        db.insert(prayTimeDate: PrayTimeDate(month: 9, day: 22, fajir: Date(), shroq: Date(), duhr: Date(), asr: Date(), maghrab: Date(), ishaa: Date()))
        db.insert(prayTimeDate: PrayTimeDate(month: 9, day: 23, fajir: Date(), shroq: Date(), duhr: Date(), asr: Date(), maghrab: Date(), ishaa: Date()))
        
        
//        readJSonData()
        
       // db.insert(month: "2", day: "3", fajir: "12:11", shroq: "12:11", duhr: "12:11", asr: "12:11", maghrab: "12:11", ishaa: "12:11")
//        _ = db.read()

//        db.deleteAll()
//
//        //insert all data to database
//        for pTime in prayerArr {
//            db.insert(month: pTime.month, day: pTime.day, fajir: pTime.fajir.toString("hh:mm"), shroq: pTime.shroq.toString("hh:mm"), duhr: pTime.duhr.toString("hh:mm"), asr: pTime.asr.toString("hh:mm"), maghrab: pTime.maghrab.toString("hh:mm"), ishaa: pTime.ishaa.toString("hh:mm"))
//        }
        
        
        
    }
}

/*
var prayerArr = [PrayTimeDate]()

func readJSonData()  {
    //read json from assets
    guard let path = Bundle.main.path(forResource: "prayData2", ofType: "json")
    else {return}
    let url = URL(fileURLWithPath: path)
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        do {
            let jsonPrayerArr = try decoder.decode([PrayTime].self, from: data)
            prayerArr.removeAll()
            jsonPrayerArr.forEach { pTime in
                let praTime = PrayTimeDate(
                    month: pTime.month,
                    day: pTime.day,
                    
                    fajir: prayStringToTime(pTime.fajir),
                                           shroq: prayStringToTime(pTime.shroq),
                                           duhr: prayStringToTime(pTime.duhr),
                                           asr: prayStringToTime(pTime.asr),
                                           maghrab: prayStringToTime(pTime.maghrab),
                                           ishaa: prayStringToTime(pTime.ishaa))
                
                prayerArr.append(praTime)
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
    } catch {
        print(error)
    }
}

struct PrayTime : Codable {
    var month: String
    var day: String
    var fajir:String
    var shroq:String
    var duhr:String
    var asr:String
    var maghrab:String
    var ishaa:String
}



func prayStringToTime(_ prayString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let date = dateFormatter.date(from: prayString)
    return date!
}

func todayPrayTime() -> PrayTimeDate {
    let date = Date()//.nextDate()
    let month = Calendar.current.component(.month, from: date)
    let day = Calendar.current.component(.day, from: date)
    
    if(prayerArr.count == 0) {
        return PrayTimeDate(month: "", day: "", fajir: date, shroq: date, duhr: date, asr: date, maghrab: date, ishaa: date)
    }
    
    let praies = prayerArr.filter { $0.month == String(month) && $0.day == String(day) }
    if(praies.count == 0) {
        return PrayTimeDate(month: "", day: "", fajir: date, shroq: date, duhr: date, asr: date, maghrab: date, ishaa: date)
    }
    return praies.first!
    
}

func getPray(for prayTime: PrayerTime) -> String {
    
    
    let date = Date().nextDate()
    
    let month = Calendar.current.component(.month, from: date)
    let day = Calendar.current.component(.day, from: date)
    
    var rValue = Date()
    
    if(prayerArr.count == 0) {
        return rValue.toString("h")
    }
    
    let praies = prayerArr.filter { $0.month == String(month) && $0.day == String(day) }
    if(praies.count == 0) {
       return rValue.toString("h")
    }
    
    let pray = praies[0]
    
    
    switch prayTime {
    case .fajir:
        rValue =  pray.fajir
    case .shroq:
        rValue =  pray.shroq
    case .duhr:
        rValue =  pray.duhr
    case .asr:
        rValue =  pray.asr
    case .maghrab:
        rValue =  pray.maghrab
    case .ishaa:
        rValue =  pray.ishaa
    }
    
    return rValue.toString("h:m")
    
    
    
}

enum PrayerTime: String {
    case fajir = "fajir"
    case shroq = "shroq"
    case duhr = "duhr"
    case asr = "asr"
    case maghrab = "maghrab"
    case ishaa = "ishaa"
}

*/

struct PrayTimeDate {
    var month: Int
    var day: Int
    var fajir:Date
    var shroq:Date
    var duhr:Date
    var asr:Date
    var maghrab:Date
    var ishaa:Date
    
    var spede : String {
        return fajir.timeIn12HourFormat()
    }
    var rojHalat : String {
        return shroq.timeIn12HourFormat()
    }
    var nivro : String {
        return duhr.timeIn12HourFormat()
    }
    var evary : String {
        return asr.timeIn12HourFormat()
    }
    var magrab : String {
        return maghrab.timeIn12HourFormat()
    }
    var aysha : String {
        return ishaa.timeIn12HourFormat()
    }
    
}
