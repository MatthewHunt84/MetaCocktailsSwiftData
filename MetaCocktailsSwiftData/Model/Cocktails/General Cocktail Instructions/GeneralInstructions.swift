//
//  GeneralInstructions.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var eggWhiteInstructionsNoBitters  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients into a tin and dry shake to emulsify."),
                                                            Instruction(step: 2, method: "Then Shake with ice."),
                                                            Instruction(step: 3, method: "Strain into a chilled glass.")])

var eggWhiteBittersDecoInstructions  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the bitters, into a tin and dry shake to emulsify."),
                                                            Instruction(step: 2, method: "Then Shake with ice."),
                                                            Instruction(step: 3, method: "Carefully double strain into a chilled martini glass to make a smooth flat surface. This will be your canvas for the bitters."),
                                                            Instruction(step: 4, method: "Add a design with the bitters")])

var topWithChampagnMethod  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                         Instruction(step: 2, method: "Add the bubbles to the tin then strain it into the glass."),
                                         Instruction(step: 3, method: "Make sure you aren't double straining with a tea strainer and immediately killing the carbonation.")])
