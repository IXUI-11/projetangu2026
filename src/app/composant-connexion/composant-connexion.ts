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

  // 
  // PARTIE 1 : PRÉPARATION DES VARIABLES
  // 

  // 1. Champs du formulaire de connexion
  email: string = ''
  motDePasse: string = ''

  // 2. Champs supplémentaires pour le formulaire d'inscription
  nom: string = ''
  prenom: string = ''
  codePostal: number = 0
  ville: string = ''
  rue: string = ''
  numerodetelephone: number = 0

  // 3. Interrupteur pour basculer entre le formulaire connexion et inscription
  switchFormulaire: boolean = false

  // 
  // PARTIE 2 : INJECTION DES SERVICES
  // 

  // authService : gère le login, l'inscription et la sauvegarde du token JWT
  // router : redirige l'utilisateur après connexion ou inscription
  constructor(private authService: Auth, private router: Router) { }

  // 
  // PARTIE 3 : CYCLE DE VIE DU COMPOSANT
  // 

  // ! Bloque le scroll de la page quand le composant est affiché (style page connexion/inscription)
  ngOnInit(): void {
    document.body.style.overflow = 'hidden'
  }

  // ! Restore le scroll quand on quitte la page connexion/inscription
  ngOnDestroy(): void {
    document.body.style.overflow = ''
  }

  // 
  // PARTIE 4 : CONNEXION
  // 

  /**
   * Gère le processus d'authentification de l'utilisateur.
   * Cette méthode envoie les identifiants (email et mot de passe) au service d'authentification.
   * En cas de succès :
   * 1. Sauvegarde le token JWT retourné par l'API.
   * 2. Parcourt les rôles de l'utilisateur pour vérifier s'il possède les droits d'administrateur.
   * 3. Sauvegarde le rôle correspondant ('Admin' ou 'User') via le service d'authentification.
   * 4. Redirige l'utilisateur vers la route appropriée (/admin pour les administrateurs, /utlisateurs pour les clients).
   * En cas d'échec (ex: mauvais identifiants), l'erreur est interceptée et affichée dans la console.
   */
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

  // 
  // PARTIE 5 : INSCRIPTION
  // 

  /**
   * Gère le processus d'inscription d'un nouvel utilisateur.
   * Cette méthode envoie les informations saisies dans le formulaire au service d'authentification.
   * En cas de succès :
   * 1. Sauvegarde le token JWT retourné par l'API.
   * 2. Redirige l'utilisateur vers la page d'accueil.
   * En cas d'échec (ex: email déjà utilisé), l'erreur est interceptée et affichée dans la console.
   */
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
        this.router.navigate(['/']) // Redirige vers l'accueil après inscription
      },
      error: (err: any) => console.log(err.error)
    })
  }

  // 
  // PARTIE 6 : UTILITAIRES
  // 

  // Bascule entre le formulaire de connexion et celui d'inscription
  changerFormulaire(): void {
    this.switchFormulaire = !this.switchFormulaire
  }
}