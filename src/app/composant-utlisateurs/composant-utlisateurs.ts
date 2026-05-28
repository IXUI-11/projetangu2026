import { Component, OnInit, ChangeDetectorRef } from '@angular/core'
import { Auth } from '../services/auth'
import { MaterielService } from '../services/materiel'

@Component({
  selector: 'app-composant-utlisateurs',
  imports: [],
  templateUrl: './composant-utlisateurs.html',
  styleUrl: './composant-utlisateurs.css',
})
export class ComposantUtlisateurs implements OnInit {

  utilisateur: any = null
  reservations: any[] = []

  constructor(
    private authService: Auth,
    private cdr: ChangeDetectorRef,
    private materielService: MaterielService
  ) { }

  ngOnInit() {
    this.authService.getUtilisateurConnecte().subscribe({
      next: (utilisateurConnecte: any) => {
        this.utilisateur = utilisateurConnecte
        this.cdr.detectChanges()

        this.materielService.getReservationsUtilisateur(utilisateurConnecte.idUtilisateurs).subscribe({
          next: (reservationsUtilisateur: any) => {
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