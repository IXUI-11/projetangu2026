import { Component, OnInit, ChangeDetectorRef } from '@angular/core'
import { Auth } from '../services/auth'
import { MaterielService } from '../services/materiel'
import { Reservation } from '../../models/reservation.model'
import { Utilisateur } from '../../models/utilisateur.model'


@Component({
  selector: 'app-composant-utlisateurs',
  imports: [],
  templateUrl: './composant-utlisateurs.html',
  styleUrl: './composant-utlisateurs.css',
})
export class ComposantUtlisateurs implements OnInit {

  // 
  // PARTIE 1 : PRÉPARATION DES VARIABLES
  // 

  // 1. Les informations de l'utilisateur connecté (nom, prénom, email...)
  utilisateur: Utilisateur | null = null

  // 2. La liste des réservations de l'utilisateur connecté
  reservations: Reservation[] = []

  // 
  // PARTIE 2 : INJECTION DES SERVICES
  // 

  // authService : récupère les infos de l'utilisateur connecté
  // cdr : force la mise à jour du HTML quand Angular ne le détecte pas automatiquement
  // materielService : récupère les réservations de l'utilisateur
  constructor(
    private authService: Auth,
    private cdr: ChangeDetectorRef,
    private materielService: MaterielService
  ) { }

  // 
  // PARTIE 3 : DÉMARRAGE (chargement de la page)
  // 

  /**
   * Charge les données de la page espace utilisateur en 2 étapes.
   * Étape 1 : Récupère les informations de l'utilisateur connecté depuis l'API Auth/Me.
   * Étape 2 : Une fois l'utilisateur récupéré, utilise son id pour charger
   *           ses réservations depuis l'API.
   * En cas d'échec à n'importe quelle étape, l'erreur est affichée dans la console.
   */
  ngOnInit() {
    this.authService.getUtilisateurConnecte().subscribe({
      next: (utilisateurConnecte: Utilisateur) => {
        this.utilisateur = utilisateurConnecte
        this.cdr.detectChanges()

        // Une fois l'utilisateur chargé, on récupère ses réservations avec son id
        this.materielService.getReservationsUtilisateur(utilisateurConnecte.idUtilisateurs).subscribe({
          next: (reservationsUtilisateur: Reservation[]) => {
            this.reservations = reservationsUtilisateur
            this.cdr.detectChanges()
          },
          error: (err: any) => console.log(err)
        })
      },
      error: (err: any) => console.log(err)
    })
  }
}