//
//  Repository.swift
//  iOSToDoApp
//
//  Created by Cong on 6/5/17.
//  Copyright © 2017 apple. All rights reserved.
//
/*
import Foundation
import RealmSwift

/**
 Base repository with 4 basic action: GetAll, Add, Delete, Update (CRUD)
 To using, just create a repo for a specific object type.
 */
class Repository<T: Object> {
    let TAG = "Realm Error with operation: "
    var realm: Realm
    init() {
        realm = try! Realm()
    }

    func getAll() -> Results<T> {
        return realm.objects(T.self)
    }

    open func add(_ t: T) -> Bool {
        do {
            try realm.write {
                realm.add(t)
            }
            return true
        } catch {
            print("\(TAG) add(\(t))")
            return false
        }
    }

    open func delete(_ t: T) -> Bool {
        do {
            try realm.write {
                realm.delete(t)
            }
            return true
        } catch {
            print("\(TAG) delete(\(t))")
            return false
        }
    }

    open func update(_ t: T) -> Bool {
        do {
            try realm.write {
                realm.add(t, update: true)
            }
            return true
        } catch {
            print("\(TAG) update(\(t))")
            return false
        }
    }
}
*/
