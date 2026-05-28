import { Component, OnInit, ChangeDetectorRef } from '@angular/core'
import { FormsModule } from '@angular/forms'
import { MaterielService } from '../services/materiel'
import { Materiel } from '../../models/materiel.model'
import { Categorie } from '../../models/categorie.model'
import { Auth } from '../services/auth'


@Component({
  selector: 'app-composant-categorie',
  imports: [FormsModule],
  templateUrl: './composant-categorie.html',
  styleUrl: './composant-categorie.css',
})

export class ComposantCatalogue implements OnInit {
  // variables
  titre: string = 'Catalogue du matériel'
  descriptionCatalogue: string =
    'Découvrez notre sélection de matériel informatique disponible à la location. PC portables, écrans, vidéoprojecteurs, tablettes et périphériques — tout ce dont vous avez besoin pour vos projets professionnels.';
  materielActif: Materiel | null = null;
  categorieActive: Categorie | null = null;
  formulaireLocation: boolean = false;
  dateDebut: string = '';
  dateFin: string = '';
  categories: Categorie[] = [];
  messageReservationSuccess: string = '';


  // Couleurs de fond pour les catégories
  couleursFond: string[] = [
    'linear-gradient(135deg, #1a2a4a 0%, #0d1b2e 100%)',
    'linear-gradient(135deg, #2a1a3a 0%, #1a0d2e 100%)',
    'linear-gradient(135deg, #1a3a2a 0%, #0d2e1b 100%)',
    'linear-gradient(135deg, #3a2a1a 0%, #2e1b0d 100%)',
    'linear-gradient(135deg, #3a1a1a 0%, #2e0d0d 100%)',
    'linear-gradient(135deg, #1a3a3a 0%, #0d2e2e 100%)',
    'linear-gradient(135deg, #2a3a1a 0%, #1b2e0d 100%)',
    'linear-gradient(135deg, #3a1a2a 0%, #2e0d1b 100%)',
  ]

  getCouleur(index: number): string {
    return this.couleursFond[index % this.couleursFond.length];
  }

  // ! remplacer le constructor par ngOnInit quand les données viendront depuis l'API

  // materielService est une variable de type MaterielService. Angular crée automatiquement une instance de la classe MaterielService et l'injecte dans cette variable.
  constructor(private materielService: MaterielService, /* 2 varaible*/ private cd: ChangeDetectorRef, private authService: Auth) { }


  // l'api
  ngOnInit() {

    this.materielService.getCategoriesAvecMateriels().subscribe({
      next: (data) => {
        this.categories = data;
        this.cd.detectChanges(); // ← force la mise à jour du HTML

        console.log(this.categories);
      },
      error: (err) => console.error(err)
    });
  }




  // affiche les détails du matériel
  selectionnerMateriel(materiel: Materiel) {
    this.materielActif = materiel
  }

  selectionnerCategorie(categorie: Categorie) {
    this.categorieActive = categorie
  }

  // retour à la liste
  retour() {
    this.materielActif = null
    this.categorieActive = null
  }

  louerMateriale(): void {
    this.formulaireLocation = true
  }


  // 
  confirmationLocation(): void {
      //  1 Vérifie si connecté
    if (!this.authService.estConnecter()) {
      this.messageReservationSuccess = 'Vous devez être connecté pour louer un matériel'
      this.cd.detectChanges();
    }
    else{
    // 2. Récupère les infos de l'utilisateur connecté depuis L'api Auth/Me
    this.authService.getUtilisateurConnecte().subscribe({
      next: (user: any) => {
        // user contient : email, nom, idUtilisateurs...

       // 3. Prépare les données de la réservation
        const reservation = {
          DateDebut: this.dateDebut,
          DateFin: this.dateFin,
          PrixTotal: this.calculerPrixTotal(), 
          IdUtilisateurs: user.idUtilisateurs,
          IdMateriel: this.materielActif!.id
        }

        //  4 : Envoie la réservation à l'API
        this.materielService.creerReservation(reservation).subscribe({
          next: (data: any) => {
            this.formulaireLocation = false
            this.messageReservationSuccess = `✅ Réservation confirmée ! Prix total : ${this.calculerPrixTotal()} €`
            this.cd.detectChanges();

          },
          error: (err: any) => console.log(err)
        })
      },
      error: (err: any) => console.log(err)
    })
    }
  }


// Calcule le nombre de jours du  jour X au jour Y 
  calculerNbJours(): number {
    if (!this.dateDebut || !this.dateFin) return 0
    const debut = new Date(this.dateDebut)
    const fin = new Date(this.dateFin)
    return (fin.getTime() - debut.getTime()) / (1000 * 60 * 60 * 24)

  }


  // Calcule le prix total en fonction du prix de l'article et le X et Y jours
  calculerPrixTotal(): number {
    return this.calculerNbJours() * this.materielActif!.prix
  }

  estAdmin(): boolean {
  return this.authService.estUnAdmin()
}

  estConnecte(): boolean {
    return this.authService.estConnecter()
  }
}



