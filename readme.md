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

[^3]: https://stackoverflow.com/questions/60152701/uiview-animation-options-repeat-count , https://stackoverflow.com/questions/6224468/blinking-effect-on-uilabel , https://stackoverflow.com/questions/49547677/swift-ios-adding-date-picker-to-an-alert-in-swift-to-be-saved-to-local-db-using
    
# Oppgave 3
## FruitCollectionView
* Med inspirasjon fra youtube, har jeg laget CollectionView med 3 seksjoner. Jeg valgte å ikke gjøre denne delen dynamisk siden det finnes kun 3 forksjellige kategorier. I de senere metodene, så har jeg en switch for sjekke hvilken sjeksjon jeg er i for å gi dem riktig data. Hver seksjon har en gitt header tekst. Klassene og identifier for header og celler, har jeg angit i storyboard.[^4] 

    Når man trykker på en celle så jeg går tilbake til FruitTableView fra oppg.1 hvor jeg endrer url varibalem til et nytt api kall med gitt type og navnet av typen.
* Siden det er mange frukter under samme kategori, vil jeg kunne få duplikat celler med samme navn. For å fikse dette har jeg benyttet meg av Set for å gjøre de unike, også konverterer jeg dem til en array for å kunne bruke indexPath.row på de.[^5]

[^4]: https://www.youtube.com/watch?v=y1uXXVUu43o&t=1979s, https://www.youtube.com/watch?v=TQOhsyWUhwg&t=1048s
[^5]: https://stackoverflow.com/questions/27624331/unique-values-of-array-in-swift

    
# Oppgave 4
## FruitLogg presistence & FruitDetailView
    
## FruitLoggTableView
    
# Oppgave 5
## FruitEmojiRain
