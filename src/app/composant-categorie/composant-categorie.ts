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

  // 
  // PARTIE 1 : PRÉPARATION DES VARIABLES
  // 

  // 1. Textes affichés en haut de la page catalogue
  titre: string = 'Catalogue du matériel'
  descriptionCatalogue: string =
    'Découvrez notre sélection de matériel informatique disponible à la location. PC portables, écrans, vidéoprojecteurs, tablettes et périphériques — tout ce dont vous avez besoin pour vos projets professionnels.';

  // 2. Le matériel actuellement affiché en détail (null = aucun sélectionné)
  materielActif: Materiel | null = null;

  // 3. La catégorie actuellement sélectionnée (null = vue liste des catégories)
  categorieActive: Categorie | null = null;

  // 4. Interrupteur pour afficher ou cacher le formulaire de location
  formulaireLocation: boolean = false;

  // 5. Les deux dates saisies par l'utilisateur dans le formulaire
  dateDebut: string = '';
  dateFin: string = '';

  // 6. La liste des catégories (avec leurs matériels) chargée depuis l'API
  categories: Categorie[] = [];

  // 7. Message de confirmation après une réservation réussie
  messageReservationSuccess: string = '';

  // 8. Résultat de la vérification de disponibilité (true = disponible)
  disponible: boolean = true;

  // 9. Réservations existantes du matériel (utilisé pour la vérification de dispo)
  reservationsMateriel: any[] = [];

  // 10. Tableau de dégradés de couleurs pour les cartes du catalogue
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

  // Retourne une couleur selon l'index, en bouclant sur le tableau si nécessaire
  getCouleur(index: number): string {
    return this.couleursFond[index % this.couleursFond.length];
  }

  // 
  // PARTIE 2 : INJECTION DES SERVICES
  // 

  // materielService : appels API pour les matériels et réservations
  // cd : force la mise à jour du HTML quand Angular ne le détecte pas automatiquement
  // authService : vérifie si l'utilisateur est connecté et son rôle
  constructor(
    private materielService: MaterielService,
    private cd: ChangeDetectorRef,
    private authService: Auth
  ) { }

  // 
  // PARTIE 3 : DÉMARRAGE (chargement de la page)
  // 

  ngOnInit() {
    // 1. Récupère toutes les catégories avec leurs matériels depuis l'API
    this.materielService.getCategoriesAvecMateriels().subscribe({
      next: (data) => {
        this.categories = data;
        this.cd.detectChanges(); // Force la mise à jour du HTML
        console.log(this.categories);
      },
      error: (err) => console.error(err)
    });
  }

  // 
  // PARTIE 4 : NAVIGATION DANS LE CATALOGUE
  // 

  // Affiche le détail d'un matériel et réinitialise le formulaire de location
  selectionnerMateriel(materiel: Materiel) {
    this.materielActif = materiel;
    this.messageReservationSuccess = '';
    this.formulaireLocation = false;
    this.dateDebut = '';
    this.dateFin = '';
    this.disponible = true;
  }

  // Affiche la liste des matériels d'une catégorie
  selectionnerCategorie(categorie: Categorie) {
    this.categorieActive = categorie
  }

  // Retour à la liste des catégories et réinitialise tout
  retour() {
    this.materielActif = null
    this.categorieActive = null
    this.messageReservationSuccess = '';
    this.formulaireLocation = false;
    this.dateDebut = '';
    this.dateFin = '';
    this.disponible = true;
  }

  // 
  // PARTIE 5 : FORMULAIRE DE LOCATION
  // 

  // Affiche le formulaire de location
  louerMateriale(): void {
    this.formulaireLocation = true
  }

  // Gère la confirmation de la réservation en 4 étapes
  confirmationLocation(): void {
    // 1. Vérifie si l'utilisateur est connecté
    if (!this.authService.estConnecter()) {
      this.messageReservationSuccess = 'Vous devez être connecté pour louer un matériel'
      this.cd.detectChanges();
    } else {
      // 2. Récupère les infos de l'utilisateur connecté depuis l'API Auth/Me
      this.authService.getUtilisateurConnecte().subscribe({
        next: (user: any) => {

          // 3. Prépare l'objet réservation à envoyer à l'API
          const reservation = {
            DateDebut: this.dateDebut,
            DateFin: this.dateFin,
            PrixTotal: this.calculerPrixTotal(),
            IdUtilisateurs: user.idUtilisateurs,
            IdMateriel: this.materielActif!.id,
          }

          // 4. Envoie la réservation à l'API
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

  // 
  // PARTIE 6 : CALCULS ET VÉRIFICATIONS
  // 

  /**
   * Calcule le nombre de jours entre la date de début et la date de fin.
   * Retourne 0 si les dates sont absentes ou si la date de fin est avant le début.
   */
  calculerNbJours(): number {
    if (!this.dateDebut || !this.dateFin) {
      return 0
    }

    const debut = new Date(this.dateDebut)
    const fin = new Date(this.dateFin)
    const jours = (fin.getTime() - debut.getTime()) / (1000 * 60 * 60 * 24)

    if (jours <= 0) {
      return 0
    }

    return jours
  }

  // Calcule le prix total = nombre de jours × prix du matériel
  calculerPrixTotal(): number {
    return this.calculerNbJours() * this.materielActif!.prix
  }

  // Appelle l'API pour vérifier si le matériel est disponible sur la période choisie
  verifierDisponibilite(): void {
    // On ne vérifie que si les deux dates sont renseignées
    if (!this.dateDebut || !this.dateFin) return

    this.materielService.verifierDisponibilite(
      this.materielActif!.id,
      this.dateDebut,
      this.dateFin
    ).subscribe({
      next: (resultat: boolean) => {
        console.log('disponible:', resultat)
        this.disponible = resultat
        this.cd.detectChanges()
      },
      error: (err: any) => console.log(err)
    })
  }

  // 
  // PARTIE 7 : HELPERS AUTH
  // 

  // Retourne true si l'utilisateur connecté est un admin
  estAdmin(): boolean {
    return this.authService.estUnAdmin()
  }

  // Retourne true si un utilisateur est connecté
  estConnecte(): boolean {
    return this.authService.estConnecter()
  }
}