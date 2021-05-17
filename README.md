# Master-Music
## User story
Master-Music er en Android-app med det formål at hjælpe musikinteresserede individer i at blive bedre til musikteori og hørelære. 
Appen indeholder 3 forskellige spil, der træner musikfærdigheder. 

Det ene af disse spil kaldes en "Perfect Pitch Trainer", der træner brugeren i at kunne genkende forskellige toner. Spillet fungerer ved, at programmet spiller en tone, og brugeren skal angive hvilken tone, der spilles, ved at trykke på den knap med den rigtige tone. Derefter fortæller programmet, om brugeren svarede rigtigt, og brugeren får point, hvis der svares rigtigt, og dør, hvis der svares forkert. Her inkluderes desuden en highscore.

Et andet af disse spil kaldes "Node Name Trainer", hvor der vises et billede af en node, og brugeren skal trykke på den knap, der angiver tonen svarende til billedet. Herefter fortæller programmet, om der er svaret rigtigt eller forkert, og der gives point, hvis der svares rigtigt, og spilleren dør, hvis der svares forkert. Her inkluderes desuden en highscore.

Det tredje spil kaldes "Music Theory Flashcards". Dette spil følger et flashcard-system, hvor der vises en boks - et flashcard - med et spørgsmål relateret til musikteori. Brugeren besvarer mentalt spørgsmålet, hvorefter brugeren vender flashcardet ved at trykke på boksen med spørgsmålet. På bagsiden af flashcardet står svaret på spørgsmålet. Brugeren vurderer herefter selv sværhedsgraden af flashcardet ved at trykke på den knap, der viser niveauet af den vurderede sværhedsgrad.


## Overordnede struktur af koden
Programmets UI består af flere forskellige panels. Klassen “Screen” extender “Panel”, og tilsammen indeholder disse to klasser egenskaberne, som de forskellige sider i programmet har. Derfor extender de forskellige sider klassen “Screen”, som jo extender "Panel". Derudover er der lavet en klasse, “Application”, som indeholder forskellige funktioner, som siderne skal have. Denne side extender dermed også “Panel”, da den også skal have de samme egenskaber som siderne. Herudover er der lavet to yderligere klasser, “Header” og “Footer”, som altid bliver vist. Der kan dog ikke trykkes “Back” eller “Log out” på log in siden, og der kan ikke trykkes “Log out” på sign up siden, da brugeren her ikke er logget ind. Til sidst er der lavet en seperat klasse til henholdsvis knapper (to forskellige typer, “Button” og “InstrumentButton”), tekst (“Text”), inputfelter (“Input”), teksten i inputfelter (“StringVariable”) samt en liste af de forskellige udseender af noder (“NodeList”). At have en seperat klasse til for eksempel knapper og tekst er smart, da alle knapper og al tekst på den måde kan formateres ens, så designet af programmet bliver pænere. Havde der ikke været brugt Processing, havde disse klasser været gjort private for at indkapsle det, så andre programmører ikke vil kunne ændre på det.

Der er desuden oprettet en klasse, “Event”. Denne klasse er kopieret fra en anden bruger, @Stephcraft, som beskrevet i Event.pde. Funktionen af klassen er for eksempel med til at kunne skifte sider ved at udnytte bindEvent.


## Database
I programmet er der valgt SQLite som database. Til API'en er der valgt Bezier SQLite ved Windows mode, hvis der skiftes til Java i Processing, og der er valgt Kentai som den nuværende API ved Android mode.

## At skifte fra Android mode til Windows mode
Hvis der ønskes at skifte tilbage fra Android til Windows, skal editeren ændres fra "Android" til "Java" i Processing. Desuden skal der tilføjes de linjer tilbage i stedet for de tilsvarende de steder, hvor der er kommenteret "WINDOWS MODE". Disse steder kan derved nemt findes ved at søge efter "WINDOWS MODE". 

## At logge ind
Hvis der ønskes at logge ind i vores app, er der i forvejen oprettet en blank bruger, som har et blankt username og et blankt password. Denne bruger vil dermed kunne benyttes af alle. Hvis det ønskes, kan der desuden tilføjes en ny bruger via sign up siden.
