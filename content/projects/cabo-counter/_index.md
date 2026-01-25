---
title: Cabo Counter
toc: true
type: docs
enableBreadcrumb: true

---

{{< figure
src="/images/projects/cabo-counter/cabo-counter-logo-rounded.webp"
alt="Das Logo der Cabo Counter App"
width="400"
>}}

{{< cards >}}
{{< card link="https://apps.apple.com/de/app/cabo-counter/id6751843294" title="Cabo Counter im App Store" icon="device-mobile">}}
{{< card link="" title="Cabo Counter im Play Store" icon="device-mobile" >}}
{{< card link="https://cabocounter.felixkirchner.de" title="Cabo Counter - Landing Page" icon="globe-alt" >}}
{{< /cards >}}

## Ressourcen

{{< cards >}}
{{< card link="mailto:cabocounter@felixkirchner.de" title="Kontakt" icon="mail" >}}
{{< card link="https://github.com/flixcoo/cabo-counter/issues" title="Bug melden" icon="github" >}}
{{< /cards >}}

## Die Entstehung des Cabo Counter

### Die Inspiration

Viele von euch werden das Kartenspiel Wizzard kennen. Ich selbst spiele das schon seit vielen Jahren super gerne. Für
die unter euch, die Wizzard nicht kennen: Bei Wizzard geht es darum, dass man vor jeder Runde vorhersagt, wie viele
Stiche man in der Runde machen wird. Am Ende der Runde bekommt man Punkte basierend darauf, ob man richtig lag oder
nicht.  
Bei den Spielkarten ist immer ein kleiner Block dabei, welchem einem das Punkte aufschreiben erleichert. Irgendwann um
2022 habe ich denn im App Store die [Wizzard App](https://apps.apple.com/de/app/block-der-wahrheit-punkte/id1210994776)
gefunden, welche bei mir seit dem den Block ersetzt hat. Die App ermöglicht es einer:m für jede Runde die Vorhersagen
und tatsächlich erreichten Stiche anzugeben und rechnet basierend darauf automatisch die entsprechenden Punkte aus. Es
bleibt einem das Rechnen ersparrt, es schleichen sich keine Fehler ein und zusätzlich kann man am Ende des Spiels noch
einen coolen Verlaufsgraphen sehen.

### Idee der Cabo App

Im Herbst 2021 habe ich das erste mal bei einer Freundin in Göttingen das Spiel _Cabo_ kennengelernt. Ich hab es mir
wenige Wochen später direkt selbst geholt und spiele es seitdem regelmäßig mit Freunden oder Familie. Cabo ist eine Art
Punkte-Memorie, bei dem es darum geht, die wenigsten Punkte auf der Hand zu haben. Der Clue dahinter ist, dass man nur
einmal am Anfang der Runde zwei seiner Handkarten sieht. Danach kann man diese nur noch in bestimmten Fällen sehen.
Cabo hat ähnlich wie Wizzard, auch Regeln, was die Punkteverteilung und das Spielende angeht. Wir haben es aber selten
mit Punkten gespielt, da das Zählen ohne beiliegenden Block meist nervig war. Also haben wir meist einfach drauf los
gespielt, ohne groß darauf zu achten, wer wie oft gewonnen hat. Das hatte mich schon länger genervt und deswegen hatte
ich schon länger die Idee, ähnlich wie für Wizzard, eine Cabo App zu entwickeln.

### Erste Ansätze

Da ich meistens in den Semesterferien nach den Klausurenphase keine weiteren Abgaben hatte, wollte ich diese Zeit
sinnvoll nutzen, und fing ohne große Konzeptionierung direkt an. Da ich zu diesem Zeitpunkt eigentlich keine Erfahrung
im Bereich App Entwicklung hatte, hielt mein naives ich es für die beste Idee, voll reinzugehen. Also startete ich from
Scratch mit einem neuen Swift Projekt. Am 18. September .2024 kam der _Initial commit_ in mein Repo. Viel kam an der
Stelle aber nicht, es entstanden eine Hand voll Ansichten und minimale Funktionalität, aber es war nicht mal ein MVP zu
stande gekommen.

| Hauptmenü                                                                                                     | Neues Spiel erstellen                                                                                                    | Punkte eintragen                                                                                                    | Punkteübersicht                                                                                                     |
|---------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| {{< figure src="/images/projects/cabo-counter/screenshots/screenshot-1.webp" alt="Hauptmenü" width="250"  >}} | {{< figure src="/images/projects/cabo-counter/screenshots/screenshot-2.webp" alt="Neues Spiel erstellen" width="250" >}} | {{< figure src="/images/projects/cabo-counter/screenshots/screenshot-3.webp" alt="Punkte eintragen" width="250" >}} | {{< figure src="/images/projects/cabo-counter/screenshots/screenshot-4.webp" alt="Punkteübersicht" width="250"  >}} |

Der letzte von insgesamt 11 Commits in diesem Repository kam am 03. Oktober 2024. Danach packte mich
mein 5. Semester und ich hatte aller Hand voll Abgaben, Vorlesungen und Seminare.

### Meine Flutter-Anfänge

Während meinen 4. und 5. Semester an der [HTWK Leipzig](https://htwk-leipzig.de) hatten wir das Modul _Softwareprojekt
I & II_. In diesem sollten zwischen 10 - 15 Bachelorstudierende unter der Leitung von 2 - 3 Masterstudierenden ein
Projekt für einen reelen Kunden umsetzen. In unserem Fall war dies die [DB Systel](https://www.dbsystel.de), eine
Tochterfirma der Deutsche Bahn AG, welche als Projekt eine Art "Fahrschul-Webanwendung" für Triebfahrzeugführer:innen (
Nicht-DB-Menschen würden Lokführer:innen sagen) mitbrachte. Über das ganze Projekt habe ich auch eine eigene Seite, dazu
schaut gerne [hier](../db-streckenband.md) vorbei.  
Der erste Sprint des Projekt beinhaltete neben vielen konzeptionellen Schritten, wie Funktionsumfang und Wireframes auch
eine Technologierecherche. Wir wurden und 3 Gruppen aufgeteilt und sollten uns über einen Zeitraum von einer Woche grob
mit einer möglichen Technologie zur Umsetzung des Projekts beschäftigen. Neben Game-Frameworks
wie [libGDX](https://libgdx.com/) wurde hier auch Flutter aufgeführt, welches vor allem wegem dem Cross-Plattform Aspekt
interessant schien. Um die Sache kurz zu halten: Flutter wurde am Ende zu unserem Frontend. Zwischen April 2024 und
Januar 2025 habe ich viel an dem Projekt gearbeitet. Da es sich jedoch um eine Web-App handelte, war mir lange Zeit
garnicht klar, das Flutter vor allem für die App Entwicklung gedacht war. Irgendwann in der Klausurenphase meines 5.
Semesters pflanzte sich dann die Idee in meinen Kopf, der schon einmal versuchten App eine zweite Chance zu geben, jetzt
aber mit der ganzen Erfahrung, die ich in Flutter gesammelt hatte. Und so landete am 01. März 2025 der _Initial commit_
in dem neuen Repository.

### Jetzt aber richtig

Da ich in mein 6. Semester die ersten drei Monate "nur" mein Pflichtpraktikum hatte, wusste ich, dass ich viel Zeit
haben werde. Neben der letzten Prüfungsleistung meines 5. Semesters, der App [Watchwise](../watchwise.md), fing ich an,
die Idee der Cabo App auszugestalten.

{{< figure
src="/images/projects/cabo-counter/cabo-counter-skizze.webp"
alt="Frühe Skizze der Cabo App"
width="600"
caption="Der erste Entwurf der Cabo App"
>}}

Bei der Navigation und dem Design habe ich mich hier viel bei
der [Wizzard App](https://apps.apple.com/de/app/block-der-wahrheit-punkte/id1210994776) bedient, da sie ein sehr
schlichtes und funktionale, aber auch schickes Design bot. Nach einigen Wochen ging die App dann Anfang Juni 2025 in die
Public Beta. Ich konnte einige Freunde und Familie gewinnen, sich meine App
über [Testflight](https://developer.apple.com/testflight/) herunterzuladen, um mir so wertvolles Feedback zu geben. Das
hat vor allem dahingehend geholfen, dass ich viele Probleme, die ich selbst wahrscheinlich erst viel später entdeckt
hätte, noch vor Release beheben konnte und außerdem noch UX-Verbesserungen und zusätzliche Funktionen implementieren
konnte, die einem aus Programmierer:innen sicht, ga rnicht auffallen bzw. die mir als Ersteller natürlich klar waren,
ein:
e neue:r User:in damit aber vielleicht nicht umzugehen wusste.

### Der Release

Nach 3 Monaten Beta-Tests habe ich die App dann am 1. Oktober 2025 offiziell im App Store released. Ich war super happy,
da ich lange nicht wusste, wie lange es wohl dauern würde, bis es dieses Projekt von meinem Computer tatsächlich in den
Store schafft. Aktuell arbeite ich an einer Android-Optimierten Version der App, die hoffentlich im Frühjahr 2026 dann
erscheinen kann. Meinen Blog-Artikel zum Cabo-Counter Release kannst du [hier](../../blog/2025-10-01.md) lesen.

## Links

{{< cards >}}
{{< card link="https://github.com/flixcoo/cabo-counter" title="Repository" icon="code" >}}
{{< card link="../cabo-counter/privacy" title="Datenschutzerklärung" icon="shield-check" >}}
{{< /cards >}}