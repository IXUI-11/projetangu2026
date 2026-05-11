import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'
import { environment } from '../../environments/environment'

@Injectable({
  providedIn: 'root',
})
export class Auth {
  
  //avant le fichier environment.ts et environment.dev.ts et environment.prod.ts
  //  private apiLien = 'http://localhost:5000/'
  private apiLien = environment.apiUrl
  role: string = 'visiteur'

  constructor(private http: HttpClient) {}

  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.apiLien}/Auth/Login`, { email, password })
  }

  register(data: any): Observable<any> {
    return this.http.post(`${this.apiLien}/Auth/Register`, data)
  } 

  estUnAdmin(): boolean {
    return this.role === 'admin'
  }

  sauvegarderTokenJwt(token: string) {
    localStorage.setItem('tokenJwt', token)
  }

  getTokenJwt(): string | null {
    return localStorage.getItem('tokenJwt')
  }

  estConnecter(): boolean {
    return this.getTokenJwt() !== null
  }
}
