import { Component } from '@angular/core'
import { Router, RouterLink } from '@angular/router'
import { Auth } from '../services/auth'

@Component({
  selector: 'app-composant-navbar',
  imports: [RouterLink],
  templateUrl: './composant-navbar.html',
  styleUrl: './composant-navbar.css',
})
export class ComposantNavbar {
  // état du menu hamburger (mobile)
  menuOuvert = false

  constructor(private authService: Auth, private router: Router) {}

  // ouvre/ferme le menu hamburger
  toggleMenu() {
    this.menuOuvert = !this.menuOuvert
  }

  // ferme le menu hamburger
  fermerMenu() {
    this.menuOuvert = false
  }

  // vérifie si l'utilisateur est connecté via le token JWT
  estConnecte(): boolean {
    return this.authService.estConnecter()
  }

  // déconnecte l'utilisateur en supprimant le token et redirige vers /connexion
  seDeconnecter() {
    localStorage.removeItem('tokenJwt')
    this.router.navigate(['/connexion'])
    this.fermerMenu()
  }

  // vérifie si l'utilisateur connecté a le rôle Admin
  estAdmin(): boolean {
    return this.authService.estUnAdmin()
  }
}