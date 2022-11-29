## For dette prosjektet brukte jeg Xcode 13.4.1 og Apple Swift version 5.7

# Oppgave 1
## FruitTableView & FruitData
* Mtp. å få dataen som blir hentet fra api-et til å være globalsk, så har jeg et eget klasse med et statisk tomt array, og et satisk funksjon som fyller arrayet. Denne funksjonen har en clousre med @escaping for å kunne utføre en ny handling etter at den har fetchet. Jeg brukt denne clouseren mest for tableView.reloadData().[^2]
        
* I fruitTableView, så har jeg asignet url-en til fruit/all og fetcher dataen før view-et dukker opp. I tillegg har jeg lagt til et et dictonary for farger hvor keyen er familien og value er en random gitt farge.[^1]

[^1]: https://stackoverflow.com/a/55521230 -> for å gi samme farge for hver familie
[^2]: https://www.youtube.com/watch?v=8dn9HzNigm8&t=891s & Student prosjektet fra foreleser

# Oppgave 2
## FruitDetailView
* For animasjon av bakgrunn og tekst, har jeg lagt til en UIVew.animte som repeteres hele tiden. For at det ikke skal være irriterende for øyet, så har jeg forsøkt å ha duration på 0.8. Jeg måtte også ha med .allowUserInteraction for at man skal kunne trykke på knapper mens animasjonen er i gang.[^3] 

[^3]: https://stackoverflow.com/a/60152901 -> For reptitisjons animasjon , https://stackoverflow.com/a/21558744 -> For animasjon på tekst 
    
# Oppgave 3
## FruitCollectionView
* Med inspirasjon fra youtube, har jeg laget CollectionView med 3 seksjoner. Jeg valgte å ikke gjøre denne delen dynamisk siden det finnes kun 3 forksjellige kategorier. I de senere metodene, så har jeg en switch for sjekke hvilken sjeksjon jeg er i for å gi dem riktig data. Hver seksjon har en gitt header tekst. Klassene og identifier for header og celler, har jeg angit i storyboard.[^4] 

    Når man trykker på en celle så går jeg tilbake til FruitTableView fra oppg.1 hvor jeg endrer url varibalen til et nytt api kall med gitt type og navnet av typen.
    
* Siden det er mange frukter under samme kategori, vil jeg kunne få duplikat celler med samme navn. For å fikse dette har jeg benyttet meg av Set for å gjøre de unike, også konverterer jeg dem til en array for å kunne bruke indexPath.row på de.[^5]

[^4]: https://www.youtube.com/watch?v=y1uXXVUu43o&t=1979s, https://www.youtube.com/watch?v=TQOhsyWUhwg&t=1048s
[^5]: https://stackoverflow.com/a/27624476 -> For unike verdier

    
# Oppgave 4
## FruitLogg presistence & FruitDetailView
* Først så valgte jeg å bruke en custom alert view i en annen viewController. Men så bestmete jeg meg for å lage en simpel alert i detailViewController, med nil som funksjon for å avbryte, og lagring av loggen i tillegg til popViewController som funksjon når man trykker save. Dato og tid blir automatisk satt til det tidspunktet man trykker på spis frukt knappen.[^6]

    Jeg har valgt å bruke norsk dato og tid format.[^7]

* For CoreData så har laged en entity som heter FruitLogg. FruitLogg har næringene, navn og dato som felter. Create NSMangedObject Subclass lager filer for meg slik at jeg bruke feltene i databasen. 

    I detailView så lagde jeg en context variabel som bruker AppDelegate sitt persistentContainer variabel som ble lagt til da jeg huket av på CoreData boksen når jeg lagde prosjektet. Nå jeg har valgt et dato og trykker på save, så blir feltene fra FruitLogg angit og larget i coreData. Jeg har også lagt til en alert i catch hvis noe skulle gå galt.[^8] 
    
Insperasjon custom alert:
- https://www.youtube.com/watch?v=670h22_ZsvY&t=1432s
- https://www.youtube.com/watch?v=fnq4wEDeQqA&t=531s 

[^6]: https://stackoverflow.com/a/56607279 -> For datePicker i en alertView
[^7]: https://stackoverflow.com/a/33912837 - For tidsformat
[^8]: https://www.youtube.com/watch?v=rjHBINtpKA8&t=727s & Student prosjektet fra foreleser
    
## FruitLoggTableView
* For å kunne ha spiste frukter med samme dato i samme seksjon. Prøvde jeg meg først på å lage en dictionary, på samme måte som jeg gjorde med fargene. Men så kom jeg borti i en video som viser at man kan lage et nytt struct med to felter, dato og array av spiste frukt. Så kan jeg lage et array av strukten og appende nytt dato og frukt. Hvis datoen finnes allerede, append kun frukten.[^9]

    Jeg har også valgt å sortere de etter dato, sånn at siste datoen kommer først.
* Lengere nede i FruitLoggTableViewController klassen, har jeg lagt til en extension av UITableView for å legge til beskjed hvis loggen er tom.[^10]

Inspirasjon for footer og header: https://www.youtube.com/watch?v=sSNYinzvQh0&t=1389s
    https://github.com/jrasmusson/swift-arcade/blob/master/UIKit/UITableView/HeaderFooterNib/README.md

[^9]: https://www.youtube.com/watch?v=iEigIJG7-ic&t=808s
[^10]: https://stackoverflow.com/a/45157417 -> Tekst for tom tableView

    
# Oppgave 5
## FruitEmojiRain
* For å få til regn med emojis, benyttet jeg meg av en løsning hvor det er snakk om regndroper. Jeg gikk gjennom løsningen og gjorde om de nødvendige forandringene for at det skulle passe med prosjektet mitt.[^11]
    
    Koden er forklart med kommentarer, men bare for å nevne forandringene som jeg har lagt til: 
    1. For loopen som skal slette vekk emojiene etter å ha gå ut av skjermens størrelse måtte jeg endre for å få tak i indexen.[^12]
    2. Henter data fra coreData.
    3. Lager tidsperiode fra -30 dager til dagens dato.[^13]
    4. Lagt til UILabel i UIView[^14]
    5. Lagt til animasjon for å kunne skalere labelen fra 2 til 0.1[^15]
    
[^11]: https://github.com/kirankunigiri/Swift-Rain/tree/master/Swift-Rain    
[^12]: https://stackoverflow.com/a/33116370
[^13]: https://stackoverflow.com/a/44689102 -> -30 dager,

https://www.hackingwithswift.com/example-code/language/how-to-check-whether-a-date-is-inside-a-date-range -> Lage tidsperiode
[^14]: https://stackoverflow.com/a/37738752
[^15]: https://medium.com/livefront/animating-font-size-in-uilabels-fb6fd273a5f3

# Kilder og insperasjon 

