//
//  DatabaseHelper.swift
//  Nvej
//
//  Created by Salar Pro on 9/22/22.
//

import Foundation
import SQLite3

class DataBaseHelper {
    
    init() {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "Nvej.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer? {
        // The database file is in the application bundle.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        
        // Open the database.
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                    "in the Getting Started section.")
            return nil
        }
    }

    
    func createTable() {
        let createTableString = "Create Table if not exists PrayTime(month INTEGER, day INTEGER, fajir TIME, shroq TIME, duhr TIME, asr TIME, maghrab TIME, ishaa TIME);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("PrayTime table created.")
            } else {
                print("PrayTime table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(prayTimeDate: PrayTimeDate) {
        let insertStatementString = "INSERT INTO PrayTime (month, day, fajir, shroq, duhr, asr, maghrab, ishaa) VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(prayTimeDate.month))
            sqlite3_bind_int(insertStatement, 2, Int32(prayTimeDate.day))
            sqlite3_bind_text(insertStatement, 3, (prayTimeDate.fajir.toString("hh:mm") as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (prayTimeDate.shroq.toString("hh:mm") as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (prayTimeDate.duhr.toString("hh:mm") as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (prayTimeDate.asr.toString("hh:mm") as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, (prayTimeDate.maghrab.toString("hh:mm") as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 8, (prayTimeDate.ishaa.toString("hh:mm") as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    

    func read() -> [PrayTimeDate] {
        let queryStatementString = "SELECT * FROM PrayTime;"
        var queryStatement: OpaquePointer? = nil
        var psns : [PrayTimeDate] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let month = sqlite3_column_int(queryStatement, 0)
                let day = sqlite3_column_int(queryStatement, 1)
                let fajir = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let shroq = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let duhr = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let asr = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let maghrab = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let ishaa = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                
                psns.append(PrayTimeDate(month: Int(month), day: Int(day), fajir: Date(fajir, strategy: .custom("hh:mm")), shroq: Date(shroq, strategy: .custom("hh:mm")), duhr: Date(duhr, strategy: .custom("hh:mm")), asr: Date(asr, strategy: .custom("hh:mm")), maghrab: Date(maghrab, strategy: .custom("hh:mm")), ishaa: Date(ishaa, strategy: .custom("hh:mm"))))
                print("Query Result:")
                print("\(month) | \(day) | \(fajir) | \(shroq) | \(duhr) | \(asr) | \(maghrab) | \(ishaa)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }

    func today() -> PrayTimeDate {
        let queryStatementString = "SELECT * FROM PrayTime WHERE month = \(Date().month) AND day = \(Date().day);"
        var queryStatement: OpaquePointer? = nil
        var psns : [PrayTimeDate] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let month = sqlite3_column_int(queryStatement, 0)
                let day = sqlite3_column_int(queryStatement, 1)
                let fajir = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let shroq = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let duhr = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let asr = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let maghrab = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let ishaa = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                
                psns.append(PrayTimeDate(month: Int(month), day: Int(day), fajir: Date(fajir), shroq: Date(fromString: shroq), duhr: Date(fromString: duhr), asr: Date(fromString: asr), maghrab: Date(fromString: maghrab), ishaa: Date(fromString: ishaa)))
                print("Query Result:")
                print("\(month) | \(day) | \(fajir) | \(shroq) | \(duhr) | \(asr) | \(maghrab) | \(ishaa)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns[0]
    }

    func deleteAll() {
        let deleteStatementStirng = "DELETE FROM PrayTime;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted all rows.")
            } else {
                print("Could not delete all rows.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }

    func delete(month: String, day: String) {
        let deleteStatementStirng = "DELETE FROM PrayTime WHERE Month = ? AND Day = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(deleteStatement, 1, (month as NSString).utf8String, -1, nil)
            sqlite3_bind_text(deleteStatement, 2, (day as NSString).utf8String, -1, nil)
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }

}
