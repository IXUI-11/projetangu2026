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
  menuOuvert = false


  constructor(private authService: Auth , private router : Router) {}

  toggleMenu() {
    this.menuOuvert = !this.menuOuvert
  }

  fermerMenu() {
    this.menuOuvert = false
  }

  estConnecte(): boolean {
    return this.authService.estConnecter()
  }

  seDeconnecter() {
    localStorage.removeItem('tokenJwt')
    this.router.navigate(['/connexion'])
    this.fermerMenu()
  }

  estAdmin(): boolean {
  return this.authService.estUnAdmin()

}


}
