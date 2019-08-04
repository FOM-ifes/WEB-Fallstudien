# Webseite als Startseite für Fallstudien

[![Netlify Status](https://api.netlify.com/api/v1/badges/3fb0c409-348c-4c89-b5d1-a02bdf0bf2a1/deploy-status)](https://app.netlify.com/sites/fallstudien/deploys)

In diesem Mini-Projekt wird eine kleine "Kachel-Webseite"" erstellt werden, auf der Fallstudien gesammelt werden können.


## Was nicht ins Repository gehört!

Das Verzeichnis *public/* wird u.U. zwar lokal erstellt. Zum Beispiel bei RStudio und blogdown, wenn man sich das Ergebnis von Änderungen lokal ansehen möchte. -- Aber es gehört ***nicht*** ins Repository, da es vom automatisiereten Erstellungsdienst von netlify.com beim Neuerstellen (deploying) 
der Seite selbsttätig generiert wird!

Darum dürfen dort auch keine Änderungen oder statische Inhalte hinterlegt werden.


## Wo sollen die Fallstudien dann hin?

Das Verzeichnis *static/* gibt die Möglichkeit *statische* Inhalte, wie z.B. die Fallstudien und deren Icons und Thumbs zu speichern. 

Also Beispiel hier der Weg zur **Fallstudie_UWaesche**:

1. Anlegen des Verzeichnisses "Fallstudie_UWaesche" im Ordner "static/". Damit wollen wir alle Unterlagen im Verzeichnis "static/Fallstudie_UWaesche" ablegen.
2. Ablegen der Fallstudie im Verzeichnis.
    Wir erhalten so Verzeichnisstruktur:
    
```
    static +- Fallstudie_UWaesche +- Fallstudie_UWaesche.zip
           |                      |
           |                      +- fallstudien.bib
           |                      |
           |                      +- Unterwaesche.pdf
           |                      |
           |                      +- Unterwaesche.Rmd
           |                      |
           |                      +- Uwaesche.xlsx
           |                      
           + ...
```    


3. Anlegen eines Eintrages in **items.toml** im Verzeichnis **data/**:
```
[[items]]
title = "Fallstudie 3 - Unterwäsche"
image = "images/full/3.png"
thumb = "images/thumbs/3.png"
alt = "Fallstudie '3' - 'Unterwäsche'"
description = "Irgendeine coole Fallstudie mit Unterwäsche"
url = "Fallstudie_UWaesche/Unterwaesche.pdf"

```



4. Änderungen ins Repository bestätigen:
    Die Änderungen von "data/items.toml" und das neue Unterverzeichnis "static/Fallstudie-UWaesche" müssen nun noch via git *commited* und nach GitHub *gepushed* werden.
    
    
5. Icons ("Kachelbilder") erzeugen:

Man betrachte das Beispiel in `create-icon-for-casestudy.R`. Dort die relevanten Daten in die Funktion eintragen (das Beispiel überschreiben):

````
source("code-div/create-thumbnail-png-funs.R")

create_imgfiles(title_casestudy = "Prädiktoren der Verspätungen der New Yorker Flüge", 
                title_short = "NYC Flights",
                tags = "Regression, Prognose")
```

Die resultierenden Bilddateien heißen z.B. `NYC Flights.png`. Diese Namen müssen in `items.toml` eingetragen werden.




                

    
## Wo findet man die Seite?

Test-Seite unter: https://fallstudien.netlify.com


