# LetMeTryThis.dev Starter Kit

Modernes, helles und vollstaendig statisches GitHub Pages Starter Kit fuer **LetMeTryThis.dev**.

## Enthalten

- Helles responsives Design
- Startseite mit Hero, Projektuebersicht, Blog und App-Store-Bereich
- Beispielseiten fuer Blog, Projekte und Apps
- GitHub Actions Workflow fuer GitHub Pages
- `.nojekyll` fuer reines statisches Hosting
- `CNAME` fuer `letmetrythis.dev`

## Schnellstart

```bash
git init
git add .
git commit -m "Initial LetMeTryThis.dev static site"
git branch -M main
git remote add origin https://github.com/DEIN-USER/DEIN-REPO.git
git push -u origin main
```

## GitHub Pages aktivieren

1. Repository auf GitHub oeffnen.
2. **Settings > Pages** oeffnen.
3. Unter **Build and deployment** als Source **GitHub Actions** auswaehlen.
4. Danach erneut nach `main` pushen oder den Workflow manuell starten.

## Domain

Die Datei `CNAME` ist bereits auf `letmetrythis.dev` gesetzt. Bei Cloudflare muss die Domain per DNS auf GitHub Pages zeigen.

Typische Records:

```text
CNAME  www  DEIN-USER.github.io
A      @    185.199.108.153
A      @    185.199.109.153
A      @    185.199.110.153
A      @    185.199.111.153
```

Passe `DEIN-USER` an deinen GitHub Account an.

## Struktur

```text
.
├── .github/workflows/pages.yml
├── assets/css/styles.css
├── assets/js/main.js
├── assets/img/logo.svg
├── apps/index.html
├── blog/welcome.html
├── blog/intune-automation-ideen.html
├── projects/intune-script-toolkit.html
├── projects/local-ai-coding-lab.html
├── projects/weekend-app-experiments.html
├── about.html
├── index.html
├── CNAME
└── .nojekyll
```

## Anpassen

- Texte in `index.html` ersetzen.
- Farben in `assets/css/styles.css` unter `:root` anpassen.
- Neue Blogposts als HTML-Datei unter `blog/` anlegen und in `index.html` verlinken.
- Neue Projekte unter `projects/` anlegen und in der Projektuebersicht verlinken.
