import { Component } from '@angular/core'
import { RouterLink } from '@angular/router'

@Component({
  selector: 'app-composant-navbar',
  imports: [RouterLink],
  templateUrl: './composant-navbar.html',
  styleUrl: './composant-navbar.css',
})
export class ComposantNavbar {
  menuOuvert = false

  toggleMenu() {
    this.menuOuvert = !this.menuOuvert
  }

  fermerMenu() {
    this.menuOuvert = false
  }
}
