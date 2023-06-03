//
//  Chatbot.swift
//  Ames
//
//  Created by Ciana on 03/06/23.
//

import SwiftUI

struct Chatbot: View {
    @State private var userInput: String = ""
    @State private var chatHistory: [String] = []
    
    private let greeting = ""
    
    private let responses: [String: String] = [
        "What is the periodic table": "The periodic table is a tabular arrangement of chemical elements, organized based on their atomic number, electron configuration, and recurring chemical properties.",
               "Who created the periodic table": "The periodic table was primarily developed by Dmitri Mendeleev, a Russian chemist, in 1869.",
               "How many elements are there in the periodic table": "Currently, there are 118 known elements in the periodic table.",
               "What is the atomic number of an element": "The atomic number of an element represents the number of protons in the nucleus of an atom of that element.",
               "What is an element's symbol on the periodic table": "An element's symbol is a one- or two-letter abbreviation used to represent the element.",
               "What is a period in the periodic table": "A period is a horizontal row in the periodic table. There are seven periods in total.",
               "What is a group in the periodic table": "A group is a vertical column in the periodic table. There are 18 groups in total.",
               "what are the elements in group 1 of the periodic table called": "The elements in Group 1 are called alkali metals.",
               "what are the elements in group 17 of the periodic table called": "The elements in Group 17 are called halogens.",
               "what are the elements in group 18 of the periodic table called": "The elements in Group 18 are called noble gases.",
               "which element has the symbol fe": "The element with the symbol Fe is iron.",
               "which element has the symbol au": "The element with the symbol Au is gold.",
               "which element has the symbol pb": "The element with the symbol Pb is lead.",
               "what is a transition metal": "Transition metals are elements that have partially filled d orbitals. They are located in the center of the periodic table.",
               "What are isotopes": "Isotopes are variants of an element that have the same number of protons but different numbers of neutrons in their nuclei.",
               "what is the most abundant element in the earth's crust": "The most abundant element in the Earth's crust is oxygen.",
               "which element is a liquid at room temperature": "The element that is a liquid at room temperature is mercury (Hg).",
               "what is the lightest element": "The lightest element is hydrogen.",
               "which element is essential for human bone structure": "The element that is essential for human bone structure is calcium.",
               "which element is used to make computer chips": "The element used to make computer chips is silicon.",
               "which element is responsible for the red color in rubies": "The element responsible for the red color in rubies is chromium.",
               "which element is the most abundant in the universe": "The most abundant element in the universe is hydrogen.",
               "which element is commonly used in batteries": "The element commonly used in batteries is lithium.",
               "what is the chemical symbol for silver": "The chemical symbol for silver is Ag.",
               "which element is a main component of the earth's atmosphere": "The main component of the Earth's atmosphere is nitrogen.",
               "which element is used to produce stainless steel": "The element used to produce stainless steel is chromium.",
               "what is the symbol for the radioactive element uranium": "The symbol for uranium is U.",
               "which element is essential for the formation of organic molecules": "The element essential for the formation of organic molecules is carbon.",
               "which element is commonly used in light bulbs": "The element commonly used in light bulbs is tungsten.",
               "What is organic chemistry?": "Organic chemistry is the branch of chemistry that deals with the study of compounds containing carbon atoms, their properties, structure, composition, reactions, and synthesis.",
               "How many valence electrons does carbon have?": "Carbon has four valence electrons.",
               "What is the hybridization of carbon in methane (CH4)?": "Carbon in methane is sp3 hybridized.",
               "What is the difference between an alkane and an alkene?": "Alkanes are hydrocarbons with only single bonds, while alkenes are hydrocarbons with at least one carbon-carbon double bond.",
               "What is an aromatic compound?": "Aromatic compounds are organic compounds that contain a benzene ring or other ring structures with similar stability and reactivity.",
               "What is a functional group?": "A functional group is a specific group of atoms within a molecule that gives the molecule its characteristic chemical properties and reactions.",
               "What is the functional group of alcohols?": "The functional group of alcohols is the hydroxyl group (-OH).",
               "What is an isomer?": "Isomers are compounds that have the same molecular formula but different structural arrangements or spatial orientations.",
               "What is the IUPAC nomenclature?": "The IUPAC (International Union of Pure and Applied Chemistry) nomenclature is a set of rules used to name organic compounds systematically.",
               "What is a chiral molecule?": "A chiral molecule is a molecule that is not superimposable on its mirror image, meaning it exists in two non-identical forms known as enantiomers.",
               "What is a condensation reaction?": "A condensation reaction is a chemical reaction in which two molecules combine, resulting in the loss of a smaller molecule, such as water.",
               "What is a polymer?": "A polymer is a large molecule composed of repeating subunits called monomers. Polymers can be natural or synthetic.",
               "What is the process of hydrogenation?": "Hydrogenation is a chemical reaction in which hydrogen gas is added to an unsaturated compound, typically an alkene or alkyne, to form a saturated compound.",
               "What is the concept of resonance in organic chemistry?": "Resonance is a phenomenon in which the electrons in a molecule are delocalized over multiple atoms or bonds, leading to the stabilization of the molecule.",
               "What is a protecting group in organic synthesis?": "A protecting group is a functional group temporarily added to a molecule to prevent undesired reactions or protect a reactive group during a chemical transformation.",
               "What is the difference between a primary, secondary, and tertiary carbon atom?": "A primary carbon atom is bonded to one other carbon atom, a secondary carbon atom is bonded to two other carbon atoms, and a tertiary carbon atom is bonded to three other carbon atoms.",
               "What is the mechanism of an SN1 reaction?": "An SN1 (substitution nucleophilic unimolecular) reaction involves a two-step mechanism, where the leaving group leaves first, creating a carbocation intermediate, followed by the attack of a nucleophile.",
               "What is the purpose of a catalyst in a chemical reaction?": "A catalyst is a substance that increases the rate of a chemical reaction by lowering the activation energy, without being consumed in the reaction.",
               "What is the study of physics?": "Physics is the scientific study of matter, energy, and the interactions between them.",
               "What is the fundamental unit of electric charge?": "The fundamental unit of electric charge is the elementary charge, represented by the symbol 'e' and approximately equal to 1.602 x 10^-19 coulombs.",
               "What is Newton's first law of motion?": "Newton's first law of motion states that an object at rest will stay at rest, and an object in motion will stay in motion with the same speed and direction unless acted upon by an external force.",
               "What is the formula for calculating speed?": "Speed is calculated by dividing the distance traveled by the time taken. The formula is speed = distance/time.",
               "What is the equation for calculating force?": "Force (F) is equal to the product of mass (m) and acceleration (a). The equation is F = ma.",
               "What is the law of conservation of energy?": "The law of conservation of energy states that energy cannot be created or destroyed but can only be converted from one form to another or transferred between objects.",
               "w": "Speed refers to how fast an object is moving, while velocity refers to the speed of an object in a particular direction.",
               "What is the formula for calculating kinetic energy?": "The formula for calculating kinetic energy is KE = (1/2)mv^2, where KE represents kinetic energy, m is the mass of the object, and v is its velocity.",
               "What is the relationship between force, mass, and acceleration (Newton's second law of motion)?": "Newton's second law of motion states that force is equal to the product of mass and acceleration. The equation is F = ma.",
               "What is the formula for calculating gravitational force?": "The formula for calculating gravitational force is F = (G * m1 * m2) / r^2, where F represents the gravitational force, G is the gravitational constant, m1 and m2 are the masses of the two objects, and r is the distance between their centers of mass.",
               "What is the concept of inertia?": "Inertia is the tendency of an object to resist changes in its state of motion. It is related to an object's mass.",
               "What is the relationship between voltage, current, and resistance (Ohm's law)?": "Ohm's law states that voltage (V) is equal to the product of current (I) and resistance (R). The equation is V = IR.",
               "What is the theory of relativity?": "The theory of relativity, proposed by Albert Einstein, describes the relationship between space, time, and gravity. It includes the special theory of relativity and the general theory of relativity.",
               "What is the difference between renewable and non-renewable sources of energy?": "Renewable energy sources can be replenished naturally, such as solar power and wind energy, while non-renewable sources, like fossil fuels, cannot be replenished on a human timescale.",
               "What is the principle of conservation of momentum?": "The principle of conservation of momentum states that the total momentum of a closed system remains constant if no external forces act on it.",
               "What is the concept of wave-particle duality?": "Wave-particle duality is the idea that particles, such as electrons and photons, can exhibit both wave-like and particle-like properties depending on how they are observed.",
               "What is the principle of superposition in wave mechanics?": "The principle of superposition states that when two or more waves overlap, the resulting displacement at any point is the sum of the individual displacements.",
               "What is the difference between potential energy and kinetic energy?": "Potential energy is the stored energy of an object based on its position or configuration, while kinetic energy is the energy of an object in motion.",
               "What is the relationship between frequency and wavelength in a wave?": "The frequency of a wave is inversely proportional to its wavelength. As the frequency increases, the wavelength decreases, and vice versa.",
               "What is the law of reflection?": "The law of reflection states that the angle of incidence is equal to the angle of reflection when a wave, such as light or sound, encounters a reflecting surface.",
               "What is the difference between a conductor and an insulator?": "A conductor is a material that allows the flow of electric charge, while an insulator is a material that restricts the flow of electric charge.",
               "What is the concept of quantum mechanics?": "Quantum mechanics is a branch of physics that deals with the behavior of matter and energy at the smallest scales, such as atoms and subatomic particles.",
               "What is the difference between series and parallel circuits?": "In a series circuit, the components are connected one after another along a single pathway, while in a parallel circuit, the components are connected across multiple pathways.",
               "What is the Doppler effect?": "The Doppler effect is the change in frequency or wavelength of a wave as observed by an observer moving relative to the source of the wave. It is commonly observed with sound and light waves.",
               "What is the principle of conservation of electric charge?": "The principle of conservation of electric charge states that electric charge cannot be created or destroyed but can only be transferred from one object to another.",
               "What is the concept of entropy in thermodynamics?": "Entropy is a measure of the disorder or randomness of a system. The second law of thermodynamics states that the entropy of an isolated system tends to increase over time.",
               "What is the concept of nuclear fusion?": "Nuclear fusion is a process in which two or more atomic nuclei combine to form a heavier nucleus, releasing a large amount of energy in the process. It is the process that powers the sun and stars.",
               "What is the concept of wave interference?": "Wave interference occurs when two or more waves meet and combine to form a resultant wave. Interference can be constructive, where the waves reinforce each other, or destructive, where they cancel each other out.",
               "What is the concept of buoyancy?": "Buoyancy is the upward force exerted on an object immersed in a fluid, such as water or air. It is caused by the difference in pressure between the top and bottom of the object.",
               "What is the principle of conservation of angular momentum?": "The principle of conservation of angular momentum states that the total angular momentum of a system remains constant in the absence of external torques.",
               "what is the heaviest naturally occurring element": "The heaviest naturally occurring element is uranium."
               
           ]
    
    var body: some View {
        VStack {
            ChatView(chatHistory: chatHistory)
            
            HStack {
                TextField("Type a question", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: processUserInput) {
                    Text("Send")
                }
                .padding(.trailing)
            }
            .padding(.top, 20)
        }
        .onAppear {
            chatHistory.append(greeting)
        }
    }
    
    private func processUserInput() {
        let lowercasedInput = userInput.lowercased()
        let response: String
        
        // Check if the user input matches any questions
        if let answer = responses[lowercasedInput] {
            response = answer
        } else if lowercasedInput.contains("+") {
            response = performArithmeticOperation(lowercasedInput, operator: "+", operation: +)
        } else if lowercasedInput.contains("-") {
            response = performArithmeticOperation(lowercasedInput, operator: "-", operation: -)
        } else if lowercasedInput.contains("*") {
            response = performArithmeticOperation(lowercasedInput, operator: "*", operation: *)
        } else if lowercasedInput.contains("/") {
            response = performArithmeticOperation(lowercasedInput, operator: "/", operation: /)
        } else {
            response = "I'm sorry, but I don't understand. Can you please rephrase your question?"
        }
        
        chatHistory.append(userInput)
        chatHistory.append(response)
        userInput = "" // Clear the input field after processing
    }
    
    private func performArithmeticOperation(_ input: String, operator: String, operation: (Double, Double) -> Double) -> String {
        let components = input.components(separatedBy: " ")
        guard components.count == 3 else {
            return "Invalid arithmetic expression."
        }
        
        guard let operand1 = Double(components[0]), let operand2 = Double(components[2]) else {
            return "Invalid operands."
        }
        
        var result: Double
        switch `operator` {
        case "+":
            result = operation(operand1, operand2)
        case "-":
            result = operation(operand1, operand2)
        case "*":
            result = operation(operand1, operand2)
        case "/":
            result = operation(operand1, operand2)
        default:
            return "Invalid operator."
        }
        
        return "\(operand1) \(`operator`) \(operand2) = \(result)"
    }
}

struct ChatView: View {
    let chatHistory: [String]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                ForEach(chatHistory, id: \.self) { message in
                    Text(message)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct Chatbot_Previews: PreviewProvider {
    static var previews: some View {
        Chatbot()
    }
}
