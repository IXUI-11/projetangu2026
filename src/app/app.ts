import { Component } from '@angular/core'
import { RouterOutlet } from '@angular/router'
import { ComposantNavbar } from './composant-navbar/composant-navbar'
@Component({
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.css',
  imports: [RouterOutlet, ComposantNavbar],
})
export class App {}
