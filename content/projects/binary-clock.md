---
title: ATmega48A Binary Clock
toc: true
---

{{< cards >}}
{{< card link="https://github.com/flixcoo/atmega48a-binary-clock" title="Repository" icon="code" >}}
{{< /cards >}}

Dieses Projekt war Teil des Moduls "Hardwarepraktikum II (C405)" meines Bachelorstudiums an der HTWK Leipzig. Im
Wintersemester 2023/24 habe ich in Zusammenarbeit mit meinem Kommilitonen Quentin Kleinerteine Binäruhr auf Basis des
ATmega48A Mikrocontrollers entwickelt. Dies war einer von insgesamt vier praktischen Prüfungen des Kurses.

## Zielsetzung

Aufgabe war es, eine funktionierende Binäruhr zu bauen, welche folgende Aufgaben erfüllt:

- Korrektes Anzeigen der Uhrzeit im 24-Stunden-Format mit minimaler Abweichung
- Manuelles Einstellen der Uhrzeit
- Helligkeitsregelung der LEDs über Pulsweitenmodulation (PWM)
- Stromsparmodus mit erheblicher Reduzierung des Stromverbrauchs

## Umsetzung

### Bauteile

Die Hauptkomponente der Uhr ist der ATmega48A Mikrocontroller, welcher die Steuerung und Logik übernimmt. Für die
Anzeige der Uhrzeit wurden 11 LEDs bereitsgestellt. Dazu kommen drei Taster welche zur Bedienung der Uhr dienen. Ein
Uhrenquarz mit 32.768 kHz sorgt für die genaue Zeitmessung. Des Weiteren waren noch ein Batteriehalter für eine CR2032
Knopfzelle und ein Pinheader für die Programmierung des Mikrocontrollers vorgesehen.

### Design der Leiterplatte

{{< figure
src="/images/binary_clock/schaltplan.png"
alt="Die Vorderseite der Leiterplatte der Binäruhr"
width="800"
caption="Der Schaltplan der Leiterplatte"
>}}

{{< figure
src="/images/binary_clock/cnc-1.gif"
alt="Die Platine wird gefräst"
width="400"
caption="Die Platine wird gefräst"
>}}

Die Leiterplatte wurde mit KiCad entworfen und anschließend mit der CNC-Fräse der HTWK gefertigt. Die Platine konnte
von beiden Seiten bestückt werden, was beim Leiterplattendesign berücksichtigt werden musste. Wichtig waren hier vor
allem zu beachten, das alle Anschlüsse des ATmega korrekt platziert sind, um eine einfache Verdrahtung zu ermöglichen.

| Vorderseite                                    | Rückseite                                     |
|------------------------------------------------|-----------------------------------------------|
| ![](/images/binary_clock/pcb_vorderseite.jpeg) | ![](/images/binary_clock/pcb_rueckseite.jpeg) |

#### Anschlüsskonfiguration der Bauteile

| Bauteil        | Anschluss auf Platine | Funktion                      |
|----------------|-----------------------|-------------------------------|
| LED            | PD3 - PD7             | Anzeigen der Stunden          |
| LED            | PC0 - PC5             | Anzeigen der Minuten-Anzeige  |
| Taster         | PB0, PB1, PD2         | Bedienung der Uhr             |
| Uhrenquarz     | PB6 + PB7             | Steuerung des internen Timers |
| Batteriehalter | VCC + GND             | Stromversorgung               |

### Löten und Zusammenbau

Nach dem die Platine designed und gefräst war, wurden alle Bauteile von Hand aufgelötet. Dies erforderte präzises
Arbeiten, insbesondere bei dem ATmega48A, da bei diesem jeder der 28 Pins korrekt mit der Platine verbunden werden
musste. Die LEDs wurden tiefer in die Platine eingelötet, damit sie nicht abbrechen.

| Vorderseite                                        | Rückseite                                         |
|----------------------------------------------------|---------------------------------------------------|
| ![](/images/binary_clock/platine_vorderseite.jpeg) | ![](/images/binary_clock/platine_rueckseite.jpeg) |

## Programmierung

### Grundlegendes

Die Programmierung der Binäruhr erfolgte in C unter Verwendung der AVR-Library für den ATmega48A Mikrocontroller. Die
Uhrzeit wird intern als `Struct` mit Stunden und Minuten gespeichert und über die zwei LED-Gruppen im Binärformat
angezeigt.

```C
typedef struct {
    uint8_t hours;
    uint8_t minutes;
} time_t;
```

### Uhrenlogik

Die Uhrzeit wird mittels Timer2 und einem 32.768 kHz Uhrenquarz präzise gemessen. Die Initialisierung erfolgt in der
Funktion `setup_timer2_asynchronous()`, bei der Timer2 in den asynchronen Modus versetzt wird (`ASSR |= (1 << AS2)`),
sodass er direkt vom Quarz getaktet wird. Der Timer erhält einen Prescaler von 128, wodurch
die Überlauf-Intervalle genau auf die Sekunde abgestimmt werden. Der Prescaler von 128 wird gewählt, weil er zusammen
mit dem 32.768 kHz-Quarz dafür sorgt, dass der Timer2-Überlauf exakt einmal pro Sekunde auftritt. Das ergibt sich aus
der Formel:

```
Sekunden = (Quarzfrequenz / Prescaler) / 256
```

Mit 32.768Hz / 128 = 256 Hz, und 256 Timer-Schritte (8-Bit-Timer) ergibt genau 1 Hz, also einen Überlauf pro Sekunde. So
kann die Uhrzeit sekundengenau gezählt werden.
Die Interrupt-Service-Routine (ISR) für den Timer2-Overflow (`ISR(TIMER2_OVF_vect)`) erhöht bei jedem Aufruf die
Sekunden. Sobald die 60 Sekunden erreicht werden
startet der Zähler wieder bei 0 und es wird eine Minute inkrementiert. Analog dazu werden bei 60
Minuten die Stunden erhöht, und bei 24 Stunden wird wieder auf 0:00 Uhr gesetzt.

### Helligkeitssteuerung

Die Helligkeitssteuerung der LEDs erfolgt
mittels [Pulsweitenmodulation (PWM)](https://de.wikipedia.org/wiki/Pulsdauermodulation), wodurch die Helligkeit in
mehreren Stufen
angepasst werden kann. Im Prinzip werden die LEDs sehr schnell ein- und ausgeschaltet, sodass das menschliche Auge
dies als unterschiedliche Helligkeitsstufen wahrnimmt. Je länger die LEDs eingeschaltet sind, desto heller erscheinen
sie.

#### Pulsweitenmodulation (PWM)

Ein PWM-Zyklus besteht aus mehreren 12 Phasen. In jeder Phase wird geprüft, ob die LED leuchten soll
oder nicht. Je nach gewählter Helligkeitsstufe ist die LED für mehr oder weniger Phasen eingeschaltet.
Ist sie z.B. 8 von 12 Phasen an, wirkt sie heller als wenn sie nur 2 von 12 Phasen leuchtet.

Die Entscheidung, ob eine LED im aktuellen PWM-Zyklus an oder aus ist, erfolgt durch einen Vergleich innerhalb der ISR.
Dabei wird die Variable `current_pwm_step` (aktueller Schritt im Zyklus) mit dem Wert `(max_dimming_steps -
current_dimming_step + 1)` verglichen:
`max_pwm_steps` gibt die Gesamtzahl der Schritte pro PWM-Zyklus vor, in diesem Fall 12.
`current_pwm_step` zählt von `0` bis `max_pwm_steps - 1`.
Die LED ist an, solange `current_pwm_step < (max_dimming_steps - current_dimming_step + 1)` gilt.
Ist der Wert größer oder gleich, ist die LED aus.
Dadurch ergibt sich das Tastverhältnis: Je niedriger `current_dimming_step`, desto länger ist die LED an (heller). Je
höher der Wert, desto kürzer ist sie an (dunkler).
**Beispiel**

```
max_pwm_steps = 12 
max_dimming_steps = 4 
current_dimming_step = 2 // mittlere Helligkeit

current_pwm_step < max_dimming_steps - current_dimming_step + 1
→ (4 - 2 + 1) = 3
→ current_pwm_step < 3
```

Die LED ist in den ersten 3 von 12 Schritten an, danach aus. Das ergibt eine dunkle Stufe.

#### Timer1 Konfiguration

Die PWM wird über den Timer1 realisiert. Dieser wird als Compare Match Interrupt genutzt. Ein Compare Match Interrupt
ist ein spezieller Interrupt, welcher ausgelöst wird, wenn der aktuelle Zählerstand des Timers mit einem vorher
festgelegten Vergleichswert (Compare Value) übereinstimmt. Des Weiteren wird der Tmer im CTC-Modus betrieben, was für "
Clear Timer on Compare Match" steht und bedeutet, dass der Timer nach jedem erreichen des Vergleichswerts auf 0
zurückgesetzt wird. Diese Konfigurationen finden in der Funktion`setup_timer1_for_pwm()`statt.

### Stromsparmodus

Der Stromsparmodus wird aktiviert, wenn die Uhr für eine bestimmte Zeit (Standard 2:30 Minuten) nicht bedient wird. In
diesem
Modus werden die meisten Funktionen der Uhr deaktiviert, um den Stromverbrauch zu minimieren. Der Mikrocontroller
wird in den Power-Down-Modus versetzt, wodurch nur noch der Timer2 aktiv bleibt, um die Zeit weiter zu zählen. Sobald
eine der
Tasten gedrückt wird, wird der Stromsparmodus verlassen und die Uhr kehrt in den normalen Betriebsmodus zurück.

### Extras

#### Startsequenz

Beim anschalten der Uhr wird ein Start-Pattern auf den LEDs angezeigt, um zu signalisieren, dass die Uhr betriebsbereit
ist. Danach wechselt die Uhr auf die gesetzte Startzeit (Standard 12:00 Uhr).

{{< figure
src="/images/binary_clock/startup_sequence.gif"
alt="Die Uhr wird eingeschaltet"
width="400"caption="Die Uhr wird eingeschaltet"
>}}

#### Genauigkeitsmessung

Des Weiteren ist noch ein Modus implementiert, in dem die Genauigkeit der Uhr überprüft werden kann. Dieser wechselt
am PIN PD0 jede Sekunde den Zustand, sodass mit einem Oszilloskop die Frequenz des Quarzes gemessen werden kann.
Dies dient dazu, dass die Abweichung der Uhrzeit überprüft werden kann.
