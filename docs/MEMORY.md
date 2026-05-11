# MEMORY.md — LocaRial Angular Project

## Projet
- **Nom** : LocaRial
- **Description** : Plateforme de gestion du matériel informatique
- **Stack** : Angular 21, Standalone Components, Signals, Router
- **Cible utilisateurs** : < 25 ans
- **Cours suivi** : moodle.sio-carriat.com — B2-3 SLAM Angular

---

## Composants

### AppComponent (`src/app/app.ts`)
- Composant racine — coquille vide
- Contient uniquement `<router-outlet />`
- Imports : `RouterOutlet`

### AccueilComponent (`src/app/accueil/`)
- Page d'accueil de l'application
- Route par défaut : `{ path: '', component: Accueil }`
- Layout : hero sombre + 2 colonnes (main + sidebar) + footer sombre
- CSS scopé dans `accueil.css`

---

## Routing

- Fichier de config : `src/app/app.routes.ts`
- `provideRouter(routes)` déclaré dans `app.config.ts`
- Routes actuelles :
  - `''` → `AccueilComponent`

---

## Design System — Inspiré CSS Zen Garden

### Référence visuelle
Style CSS Zen Garden : nature, élégance, typographie soignée, sections alternées, layout 2 colonnes.

### Couleurs (variables CSS)
| Variable | Valeur | Usage |
|---|---|---|
| `--color-dark` | `#2d4a3e` | Header / footer fond |
| `--color-dark-2` | `#1a2f27` | Dégradé sombre |
| `--color-sage` | `#c8d8c8` | Bordures, séparateurs |
| `--color-sage-light` | `#e4ede4` | Fond sections alternées, sidebar |
| `--color-white` | `#ffffff` | Fond sections principales |
| `--color-text` | `#2a2a2a` | Texte principal |
| `--color-text-light` | `#555` | Texte paragraphes |
| `--color-accent` | `#4a8c6f` | Liens hover, accents |

### Typographie
- Police : `Georgia, serif` (élégant, classique)
- Titres sections : majuscules, `letter-spacing: 0.08em`, `1.4rem`
- Titre hero : `3rem`, gras, `letter-spacing: 0.06em`
- Corps texte : `0.95rem`, `line-height: 1.8`

### Layout
- **Hero** : fond sombre dégradé vert-forêt, logo cercle minimaliste, bouton CTA transparent
- **Corps** : flex row — `main-content` (flex:1) + `sidebar` (260px fixe)
- **Sections** : alternance `.section-white` / `.section-sage`
- **Footer** : fond sombre, texte italique centré, icônes cercle

### Règles Design à respecter
1. Toujours alterner `.section-white` / `.section-sage` pour les sections
2. Titres toujours en `text-transform: uppercase` + `letter-spacing`
3. Bordures séparatrices sous les titres h2 : `border-bottom: 2px solid var(--color-sage)`
4. Liens sidebar : uppercase, hover avec `padding-left` et `color-accent`
5. Ne jamais utiliser de couleurs hors du Design System ci-dessus

---

## Signals
- Angular 21 utilise les Signals modernes (`signal()`, `WritableSignal`, `computed`)
- Import depuis `@angular/core`
- Syntaxe template : `{{ maValeur() }}`

---

## Leçons apprises

1. **AppComponent = coquille** : ne jamais mettre de contenu de page dans AppComponent. Il ne contient que `<router-outlet />` et les zones fixes globales.
2. **CSS scopé** : chaque composant a son propre CSS. Un style dans `accueil.css` n'est pas disponible dans un autre composant.
3. **`RouterOutlet` doit être dans les `imports[]`** du décorateur `@Component`, pas seulement importé en haut du fichier.
4. **Route par défaut** : `path: ''` sans slash pour la page d'accueil.
5. **Variables CSS avec `:host`** : dans un composant Angular standalone, déclarer les variables CSS dans `:host {}` pour les scoper au composant.
