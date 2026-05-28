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
  codePostal: number = 0
  ville: string = ''
  rue: string = ''
  numerodetelephone: number = 0
  switchFormulaire: boolean = false


  constructor(private authService: Auth, private router: Router) { }


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


  /**
   * Gère le processus d'authentification de l'utilisateur.
   * * Cette méthode envoie les identifiants (email et mot de passe) au service d'authentification.
   * En cas de succès :
   * 1. Sauvegarde le token JWT retourné par l'API.
   * 2. Parcourt les rôles de l'utilisateur pour vérifier s'il possède les droits d'administrateur.
   * 3. Sauvegarde le rôle correspondant ('Admin' ou 'User') via le service d'authentification.
   * 4. Redirige l'utilisateur vers la route appropriée (/admin pour les administrateurs, /utlisateurs pour les clients).
   * * En cas d'échec (ex: mauvais identifiants), l'erreur est interceptée et affichée dans la console.
    **/
  seConnecter() {
    this.authService.login(this.email, this.motDePasse).subscribe({
      next: (reponseApiJwt: any) => {
        this.authService.sauvegarderTokenJwt(reponseApiJwt.accessToken)

        const roles = reponseApiJwt.user.roles
        let cEstAdmin = false
        for (let i = 0; i < roles.length; i++) {
          if (roles[i] === 'Admin') {
            cEstAdmin = true
          }
        }

        if (cEstAdmin) {
          this.authService.sauvegarderRole('Admin')
          this.router.navigate(['/admin'])
        } else {
          this.authService.sauvegarderRole('User')
          this.router.navigate(['/utlisateurs'])
        }
      },
      error: (err: any) => console.log(err.error)
    })
  }

  //rassemble les informations saisies dans le formulaire
  sInscrire() {
    this.authService.register({
      email: this.email,
      password: this.motDePasse,
      nom: this.nom,
      prenom: this.prenom,
      ville: this.ville,
      rue: this.rue,
      codePostal: this.codePostal,
      numerodetelephone: this.numerodetelephone

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
