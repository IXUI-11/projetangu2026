import { ChangeDetectorRef, Component, OnInit } from '@angular/core'
import { MaterielService } from '../services/materiel'
import { FormsModule } from '@angular/forms'
import { Materiel } from '../../models/materiel.model'
import { Categorie } from '../../models/categorie.model'
import { Router } from '@angular/router'
import { Auth } from '../services/auth'
import { Reservation } from '../../models/reservation.model'

@Component({
  selector: 'app-composant-admin',
  imports: [FormsModule],
  templateUrl: './composant-admin.html',
  styleUrl: './composant-admin.css',
})
export class ComposantAdmin implements OnInit {
  
  // ==========================================
  // PARTIE 1 : PRÉPARATION DES VARIABLES
  // ==========================================
  
  // 1. Les listes vides qui vont recevoir les données de la base de données
  categories: Categorie[] = [] 
  materiels: Materiel[] = [] 
  reservations: Reservation[] = [] 

  // 2. Les interrupteurs (Vrai/Faux) pour afficher ou cacher les fenêtres (modales)
  modalOuvert: boolean = false 
  modalAjouterOuvert: boolean = false 
  modalCategorieOuvert: boolean = false 

  // 3. Les objets temporaires (mémoires) pour les formulaires HTML
  modeleAModifier: Materiel | null = null 
  nouveauMateriel: Materiel = new Materiel() 
  nouvelleCategorie: Categorie = new Categorie() 
  
  // 4. Le texte pour les petits messages d'alerte
  messageStatut: string = '' 

  // 5. L'importation des outils (API, Routeur...)
  constructor(public materielService: MaterielService, private cd: ChangeDetectorRef, private router: Router , private authService: Auth)  { }


  // 
  // 2 : DÉMARRAGE (Au chargement de la page)
  // 
  ngOnInit() {
    // 1. Sécurité : Vérifie si l'utilisateur est bien l'Admin
    if (!this.authService.estUnAdmin()) {  
      this.router.navigate(['/connexion']) // 2. Dehors ! Retour à la connexion
      return // 3. On arrête de lire le code
    }

    // ! pour afficher les catégories et les matériels dans la carte en bas
    // 4. Téléchargement des Catégories et Matériels
    this.materielService.getCategoriesAvecMateriels().subscribe({
      next: (reposneApiAdmin: any) => {
        this.categories = reposneApiAdmin // 5. On sauvegarde la réponse
        this.cd.detectChanges() // 6. On met à jour l'écran
      },
      error: (err: any) => console.log(err)
    })

    // ! pour afficher le nombre de matériels dans la carte en haut
    // 7. Téléchargement du nombre total de matériels
    this.materielService.getMaterielApi().subscribe({
      next: (reponseApiMateriel: any) => {
        this.materiels = reponseApiMateriel
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })

    // ! récupère toutes les réservations
    // 8. Téléchargement des Réservations
    this.materielService.getToutReservations().subscribe({
      next: (data: Reservation[]) => {
        this.reservations = data
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }


  // 
  // PARTIE 3 : GESTION DES AJOUTS ET SUPPRESSIONS
  //
  
  // ! Partie Admin pour ajouter une catégorie
  ajouterCategorie() {
    // 1. On envoie l'objet à l'API
    this.materielService.ajouterCatergorieApi(this.nouvelleCategorie).subscribe({
      next: () => {
        this.fermerModalCategorie() // 2. On ferme la fenêtre
        this.afficherMessage('✅ Catégorie ajoutée !') // 3. On affiche le succès
        
        // 4. On redemande la liste à jour à l'API
        this.materielService.getCategoriesAvecMateriels().subscribe({
          next: (data: any) => {
            this.categories = data
            this.cd.detectChanges()
          }
        })
      },
      error: (err: any) => console.log(err)
    })
  }

  // ! Partie Admin pour ajouter un matériel 
  ajouterModele() {
    this.materielService.ajouterMaterielApi(this.nouveauMateriel).subscribe({
      next: () => {
        this.fermerModalAjouter()
        this.afficherMessage('✅ Matériel ajouté !')
        
        // recharge la liste
        this.materielService.getCategoriesAvecMateriels().subscribe({
          next: (data: any) => {
            this.categories = data
            this.cd.detectChanges()
          }
        })
      },
      error: (err: any) => console.log(err)
    })
  }

  // ! Supprimer un matériel via API
  supprimerModele(modele: Materiel) {
    // 1. On donne l'ordre à l'API de supprimer
    this.materielService.supprimerModele(modele).subscribe({
      next: () => {
        this.afficherMessage('✅ Matériel supprimé !') // 2. Succès
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }


  // 
  // PARTIE 4 : GESTION DES MODIFICATIONS
  // 

  modifierModel(modele: Materiel) {
    this.materielService.modifierModele(modele)
  }

  ouvirModal(modele: Materiel) {
    // 1. On met le matériel cliqué dans la mémoire temporaire
    this.modeleAModifier = modele
    // 2. On affiche la fenêtre
    this.modalOuvert = true
  }

  fermerModal() {
    // 1. On cache la fenêtre et on vide la mémoire
    this.modalOuvert = false
    this.modeleAModifier = null
  }

  // ! Sauvegarder les modifications via API
  sauvgarderModifications(): void {
    // 1. On envoie les modifications à l'API
    this.materielService.modifierModele(this.modeleAModifier!).subscribe({
      next: () => {
        this.fermerModal() // 2. On ferme
        this.afficherMessage('✅ Matériel modifié !') // 3. Message vert
        this.cd.detectChanges() // 4. On rafraîchit
      },
      error: (err: any) => console.log(err)
    })
  }


  // 
  // PARTIE 5 : RÉSERVATIONS ET UTILITAIRES
  // 

  // ! Accepte une réservation IdStatus = 2
  accepterReservation(reservation: any) {
    reservation.IdStatus = 2 // 1. On change le statut à "Accepté"
    this.materielService.updateStatutReservation(reservation).subscribe({
      next: () => {
        reservation.idStatus = 2
        this.afficherMessage('✅ Réservation acceptée !')
        this.cd.detectChanges()
      }
    })
  }

  // ! Refuse une réservation IdStatus = 3
  refuserReservation(reservation: any) {
    reservation.IdStatus = 3 // 1. On change le statut à "Refusé"
    this.materielService.updateStatutReservation(reservation).subscribe({
      next: () => {
        reservation.idStatus = 3
        this.afficherMessage('❌ Réservation refusée !')
        this.cd.detectChanges()
      }
    })
  }

  // ouvrir le Modal pour ajouter un matériel
  ouvirModalAjouter() {
    this.modalAjouterOuvert = true;
  }

  // fermer le Modal pour ajouteer un matériel
  fermerModalAjouter() {
    this.modalAjouterOuvert = false;
    this.nouveauMateriel = new Materiel(); // On vide le formulaire
  }

  // ouvir le Modal pour ajouter une catégorie
  ouvrirModalCategorie() {
    this.modalCategorieOuvert = true
  }
  
  // fermer le Modal pour ajouter un catégorie
  fermerModalCategorie() {
    this.modalCategorieOuvert = false
    this.nouvelleCategorie = new Categorie() // On vide le formulaire
  }

  afficherMessage(message: string) {
    // 1. On affiche le message 
    this.messageStatut = message
    this.cd.detectChanges()
    
    // 2. On lance un minuteur de 3 secondes (3000ms)
    setTimeout(() => {
      this.messageStatut = '' // 3. On efface le texte
      this.cd.detectChanges() // 4. On met à jour l'écran
    }, 3000)
  };

}