import { Component, OnInit, OnDestroy } from '@angular/core'
import { FormsModule } from '@angular/forms'
import { Auth } from '../services/auth'
import { Router } from '@angular/router'

@Component({
  selector: 'app-composant-connexion',
  imports: [FormsModule],
  templateUrl: './composant-connexion.html',
  styleUrl: './composant-connexion.css',
})
export class ComposantConnexion implements OnInit, OnDestroy {
  email: string = ''
  motDePasse: string = ''
  nom: string = ''
  prenom: string = ''
  switchFormulaire: boolean = false

  constructor(private authService: Auth , private router : Router) {}


  // ! empêche le scroll de la page quand le composant est affiché
  ngOnInit(): void {
    document.body.style.overflow = 'hidden'
  }

  ngOnDestroy(): void {
    document.body.style.overflow = ''
  }


  // ! affiche le token jwt dans la console
  // seConnecter() {
  //   this.authService.login(this.email, this.motDePasse).subscribe({
  //     next: (data: any) => console.log('Connecté', data),
  //     error: (err: any) => console.log(err)
  //   })
  // }

  seConnecter() {
  this.authService.login(this.email, this.motDePasse).subscribe({
    next: (reponseApiJwt: any) => {
      this.authService.sauvegarderTokenJwt(reponseApiJwt.accessToken)
      console.log('Connecté !')
      this.router.navigate(['/']) // ← redirige vers l'accueil
    },
    error: (err: any) => console.log(err.error)
  })
  }


 sInscrire() {
    this.authService.register({
      email: this.email,
      password: this.motDePasse,
      nom: this.nom,
      prenom: this.prenom
    }).subscribe({
      next: (reponseApiJwt: any) => {
        this.authService.sauvegarderTokenJwt(reponseApiJwt.accessToken)
        this.router.navigate(['/']) // ← redirige vers l'accueil
      },
      error: (err: any) => console.log(err.error)
    })
  }

  changerFormulaire(): void {
    this.switchFormulaire = !this.switchFormulaire
  }
}
