---
title: Véloclub Webseite
comments: true
enableBreadcrumb: true
type: docs
---

{{< cards >}}
{{< card link="https://github.com/flixcoo/veloclub-website" title="Repository" icon="code" >}}
{{< card link="https://veloclubband.de" title="Live" icon="globe-alt" >}}
{{< /cards >}}

----

Seit 2023 Zeit bin ich Drummer der Indie-Band [Véloclub](https://veloclubband.de) und hatte deswegen auch schon seit
geraumer Zeit vor, unseren Social Media Auftritt um eine Website zu erweitern. Irgendwie kam ich aber in den letzten
Jahren nie dazu oder hatte andere Projekte. Über Weihnachten 2025 hab ich mich dann jetzt endlich mal hingesetzt und die
Seite gebaut. Und da ich finde, dass das Projekt ganz gut geworden ist, möchte ich es hier gerne mal vorstellen.

## Aufbau

Die Website war von Anfang an als One-Pager geplant, der alle wichtigen Informationen über die Band auf einen Blick
präsentiert.
Auch da wir aktuell noch keinen großen Content haben, war es mir wichtig, die Seite nicht mit unnötigen Elementen zu
überladen, sondern einfach die wichtigsten Informationen über uns Präsent zu haben. Prio hatte dabei vor allem eine
Sektion für Live-Termine und eine Hero-Section für die Bandvorstellung. Außerdem hatte ich die Idee, ähnlich wie bei
unserem [Linktree](https://linktree.veloclubband.de) Embeds für Spotify, Apple Music und ggf. auch Youtube einzubauen.
Während des Prozesses ist dann noch eine Kontakt-Sektion hinzugekommen und neben den Embeds sind in der Musik-Sektion
noch Icon-Buttons für alle gängigen Musik-Streaming Dienste gelandet. Generell wollte ich die Seite Desktop-First
entwickeln, da Sie als Desktop-Alternative zu unserem schon bestehenden Linktree fungieren sollte und vor allem für
Veranstalter:innen oder A&Rs eine Möglichkeit sein sollte, alle Informationen über uns sortiert zu bekommen

## Technische Umsetzung

Das ganze Projekt ist in React gebaut, da ich mich immer schon mal damit beschäftigen wollte und ich das als besten
Anlass gesehen hab, da die Webseite ja auch keine komplexen Elemente oder Animationen enthalten sollte. Als Build-Tool
habe ich Vite genutzt, da ich das schon von meiner Arbeit kenne. Im Zuge der Containisierung meiner Projekte habe ich
hierfür auch ein Dockerfile und eine docker-compose.yml erstellt, damit ich die Seite direkt als Container auf meinem
VPS deployen kann. Beim Styling hab ich mich für reines CSS und entschieden, da dadurch die Tags nicht ewig viele
Klassen haben, wie ich bei z.B. Tailwind die Erfahrung gemacht habe. Beim Design habe ich es auch schlicht gehalten,
eine Primary Color, ansonsten nur Schwarz und Weiß, auch ohne einen Darkmode.

## Ausblick

Aktuell wird die Seite sich bis auf weiteres vom Aufbaue erstmal nicht verändern. Sollten wir irgendwann einen eigenen
Merch-Shop haben, könnte man überlegen, eine neue Sektion mit verlinkten Artikeln aus diesem einzubauen, aber das wird
die Zeit dann zeigen. Ich bin sehr zufrieden mit dem Ergebnis! Wenn du dir den Quellcode anschauen möchtest, schau dir
gerne das [Repository](ttps://github.com/flixcoo/veloclub-website) auf meinem GitHub Profil an!
