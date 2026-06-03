import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'
import { environment } from '../../environments/environment'
import { Utilisateur } from '../../models/utilisateur.model'

@Injectable({
  providedIn: 'root',
})
export class Auth {
  
  // URL de l'API récupérée depuis le fichier environment
  private apiLien = environment.apiUrl
  role: string = 'visiteur'

  constructor(private http: HttpClient) {}

  // Connexion de l'utilisateur avec email et mot de passe
  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiLien}/Auth/Login`, { email, password })
  }

  // Inscription d'un nouvel utilisateur
  register(data: any): Observable<any> {
    return this.http.post(`${this.apiLien}/Auth/Register`, data)
  }

  // Vérifie si l'utilisateur connecté a le rôle Admin via le localStorage
  estUnAdmin(): boolean {
    return localStorage.getItem('role') === 'Admin'
  }

  // Sauvegarde le rôle de l'utilisateur dans le localStorage
  sauvegarderRole(role: string) {
    localStorage.setItem('role', role)
  }

  // Sauvegarde le token JWT dans le localStorage
  sauvegarderTokenJwt(token: string) {
    localStorage.setItem('tokenJwt', token)
  }

  // Récupère le token JWT depuis le localStorage
  getTokenJwt(): string | null {
    return localStorage.getItem('tokenJwt')
  }

  // Vérifie si l'utilisateur est connecté en vérifiant la présence du token
  estConnecter(): boolean {
    return this.getTokenJwt() !== null
  }

  // Récupère les informations de l'utilisateur connecté depuis l'API Auth/Me
  getUtilisateurConnecte(): Observable<Utilisateur> {
    const token = this.getTokenJwt()
    return this.http.get<Utilisateur>(`${this.apiLien}/Auth/Me`, {
      headers: { Authorization: `Bearer ${token}` }
    })
  }
}