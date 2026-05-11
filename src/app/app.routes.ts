import { Routes } from '@angular/router'
import { Accueil } from './accueil/accueil'
import { ComposantCatalogue } from './composant-categorie/composant-categorie'
import { ComposantConnexion } from './composant-connexion/composant-connexion'
import { ComposantContact } from './composant-contact/composant-contact'
import { ComposantAdmin } from './composant-admin/composant-admin'
import { ComposantUtlisateurs } from './composant-utlisateurs/composant-utlisateurs'

export const routes: Routes = [
  { path: '', component: Accueil },
  { path: 'catalogue', component: ComposantCatalogue },
  { path: 'connexion', component: ComposantConnexion },
  { path: 'contact', component: ComposantContact },
  { path: 'admin', component: ComposantAdmin },
  {path:'utlisateurs' , component : ComposantUtlisateurs}
]
