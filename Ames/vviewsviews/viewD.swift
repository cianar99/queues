//
//  viewD.swift
//  Ames
//
//  Created by Ciana on 12/05/23.
//

import SwiftUI

struct viewD: View {
   
    var body: some View {
     
        Home()
        
                }
            }
    
    

struct viewD_Previews: PreviewProvider {
    static var previews: some View {
        viewD()
    }
}
struct Home : View{
    var body : some View{
        VStack{
            
            HStack{                            VStack(alignment:.leading, spacing:10){
                Text("AMES")
                    .font(.title)
                    .fontWeight(.bold)
                Text("building focus and concentration!!")
            }.foregroundColor(.black)
                Spacer(minLength: 0)
                
                Button(action:{}){
                    Image("logo")
                        .resizable()
                    
                        .frame(width:80,height:80)
                        .cornerRadius(15)
                    
                    
                }
            }
            .padding()
            
            Spacer()
            // Course image
            Image("first1")
                .resizable()
                .frame(width: 320,height: 500)
                .padding()
                .background(Color.black)
                .cornerRadius(15)
            
            Spacer()
            
            Button(action: {
               
            }, label: {
                Text("Lesssgooooo")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            })

        }
       
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges : .all))
    }
  
        
    }
  
    

struct CourseCardView : View{
    var course : Course
    
    var body: some View{
        VStack{
           

            Image(course.asset)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top,10)
                .padding(.leading,10)
                .background(Color(course.asset))
            HStack{
                VStack(alignment:.leading, spacing: 10){
                    Text("lets start")
                        .fontWeight(.bold)
                    
                }
            }
        }
        .background(Color.black)
        .cornerRadius(15)
    }
}

struct Course : Identifiable{
    var id = UUID().uuidString
    var name : String
    var numCourse: Int
    var asset: String
}
var courses = [
    Course(name:"Lets get started", numCourse: 13, asset: "first1")
]

