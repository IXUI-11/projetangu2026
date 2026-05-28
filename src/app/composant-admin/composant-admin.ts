import { ChangeDetectorRef, Component, OnInit } from '@angular/core'
import { MaterielService } from '../services/materiel'
import { FormsModule } from '@angular/forms'
import { Materiel } from '../../models/materiel.model'
import { Categorie } from '../../models/categorie.model'

@Component({
  selector: 'app-composant-admin',
  imports: [FormsModule],
  templateUrl: './composant-admin.html',
  styleUrl: './composant-admin.css',
})
export class ComposantAdmin implements OnInit {
  categories: Categorie[] = []
  materiels: Materiel[] = []
  modalOuvert: boolean = false
  modeleAModifier: Materiel | null = null
  reservations: any[] = []
  messageStatut: string = ''
  modalAjouterOuvert: boolean = false
  nouveauMateriel: Materiel = new Materiel()
  modalCategorieOuvert: boolean = false
  nouvelleCategorie: Categorie = new Categorie()

  constructor(public materielService: MaterielService, private cd: ChangeDetectorRef) { }

  ngOnInit() {
    // ! pour afficher les catégories et les matériels dans la carte en bas
    this.materielService.getCategoriesAvecMateriels().subscribe({
      next: (reposneApiAdmin: any) => {
        this.categories = reposneApiAdmin
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })

    // ! pour afficher le nombre de matériels dans la carte en haut
    this.materielService.getMaterielApi().subscribe({
      next: (reponseApiMateriel: any) => {
        this.materiels = reponseApiMateriel
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })

    // ! récupère toutes les réservations
    this.materielService.getToutReservations().subscribe({
      next: (data: any) => {
        this.reservations = data
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }

  // ! Partie Admin pour ajouter une catégorie
  ajouterCategorie() {
    this.materielService.ajouterCatergorieApi(this.nouvelleCategorie).subscribe({
      next: () => {
        this.fermerModalCategorie()
        this.afficherMessage('✅ Catégorie ajoutée !')
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


  //TODO : a spprumer plus tard
  // supprimerCategorie(categorie: Categorie) {
  //   this.materielService.supprimerCategorie(categorie)
  // }

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
    this.materielService.supprimerModele(modele).subscribe({
      next: () => {
        this.afficherMessage('✅ Matériel supprimé !')
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }

  modifierModel(modele: Materiel) {
    this.materielService.modifierModele(modele)
  }

  ouvirModal(modele: Materiel) {
    this.modeleAModifier = modele
    this.modalOuvert = true
  }

  fermerModal() {
    this.modalOuvert = false
    this.modeleAModifier = null
  }

  // ! Sauvegarder les modifications via API
  sauvgarderModifications(): void {
    this.materielService.modifierModele(this.modeleAModifier!).subscribe({
      next: () => {
        this.fermerModal()
        this.afficherMessage('✅ Matériel modifié !')
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }

  // ! Accepte une réservation IdStatus = 2
  accepterReservation(reservation: any) {
    reservation.IdStatus = 2
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
    reservation.IdStatus = 3
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
    this.nouveauMateriel = new Materiel();
  }


  // ouvir le Modal pour ajouter une catégorie
  ouvrirModalCategorie() {
    this.modalCategorieOuvert = true
  }
  // fermer le Modal pour ajouter un catégorie
  fermerModalCategorie() {
    this.modalCategorieOuvert = false
    this.nouvelleCategorie = new Categorie()
  }

  afficherMessage(message: string) {
    this.messageStatut = message
    this.cd.detectChanges()
    setTimeout(() => {
      this.messageStatut = ''
      this.cd.detectChanges()
    }, 3000)
  };


}