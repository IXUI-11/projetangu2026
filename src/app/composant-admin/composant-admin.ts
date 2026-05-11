import { ChangeDetectorRef, Component, OnInit } from '@angular/core'
import { MaterielService} from '../services/materiel' // <- imporation du service Materie et l'interface Categorie
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

  modalOuvert: boolean = false
  modeleAModifier: Materiel | null = null

  constructor(public materielService: MaterielService , private cd : ChangeDetectorRef  ) {
    // this.categories = this.materielService.getCategories();

  }

  ngOnInit(){
    this.materielService.getCategoriesAvecMateriels().subscribe({
      next : (reposneApiAdmin:any) => {
        console.log('Données reçus :' , reposneApiAdmin)
        this.categories = reposneApiAdmin
        this.cd.detectChanges()
      },
      error : (err : any) => console.log('errur ' ,err)
    })
  }

  supprimerCategorie(categorie: Categorie) {
    this.materielService.supprimerCategorie(categorie);
  }

  modifierCategorie(categorie: Categorie) {
    this.materielService.modifierCategorie(categorie);
  }

  supprimerModele(modele: Materiel) {
    this.materielService.supprimerModele(modele);
  }

  modifierModel(modele: Materiel) {
    this.materielService.modifierModele(modele);
  }

  ouvirModal(modele: Materiel) {
    this.modeleAModifier = modele;
    this.modalOuvert = true;
  }

  fermerModal() {
    this.modalOuvert = false;
    this.modeleAModifier = null;
  }

  sauvgarder() : void {
    this.materielService.modifierModele(this.modeleAModifier!);
    this.fermerModal();
    }
}
