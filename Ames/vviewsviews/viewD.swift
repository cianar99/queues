//
//  viewD.swift
//  Ames
//
//  Created by Ciana on 2/06/23.
//

//AMES-Achieve,Motivate,Excel,Succeed

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
                    Image("logo1")
                        .resizable()
                    
                        .frame(width:90,height:80)
                        .cornerRadius(15)
                    
                    
                }
            }
            .padding()
            
            Spacer()
            // Course image
            Image("first1")
                .resizable()
                .frame(width: 360,height: 530)
                .padding()
                .background(Color("blue"))
                .cornerRadius(15)
            
            Spacer()
            
            Button(action: {
               
            }, label: {
                Text("Let's Begin")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding()
                    .background(Color("blue"))
                    .cornerRadius(10)
                    .shadow(radius: 10)
            })

        }
       
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges : .all))
    }
  
        
    }
  
    
