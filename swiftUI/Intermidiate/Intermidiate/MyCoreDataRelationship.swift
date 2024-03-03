//
//  MyCoreDataRelationship.swift
//  Intermidiate
//
//  Created by Gaurav Sara on 03/03/24.
//

import SwiftUI
import CoreData

/*
    3 entities
    1. BusinessEntity
    2. DepartmentEntity
    3. EmployeeEntitiy
*/

class CoreDataManager {
    
    static let instance = CoreDataManager() // Singleton
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error {
                print("Error loading core data: \(error.localizedDescription)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved Successfully")
        } catch let error {
            print("Error saving core data: \(error.localizedDescription)")
        }
    }
}

class CoreDataRelationshipViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    /// <#Description#>
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        
//        let filter = NSPredicate(format: "name == %@", "Apple")
//        request.predicate = filter
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getEmployees(forBusiness business: BusinessEntity) {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        let filter = NSPredicate(format: "business == %@", business)
        request.predicate = filter
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func updateBusiness() {
        let existingBusiness = businesses[2]
        existingBusiness.addToDepartments(departments[1])
        save()
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Facebook"
        
        // Add existing departments to the new business
//        newBusiness.departments = [departments[0], departments[1]]
        
        // Add existing employees to the new business
//        newBusiness.employees = [employees[1]]
        
        // Add new business to the existing departments
//        newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        // Add new business to existing employee
//        newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        save()
    }
    
    func addDeparment() {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "Finance"
        newDepartment.businesses = [businesses[0], businesses[1], businesses[2]]
        
//        newDepartment.employees = [employees[1]]
        // or
        newDepartment.addToEmployees(employees[1])
        save()
    }
    
    func deleteDepartment() {
        let deparment = departments[1]
        manager.context.delete(deparment)
        save()
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.name = "Gaurav"
        newEmployee.age = 30
        newEmployee.dateJoined = Date()
        
        newEmployee.business = businesses[2]
        newEmployee.department  = departments[1]
        save()
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
        
    }
}

struct MyCoreDataRelationship: View {
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        vm.deleteDepartment()
                    }, label: {
                        Text("Perform Action")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                    .bold()
                
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses:")
                    .bold()
                
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "")")
                .bold()
            Text("Age: \(entity.age)")
            Text("Date of Joining: \(entity.dateJoined ?? Date())")
            
            Text("Businesses:")
                .bold()
            Text(entity.business?.name ?? "")

            Text("Department")
                .bold()
            Text(entity.department?.name ?? "")
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}


#Preview {
    MyCoreDataRelationship()
}
