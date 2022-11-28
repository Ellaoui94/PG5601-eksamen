# Oppgave 1
## FruitTableView & FruitData
* Mtp. å få dataen som blir hentet fra api-et til å være globalsk, så har jeg et eget klasse med et statisk tomt array, og et satisk funksjon som fyller arrayet. Denne funksjonen har en clousre med @escaping for å kunne utføre en ny handling etter at den har fetchet. Typisk så har jeg lagt til tableView.reloadData() i clouseren.[^2]
        
* I fruitTableView, så har jeg asignet url-en til fruit/all og fetcher dataen før view-et dukker opp. I tillegg har jeg lagt til et et dictonary for farger hvor keyen er familien og value er en random gitt farge.[^1]

###### Kilder og insperasjon 
[^1]: https://stackoverflow.com/questions/55521000/how-to-generate-the-same-random-color-in-a-table-view-for-a-table-view-row-for-a
[^2]: https://www.youtube.com/watch?v=8dn9HzNigm8&t=891s og Student prosjketet til læreren

# Oppgave 2
## FruitDetailView
* For animasjon av bakgrunn og tekst, har jeg lagt til en UIVew.animte som repeteres hele tiden, og for at det ikke skal være irriterende å for øyet, så har jeg forsøkt å ha duration på 0.8. Jeg måtte også ha med .allowUserInteraction for at man skal kunne trykke på knapper mens animasjonen er i gang.[^3] 

[^3]: 
    - https://stackoverflow.com/questions/60152701/uiview-animation-options-repeat-count ,
    - https://stackoverflow.com/questions/6224468/blinking-effect-on-uilabel ,
    - https://stackoverflow.com/questions/49547677/swift-ios-adding-date-picker-to-an-alert-in-swift-to-be-saved-to-local-db-using
    
# Oppgave 3
## FruitCollectionView
    
# Oppgave 4
## FruitLogg presistence & FruitDetailView
    
## FruitLoggTableView
    
# Oppgave 5
## FruitEmojiRain
