# Oppgave 1
## FruitTableView & FruitData
* Mtp. å få dataen som blir hentet fra api-et til å være globalsk, så har jeg et eget klasse med et statisk tomt array, og et satisk funksjon som fyller arrayet. Denne funksjonen har en clousre med @escaping for å kunne utføre en ny handling etter at den har fetchet. Jeg brukt denne clouseren mest for tableView.reloadData().[^2]
        
* I fruitTableView, så har jeg asignet url-en til fruit/all og fetcher dataen før view-et dukker opp. I tillegg har jeg lagt til et et dictonary for farger hvor keyen er familien og value er en random gitt farge.[^1]

###### Kilder og insperasjon 
[^1]: https://stackoverflow.com/questions/55521000/how-to-generate-the-same-random-color-in-a-table-view-for-a-table-view-row-for-a
[^2]: https://www.youtube.com/watch?v=8dn9HzNigm8&t=891s Student prosjektet fra foreleser

# Oppgave 2
## FruitDetailView
* For animasjon av bakgrunn og tekst, har jeg lagt til en UIVew.animte som repeteres hele tiden. For at det ikke skal være irriterende for øyet, så har jeg forsøkt å ha duration på 0.8. Jeg måtte også ha med .allowUserInteraction for at man skal kunne trykke på knapper mens animasjonen er i gang.[^3] 

[^3]: https://stackoverflow.com/questions/60152701/uiview-animation-options-repeat-count , https://stackoverflow.com/questions/6224468/blinking-effect-on-uilabel , https://stackoverflow.com/questions/49547677/swift-ios-adding-date-picker-to-an-alert-in-swift-to-be-saved-to-local-db-using
    
# Oppgave 3
## FruitCollectionView
* Med inspirasjon fra youtube, har jeg laget CollectionView med 3 seksjoner. Jeg valgte å ikke gjøre denne delen dynamisk siden det finnes kun 3 forksjellige kategorier. I de senere metodene, så har jeg en switch for sjekke hvilken sjeksjon jeg er i for å gi dem riktig data. Hver seksjon har en gitt header tekst. Klassene og identifier for header og celler, har jeg angit i storyboard.[^4] 

    Når man trykker på en celle så går jeg tilbake til FruitTableView fra oppg.1 hvor jeg endrer url varibalen til et nytt api kall med gitt type og navnet av typen.
    
* Siden det er mange frukter under samme kategori, vil jeg kunne få duplikat celler med samme navn. For å fikse dette har jeg benyttet meg av Set for å gjøre de unike, også konverterer jeg dem til en array for å kunne bruke indexPath.row på de.[^5]

[^4]: https://www.youtube.com/watch?v=y1uXXVUu43o&t=1979s, https://www.youtube.com/watch?v=TQOhsyWUhwg&t=1048s
[^5]: https://stackoverflow.com/questions/27624331/unique-values-of-array-in-swift

    
# Oppgave 4
## FruitLogg presistence & FruitDetailView
* Først så valgte jeg å bruke en custom alert view i en annen viewController. Men så bestmete jeg meg for å lage en simpel alert i detailViewController, med nil som funksjon for å avbryte, og lagring av loggen i tillegg til popViewController som funksjon når man trykker save. Dato og tid blir automatisk satt til det tidspunktet man trykker på spis frukt knappen.[^6]

    Jeg har valgt å formatere dato feltet til norsk dato og tid format.[^7]

* For CoreData så har laged en entity som heter FruitLogg. FruitLogg har næringene, navn og dato som felter. Create NSMangedObject Subclass lager filer for meg slik at jeg bruke feltene i databasen. 

    I detailView så lagde jeg en context variabel som bruker AppDelegate sitt persistentContainer variabel som ble lagt til da jeg huket av på CoreData boksen når jeg lagde prosjektet. Nå jeg har valgt et dato og trykker på save, så blir feltene fra FruitLogg angit og larget i coreData. Jeg har også lagt til en alert i catch hvis noe skulle gå galt.[^8] 
    
Insperasjon custom alert:
- https://www.youtube.com/watch?v=670h22_ZsvY&t=1432s
- https://www.youtube.com/watch?v=fnq4wEDeQqA&t=531s 

[^6]: https://stackoverflow.com/questions/49547677/swift-ios-adding-date-picker-to-an-alert-in-swift-to-be-saved-to-local-db-using
[^7]: https://stackoverflow.com/questions/11151187/show-time-in-12-and-24-hour-format-in-uidatepicker-on-the-basis-of-app-settings
[^8]: https://www.youtube.com/watch?v=rjHBINtpKA8&t=727s og Student prosjektet fra foreleser
    
## FruitLoggTableView

    
# Oppgave 5
## FruitEmojiRain
