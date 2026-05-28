import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'
import { Materiel } from '../../models/materiel.model'
import { Categorie } from '../../models/categorie.model'
import { environment } from '../../environments/environment'
import { Auth } from './auth'

@Injectable({
  providedIn: 'root',
})
export class MaterielService {

  private apiLien = environment.apiUrl

  constructor(private http: HttpClient, private authService: Auth) { }

  getMaterielApi(): Observable<Materiel[]> {
    return this.http.get<Materiel[]>(`${this.apiLien}/Materiel/Search`)
  }

  // end point pour les catégories
  getCategoriesApi(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiLien}/Categorie/Search`)
  }

  getCategoriesAvecMateriels(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiLien}/Categorie/CategoriesAvecMateriels`)
  }

  supprimerCategorie(categorie: Categorie) {
    // TODO : appel API plus tard
    console.log('Supprimer', categorie.libelleCategorie)
  }

  modifierCategorie(categorie: Categorie) {
    // TODO : appel API plus tard
    console.log('Modifier', categorie.libelleCategorie)
  }

  // retourne Observable pour pouvoir subscribe dans le composant
  supprimerModele(modele: Materiel): Observable<any> {
    return this.supprimlerMaterielApi({ Id: modele.id, NomMateriel: modele.nomMateriel })
  }

  // ! Partie Admin pour modifier un matériel 23/05/26
  // retourne Observable pour pouvoir subscribe dans le composant
  modifierModele(modele: Materiel): Observable<any> {
    return this.modifierMaterielApi(modele)
  }

  // Pour creé une réservation 23/05/26
  creerReservation(reservation: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.post(`${this.apiLien}/Reservation/Add`, reservation, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // ! Partie Admin pour récuprer tout les réservations 23/05/26
  getToutReservations(): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.get<any>(`${this.apiLien}/Reservation/Search`, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // ! Partie Admin pour mettre à jour le statut 23/05/26
  updateStatutReservation(reservation: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Reservation/UpdateStatut`, reservation, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // ! Pour afficher les réservations de l'utilisateur 28/05/26
  getReservationsUtilisateur(idUtilisateur: number): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.get<any>(`${this.apiLien}/Reservation/Search?IdUtilisateur=${idUtilisateur}`, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  modifierMaterielApi(materiel: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Materiel/Update`, materiel, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  supprimlerMaterielApi(materiel: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.delete(`${this.apiLien}/Materiel/Delete`, {
      headers: { Authorization: `Bearer ${token}` },
      body: materiel
    })
  }

  ajouterMaterielApi(materiel: Materiel): Observable<any> {
    const token = this.authService.getTokenJwt();
    return this.http.post(`${this.apiLien}/Materiel/Add`, materiel, {
      headers: { Authorization: `Bearer ${token}` }
    });
  }

  ajouterCatergorieApi(categorie: Categorie): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Categorie/Add`, categorie, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }
}
