import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'
import { Materiel } from '../../models/materiel.model'
import { Categorie } from '../../models/categorie.model'
import { environment } from '../../environments/environment'
import { Auth } from './auth'
import { Reservation } from '../../models/reservation.model'

@Injectable({
  providedIn: 'root',
})
export class MaterielService {

  // URL de l'API récupérée depuis le fichier environment
  private apiLien = environment.apiUrl

  constructor(private http: HttpClient, private authService: Auth) { }

  // Récupère tous les matériels depuis l'API
  getMaterielApi(): Observable<Materiel[]> {
    return this.http.get<Materiel[]>(`${this.apiLien}/Materiel/Search`)
  }

  // Récupère toutes les catégories depuis l'API
  getCategoriesApi(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiLien}/Categorie/Search`)
  }

  // Récupère les catégories avec leurs matériels associés
  getCategoriesAvecMateriels(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiLien}/Categorie/CategoriesAvecMateriels`)
  }

  // Supprime un matériel via l'API - retourne Observable pour subscribe dans le composant
  supprimerModele(modele: Materiel): Observable<any> {
    return this.supprimlerMaterielApi({ Id: modele.id, NomMateriel: modele.nomMateriel })
  }

  // Modifie un matériel via l'API - retourne Observable pour subscribe dans le composant
  modifierModele(modele: Materiel): Observable<any> {
    return this.modifierMaterielApi(modele)
  }

  // Crée une nouvelle réservation avec token JWT
  creerReservation(reservation: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.post(`${this.apiLien}/Reservation/Add`, reservation, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Récupère toutes les réservations pour l'admin
  getToutReservations(): Observable<Reservation[]> {
    const token = this.authService.getTokenJwt()
    return this.http.get<Reservation[]>(`${this.apiLien}/Reservation/Search`, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Met à jour le statut d'une réservation (accepter/refuser)
  updateStatutReservation(reservation: Reservation): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Reservation/UpdateStatut`, reservation, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Récupère les réservations d'un utilisateur spécifique
  getReservationsUtilisateur(idUtilisateur: number): Observable<Reservation[]> {
    const token = this.authService.getTokenJwt()
    return this.http.get<Reservation[]>(`${this.apiLien}/Reservation/Search?IdUtilisateur=${idUtilisateur}`, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Modifie un matériel existant via PUT /Materiel/Update avec token JWT admin
  modifierMaterielApi(materiel: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Materiel/Update`, materiel, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Supprime un matériel via DELETE /Materiel/Delete avec token JWT admin
  supprimlerMaterielApi(materiel: any): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.delete(`${this.apiLien}/Materiel/Delete`, {
      headers: { Authorization: `Bearer ${token}` },
      body: materiel
    })
  }

  // Ajoute un nouveau matériel via POST /Materiel/Add avec token JWT admin
  ajouterMaterielApi(materiel: Materiel): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.post(`${this.apiLien}/Materiel/Add`, materiel, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Ajoute une nouvelle catégorie via PUT /Categorie/Add avec token JWT admin
  ajouterCatergorieApi(categorie: Categorie): Observable<any> {
    const token = this.authService.getTokenJwt()
    return this.http.put(`${this.apiLien}/Categorie/Add`, categorie, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }

  // Vérifie si un matériel est disponible sur une période donnée
  verifierDisponibilite(idMateriel: number, dateDebut: string, dateFin: string): Observable<any> {
    return this.http.get<any>(`${this.apiLien}/Reservation/Disponibilite?idMateriel=${idMateriel}&dateDebut=${dateDebut}&dateFin=${dateFin}`)
  }
}