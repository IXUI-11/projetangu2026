# MIGRATION_TRACKING.md — Suivi des modifications à propager

---

## [2026-04-09] Création AccueilComponent + mise en place du routing

### Modifications effectuées
| Fichier modifié | Ce qui a changé |
|---|---|
| `src/app/app.html` | Vidé → `<router-outlet />` uniquement |
| `src/app/app.css` | Vidé (CSS déplacé dans accueil.css) |
| `src/app/app.ts` | Suppression contenu inutile, ajout `RouterOutlet` dans imports |
| `src/app/app.routes.ts` | Ajout route `''` → `AccueilComponent` |
| `src/app/accueil/accueil.html` | CRÉÉ — contenu page d'accueil (navbar + hero + cards) |
| `src/app/accueil/accueil.css` | CRÉÉ — CSS page d'accueil |
| `src/app/accueil/accueil.ts` | CRÉÉ — composant standalone |

### A faire / propager
- [ ] La **navbar** est actuellement dans `AccueilComponent` — quand on créera d'autres pages, il faudra l'extraire dans un `HeaderComponent` global (comme le cours le suggère)
- [ ] Le fond `aqua` du hero est temporaire — à remplacer par une couleur du Design System
- [ ] Les liens de la navbar (`href="#"`) sont des placeholders — à remplacer par `routerLink` quand les routes seront créées
- [ ] Créer un `HeaderComponent` global à placer dans `AppComponent` (leçon Services / restructuration)
