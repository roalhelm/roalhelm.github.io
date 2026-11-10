# letmetrythis Designvorlage v1.0

Eine gemeinsame Vorlage für alles, was unter letmetrythis.dev läuft: Blog, Projektseiten, Apps wie LeckerBierchen und Grafiken für LinkedIn. Die Werte stammen direkt aus dem bestehenden Blog (`assets/css/styles.css`) und dem App-Theme von LeckerBierchen (`lib/core/theme/app_theme.dart`).

## Inhalt des Ordners

| Datei | Wofür |
|---|---|
| `tokens.css` | Alle Farben, Schriften, Abstände, Radien, Schatten als CSS-Variablen. Die eine Quelle der Wahrheit. |
| `components.css` | Fertige Bausteine: Buttons, Karten, Pills, Tags, Zitat, Callout, Formular, Header, Footer. |
| `vorschau.html` | Lebende Übersicht aller Tokens und Bausteine, mit Umschalter Hell/Dunkel und Blog/App. |
| `social-vorlage.html` | Vorlage für LinkedIn- und Blog-Vorschaubilder (1200 x 627 px). |
| `beispiel-social-*.png` | So sieht die Social-Vorlage in Blog- und App-Variante aus. |
| `flutter/brand_theme.dart` | Dieselben Tokens als Flutter-Theme für neue Apps. |
| `fonts/` | Inter und JetBrains Mono (Open Font License), selbst gehostet, kein Google-Fonts-Aufruf. |

## Grundidee

- **Dunkel zuerst.** Nachtblau ist der Standard, Hell ist die Variante.
- **Zwei Markenfarben, ein System.** Cyan steht für Blog und Tech-Themen, Teal für Apps und Produkte. Alles andere bleibt gleich.
- **Bernstein ist der Akzent.** Für Status, Badges, "Neu" und das `> ` vor Eyebrows. Sparsam einsetzen, höchstens ein bis zwei Stellen pro Ansicht.
- **Terminal-Anmutung.** Mono-Schrift für Labels, Metadaten und Code, das `> ` als Prompt, optional der blinkende Cursor hinter der Hauptüberschrift.
- **Keine Emojis** in Texten, Buttons oder Grafiken.

## Farben

| Rolle | Dunkel | Hell | Token |
|---|---|---|---|
| Hintergrund | `#0B1120` | `#F4F8FB` | `--bg` |
| Fläche / Karte | `#101A2C` | `#FFFFFF` | `--surface` |
| Linie | `#1E2D47` | `#D8E3EC` | `--line` |
| Text | `#E6EDF7` | `#0F1B2D` | `--text` |
| Gedämpfter Text | `#94A3B8` | `#556275` | `--muted` |
| Primär Blog (Cyan) | `#22D3EE` | `#0E7490` | `--primary` |
| Primär App (Teal) | `#5EEAD4` | `#0F766E` | `--primary` mit `data-brand="app"` |
| Akzent (Bernstein) | `#F5A524` | `#B45309` | `--accent` |
| Fehler | `#F87171` | `#B42318` | `--danger` |
| Erfolg | `#4ADE80` | `#15803D` | `--success` |

Regeln:
- In Komponenten immer die semantischen Tokens (`--primary`, `--text` ...) verwenden, nie Hex-Werte. Dann funktionieren Hell/Dunkel und Blog/App automatisch.
- Text auf Primärfarbe ist `--on-primary`, Text auf Bernstein ist `--on-accent`.
- Für zarte Hintergründe gibt es `--primary-soft` und `--accent-soft` (ca. 12 % Deckkraft).

## Typografie

- **Inter** für alles Lesbare. Überschriften in 800, eng gesetzt (`letter-spacing: -0.045em`, Zeilenhöhe 1.08).
- **JetBrains Mono** für Eyebrows, Metadaten, Tags, Code.

| Stufe | Größe | Token |
|---|---|---|
| H1 | 2,6 bis 4,6 rem (fließend) | `--fs-h1` |
| H2 | 2 bis 3 rem | `--fs-h2` |
| H3 | 1,25 rem | `--fs-h3` |
| Lead | 1,15 rem, gedämpft | `--fs-lg` |
| Fließtext | 1 rem, Zeilenhöhe 1,6 | `--fs-base` |
| Klein / Button klein | 0,9 rem | `--fs-sm` |
| Meta / Tags | 0,78 rem | `--fs-xs` |

H1 auf maximal 14 Zeichen pro Zeile begrenzen, Lead-Text auf 58 Zeichen. Ein Wort der Überschrift darf in der Primärfarbe stehen (`.hl`).

## Abstände, Radien, Schatten

- 4-px-Raster: `--space-1` (4) bis `--space-9` (80). Zwischen Abschnitten `--space-8` (64), innerhalb von Karten `--space-5` (24).
- Inhaltsbreite 1120 px, Textseiten 780 px.
- Radien: Tags 6, Bilder und Inputs 12, Karten 20, App-Icons 24, Buttons und Pills rund (999).
- Schatten: `--shadow-soft` für Karten, `--shadow-glow` als Hover-Leuchten in der Primärfarbe.

## Bausteine (components.css)

| Klasse | Einsatz |
|---|---|
| `.eyebrow` | Kleines Mono-Label über Überschriften, kleingeschrieben, mit `> ` in Bernstein |
| `.label-caps` | Versalien-Label mit Sperrung, für Grafiken und App-Kopfzeilen |
| `.btn`, `.btn-secondary`, `.btn-accent`, `.btn-sm` | Buttons; pro Ansicht nur ein Primär-Button |
| `.card`, `.card-link`, `.card-featured` | Karte, Karte mit Hover, Karte mit Verlaufsrand |
| `.pill`, `.pill-primary`, `.pill-solid` | Status und Hinweise; `.pill-solid` ist das Bernstein-Badge aus den LinkedIn-Grafiken |
| `.chip` | Eigenschaften wie "Kein Account", "Läuft lokal" |
| `.tag`, `.tag-list` | Themen-Tags in Mono |
| `blockquote`, `.callout`, `.callout-warn` | Zitat, Hinweisbox |
| `.input` | Eingabefeld |
| `.site-header`, `.brand`, `.nav`, `.site-footer` | Seitenrahmen |

## So nutzt du die Vorlage

### Neue Website oder Projektseite

1. Ordner `designvorlage` ins Projekt kopieren (oder nur `tokens.css`, `components.css`, `fonts/`).
2. Im `<head>` einbinden:
   ```html
   <link rel="stylesheet" href="designvorlage/tokens.css">
   <link rel="stylesheet" href="designvorlage/components.css">
   ```
3. Für App-/Produktseiten `<html data-brand="app">` setzen, für Hell `data-theme="light"`.
4. Den Aufbau aus `vorschau.html` übernehmen.

### Neue Flutter-App

1. `flutter/brand_theme.dart` nach `lib/core/theme/` kopieren.
2. In `MaterialApp`: `theme: BrandTheme.light()`, `darkTheme: BrandTheme.dark()`.
3. Für ein Tech-Tool statt Teal: `BrandTheme.light(primary: BrandColors.cyan700)`.

### LinkedIn- oder Blog-Vorschaubild

1. `social-vorlage.html` kopieren, Badge, Titel, Untertitel, Chips und rechte Fläche anpassen.
2. Für App-Themen `<html lang="de" data-brand="app">`.
3. Exportieren mit Playwright (2x für scharfe Bilder, ergibt 2400 x 1254):
   ```js
   const { chromium } = require('playwright');
   const b = await chromium.launch();
   const p = await b.newPage({ viewport: { width: 1200, height: 627 }, deviceScaleFactor: 2 });
   await p.goto('file:///pfad/zu/social-vorlage.html');
   await p.screenshot({ path: 'linkedin.png' });
   ```
   Alternativ im Browser auf 1200 x 627 öffnen und einen Screenshot machen.

Aufbau der Grafik: links oben Logo und Name, darunter Bernstein-Badge, Titel in zwei Zeilen mit einem Wort in Primärfarbe, ein bis zwei Sätze Untertitel, bis zu drei Chips, unten "Mehr im Blog: letmetrythis.dev". Rechts das Motiv (App-Mockup, Code, Screenshot).

## Checkliste vor dem Veröffentlichen

- Nur Tokens, keine frei gewählten Farben
- Ein Primär-Button pro Ansicht, Bernstein höchstens zweimal
- Überschrift eng gesetzt, Inter 800
- Labels und Metadaten in JetBrains Mono
- Hell und Dunkel geprüft
- Keine Emojis

## Wo die Vorlage liegt

Im Blog-Repo unter `designvorlage/`. Die Vorschau ist online unter https://letmetrythis.dev/designvorlage/vorschau.html erreichbar (nicht in Suchmaschinen gelistet). Änderungen an Farben oder Bausteinen zuerst hier in `tokens.css` bzw. `components.css` machen und dann in die Projekte übernehmen.
