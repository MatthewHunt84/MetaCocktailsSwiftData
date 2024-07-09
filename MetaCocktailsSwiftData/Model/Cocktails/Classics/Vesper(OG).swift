//
//  Vesper(OG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var vesper = Cocktail(cocktailName: "Vesper",
                      glasswareType: .martini,
                      garnish: [.lemonPeel],
                      author: Author(person: "Ivar Bryce", place: "Casino Royale: by Ian Fleming", year: "1953"),
                      spec: vesperSpec,
                      buildOrder: vesperNotes,
                      tags: vesperTags,
                      variation: .vesper,
                      collection: .originals,
                      titleCocktail: true)

var vesperSpec     =  [OldCocktailIngredient(.fortifiedWines(.kinaLillet), value: 0.25),
                       OldCocktailIngredient(.vodkas(.vodkaAny), value: 0.5),
                       OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var vesperTags    = Tags(profiles: [.spiritForward, .dry, .botanical],
                         styles: [.martini, .shaken])

var vesperNotes = Build(instructions: [Instruction(step: 1, method: " The cocktail was not Fleming's creation. It was devised by his friend Ivar Bryce as evidenced by the words Fleming inscribed in Bryce's copy of Casino Royale: 'For Ivar, who mixed the first Vesper and said the good word.'Naming a cocktail the Vesper was Fleming's idea though he drew inspiration from someone else's joke. He had encountered the term at evening drinks when a butler announced: 'Vespers are served.' Fleming adapted this pun on the name of the religious observance normally held about sunset, 'Vespers'. And Bond alludes to this by praising his cocktail's name as 'very appropriate to the violet hour when my cocktail will now be drunk all over the world.'Just as the character Vesper Lynd dies in Casino Royale, the cocktail named for her makes no appearance in any of Fleming's later Bond novels. Fleming, in a letter to The Guardian in 1958, said that when he tasted a Vesper for the first time several months after including it in his novel, he found it 'unpalatable'.")])
