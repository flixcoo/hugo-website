---
title: WatchWise
toc: true
---

{{< figure
src="/images/projects/watchwise-logo.webp"
alt="WatchWise Logo"
width="400"
>}}

---

{{< cards >}}
{{< card link="https://github.com/flixcoo/watchwise" title="Repository" icon="code" >}}
{{< /cards >}}

Dieses Projekt war Teil des Moduls _Mobile Computing (C652)_ meines Bachelorstudiums an
der [HTWK Leipzig](https://htwk-leipzig.de). Im Wintersemester 2024/25 habe ich in Zusammenarbeit mit meinen
Kommilitonen Robert Hobelsberger und Quentin Kleinert eine Android App entwickelt. Dies war neben einer Klausur die
zweite Prüfungsleistung in diesem Modul.

WatchWise ist eine moderne Android-App, mit der du Filme, Serien und deine Lieblings-Stars verwalten kannst.  
Sie kombiniert lokale Speicherung mit Cloud-Funktionalität und greift auf externe APIs zu, um dir eine smarte
Entdeckerfahrung zu bieten.

## Funktionen

Die App bietet unter anderem:

- Beliebte Filme und aktuelle Hits im Überblick
- Top-bewertete und trendige TV-Shows
- Übersicht über bekannte Schauspieler:innen und Crew
- Smarte Suche nach Titel, Darsteller oder Regisseur
- Eigene Listen wie „Watched“, „Watch Later“ oder „Favorites“
- Persönliche Profilansicht mit individuellen Watchlists

## Architektur & Tech Stack

WatchWise ist sauber modular aufgebaut und nutzt moderne Bibliotheken und Patterns:

### Android App

- Kotlin
- Multi-Module Projektstruktur
- MV*-Ansatz mit Navigation Component
- Room für lokale Datenspeicherung
- Retrofit2 für Netzwerkanfragen
- Dagger2 für Dependency Injection
- Coil für effizientes Bild-Rendering

### Backend / Cloud

Azure Functions wurden für Clo ud-Funktionen und Daten-Synchronisation verwendet. Die Cloud-Backend-Funktionen sind
mittlerweile nicht mehr funktional, da es sich um einen kostenpflichtigen Dienst handelt, der nach dem Ende des Semesters
deaktiviert wurde.
