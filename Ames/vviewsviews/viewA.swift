//
//  viewA.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct viewA: View {
    @State var currentDate : Date = Date()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 10){
                DatePicker(currentDate: $currentDate)
                
            }
            .padding(.vertical)
        }.safeAreaInset(edge: .bottom){
            
        
        HStack(spacing: 10) {
            Button(action: {
                // Action for "Create new" button
            }) {
                Text("Create new")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("blue"))
                    .clipShape(Capsule())
            }
            
            Button(action: {
                // Action for "Reminders" button
            }) {
                Text("Reminders")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("yellow"))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .foregroundColor(.white)
        
        
        /* HStack{
         Button(action: {
         }, label: {
         Text("Create new")
         .fontWeight(.bold)
         .padding(.vertical)
         .frame(maxWidth: .infinity)
         background(Color("blue"), in : Capsule())
         })
         Button(action: {
         }, label: {
         Text("Reminders")
         .fontWeight(.bold)
         .padding(.vertical)
         .frame(maxWidth: .infinity)
         background(Color("yellow"), in : Capsule())
         })
         }
         .padding(.horizontal)
         .padding(.top, 10)
         .foregroundColor(.white)*/
    }
    }
}

struct viewA_Previews: PreviewProvider {
    static var previews: some View {
        viewA()
    }
}
struct DatePicker: View{
    @Binding var currentDate : Date
    @State var currentMonth : Int = 0
    
    var body: some View {
        VStack(spacing: 15){
            
            let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            HStack(spacing: 15){
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        currentMonth -= 1
                    }
                }, label:{
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                })
                Button(action: {
                    withAnimation {
                        currentMonth += 1
                    }
                },label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(.black)
                })
                
                
            }.padding(.horizontal)
            HStack(spacing: 5){
                ForEach(days, id : \.self){
                    day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                }
            }
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(extractDate()){
                    value in
                CardView(value: value)
                        .background(Capsule()
                            .fill(Color("black"))
                        .padding(.horizontal,8)
                        .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1: 0 )).onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            VStack(spacing : 15){
                Text("create new")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
        if let task = tasks.first(where: {
                    task in
    return isSameDay(date1: task.remindDate, date2: currentDate)
        }){
            ForEach(task.remind){
                task in
                VStack(alignment:.leading, spacing: 10){
                    Text(task.time.addingTimeInterval(CGFloat.random(in:0...5000)),style: .time)
                    Text(task.title)
                        .font(.title2.bold())
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("blue").opacity(0.5).cornerRadius(10))
            }
           
            }else {
                Text("heyy! you got no reminders")
        }
                    
            }.padding()
        }
        .onChange(of: currentMonth){newValue in
            currentDate = getCurrentMonth()
        }
    }
        @ViewBuilder
        func CardView(value : DateValue)-> some View{
            VStack{
                if value.day != -1 {
                    if let task = tasks.first(where: {
                        task in
                        return isSameDay(date1: task.remindDate, date2: value.date)
                    }){
                        /*Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(isSameDay(date1: task.remindDate, date2: currentDate)? Color("primary"): .primary)
                            .frame(width: .infinity)*/
                        /*Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(isSameDay(date1: task.remindDate, date2: currentDate) ? .white : .primary)
                            .frame(width: .infinity)*/
                        Text("\(value.day)")
                                            .font(.title3.bold())
                                            .foregroundColor(isSameDay(date1: task.remindDate, date2: currentDate) ? Color("primary") : .primary)
                                            .frame(width: .infinity)

                        
                        Spacer()
                       /* Circle()
                            .fill(isSameDay(date1: task.remindDate, date2: currentDate)? , Color("black"))
                                .frame(width: 8, height: 8)*/
                        Circle()
                                           .fill(isSameDay(date1: task.remindDate, date2: currentDate) ? Color("black") : Color.clear)
                                           .frame(width: 8, height: 8)
                                  }
                    
                    else {
                                Text("\(value.day)")
    .font(.title3.bold())
                                      
    .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? Color("primary") : .primary)
.frame(width: .infinity)

                                  

                                      
                                    /*.foregroundColor(isSameDay(date1: task.remindDate, date2: currentDate)? .white)
                                    .frame(maxwidth: .infinity)*/
        Spacer()
        }
        }
}.padding(.vertical, 10 )
                .frame(height: 60, alignment: .top)
            
        
    }
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate()->[String]{
        let calendar = Calendar.current
        let month =  calendar.component(.month, from: currentDate)-1
        let year = calendar.component(.year, from: currentDate)
        return ["\(year)", calendar.monthSymbols[month]]
    }
    func getCurrentMonth()-> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to:Date())else {
            return Date()
        }
        return currentMonth
    }
    func extractDate()-> [DateValue]{
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDates().compactMap{
            date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days .first!.date)
        for _ in 0..<firstWeekday - 1 {
            days.insert (DateValue(day:-1, date: Date()), at: 0)
        }
        return days
    }
}
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

extension Date{
    func getAllDates()->[Date]{
        let calender = Calendar.current
        let startDate = calender.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        let range = calender.range(of: .day, in: .month, for: startDate)!
        return range.compactMap{
            day -> Date in
            return calender.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
