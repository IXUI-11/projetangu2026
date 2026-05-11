import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs'
import { Materiel } from '../../models/materiel.model'
import{ Categorie } from '../../models/categorie.model'
import { environment } from '../../environments/environment'

@Injectable({
  providedIn: 'root',
})
export class MaterielService {
  // private categories: Categorie[] = [
  //   {
  //     id: 1,
  //     nom: 'Ordinateurs Portables',
  //     modeles: [
  //       {
  //         id: 1,
  //         nom: 'Dell XPS',
  //         description:
  //           'Puissant et léger. Équipé d'un processeur Intel Core i7, écran InfinityEdge 15 pouces, 16 Go RAM et SSD 512 Go. Idéal pour le travail, le multimédia et le développement. Batterie longue durée pour une journée complète sans recharge. Conception premium avec clavier rétroéclairé et lecteur d'empreintes pour plus de sécurité.',
  //         image: 'dell.jpg',
  //         prix: 20,
  //       },
  //       {
  //         id: 2,
  //         nom: 'Lenovo ThinkPad',
  //         description:
  //           'Fiable pour le travail quotidien. Processeur Intel Core i5, 8 Go RAM, SSD 256 Go, écran 14 pouces Full HD. Clavier ergonomique, durabilité militaire pour les chocs et vibrations, batterie longue durée et gestion facile pour les entreprises. Compatible docking station pour bureau complet.',
  //         image: 'lenovo.jpg',
  //         prix: 25,
  //       },
  //     ],
  //   },
  //   {
  //     id: 2,
  //     nom: 'Ordinateurs Bureau',
  //     modeles: [
  //       {
  //         id: 1,
  //         nom: 'PC Gamer',
  //         description:
  //           'PC Gamer avec un 9800X3D, carte graphique RTX 4070, 32 Go RAM, SSD 1 To. Idéal pour les jeux AAA en ultra, streaming et montage vidéo. Système de refroidissement liquide silencieux et boîtier RGB personnalisable. Optimisé pour performance maximale et mise à jour facile des composants.',
  //         image: 'pc.jpg',
  //         prix: 40,
  //       },
  //       {
  //         id: 2,
  //         nom: 'Asus VivoPC',
  //         description:
  //           'PC bureau compact et silencieux, Intel Core i5, 16 Go RAM, SSD 512 Go. Idéal pour le travail et la navigation. Design minimaliste, faible consommation et fonctionnement silencieux. Compatible avec écran 4K et périphériques multiples.',
  //         image: 'asus.jpg',
  //         prix: 35,
  //       },
  //     ],
  //   },
  //   {
  //     id: 3,
  //     nom: 'Usb',
  //     modeles: [
  //       {
  //         id: 1,
  //         nom: 'Usb KingStone',
  //         description:
  //           'USB 32 GB haute vitesse, compatible USB 3.0. Parfait pour transférer vos documents, photos et vidéos rapidement. Design compact et robuste pour transporter facilement vos données partout.',
  //         image: 'usb.jpg',
  //         prix: 30,
  //       },
  //       {
  //         id: 2,
  //         nom: 'SanDisk Ultra',
  //         description:
  //           'USB 64 GB haute vitesse avec protection contre les chocs et sécurité des données. Idéal pour sauvegarder vos fichiers importants, compatible PC et Mac, très fiable pour usage quotidien.',
  //         image: 'sandisk.jpg',
  //         prix: 15,
  //       },
  //     ],
  //   },
  //   {
  //     id: 4,
  //     nom: 'Imprimantes',
  //     modeles: [
  //       {
  //         id: 1,
  //         nom: 'Imprimante HP',
  //         description:
  //           'Imprimante blanche laser, rapide et fiable pour usage personnel ou bureau. Impression nette, faible consommation d'énergie et facile à configurer. Compatible Wi-Fi et USB pour plus de flexibilité.',
  //         image: 'hp.jpg',
  //         prix: 10,
  //       },
  //       {
  //         id: 2,
  //         nom: 'Canon Pixma',
  //         description:
  //           'Imprimante couleur compacte, idéale pour la maison ou le petit bureau. Impression de photos de haute qualité, scanner intégré et compatible avec tous vos périphériques mobiles. Facile à utiliser et faible bruit de fonctionnement.',
  //         image: 'canon.jpg',
  //         prix: 12,
  //       },
  //     ],
  //   },
  //   {
  //     id: 5,
  //     nom: 'Disque Dur',
  //     modeles: [
  //       {
  //         id: 1,
  //         nom: 'Projetcteur X10',
  //         description:
  //           'Haute qualité avec 1 To de stockage. Compatible PC et Mac, fiable pour sauvegarde de données importantes. Design compact et portable pour transporter vos fichiers facilement. Supporte le transfert rapide de données via USB 3.0 et offre une sécurité renforcée des fichiers grâce au chiffrement intégré.',
  //         image: '',
  //         prix: 10,
  //       },
  //     ],
  //   },
  //   {
  //     id: 6,
  //     nom: 'Claviers',
  //     modeles: [
  //       {
  //         id: 5,
  //         nom: 'Clavier mécanique',
  //         description:
  //           'Tactile et durable, idéal pour la saisie rapide et confortable. Éclairage RGB personnalisable, switches mécaniques de haute qualité pour une longue durée de vie. Compatible PC et Mac.',
  //         image: '',
  //         prix: 80,
  //       },
  //     ],
  //   },
  //   {
  //     id: 7,
  //     nom: 'Souris',
  //     modeles: [
  //       {
  //         id: 7,
  //         nom: 'Souris Gamer',
  //         description:
  //           'Précision maximale avec capteur 16 000 DPI. Ergonomique, boutons programmables, éclairage RGB et poids ajustable pour une expérience gaming optimale. Compatible avec tous les jeux et PC.',
  //         image: '',
  //         prix: 50,
  //       },
  //     ],
  //   },
  //   {
  //     id: 8,
  //     nom: 'Casques',
  //     modeles: [
  //       {
  //         id: 8,
  //         nom: 'Casque Bluetooth',
  //         description:
  //           'Son clair et confort. Connexion sans fil Bluetooth, autonomie longue durée et design ergonomique pour des heures d'utilisation sans fatigue. Micro intégré pour appels et conférences.',
  //         image: '',
  //         prix: 120,
  //       },
  //     ],
  //   },
  // ]


  private apiLien = environment.apiUrl

  constructor(private http:HttpClient){}

  getMaterielApi():Observable<Materiel[]>{
    return this.http.get<Materiel[]>(`${this.apiLien}/Materiel/Search`)
  }

  // end point pour les catégories
  getCategoriesApi(): Observable<any[]> {
  return this.http.get<any[]>(`${this.apiLien}/Categorie/Search`)
}

getCategoriesAvecMateriels(): Observable<any[]> {
  return this.http.get<any[]>(`${this.apiLien}/Categorie/CategoriesAvecMateriels`)
}
  // getCategories(): Categorie[] {
  //   return this.categories;
  // }

  supprimerCategorie(categorie: Categorie) {
    // TODO : appel API plus tard
    console.log('Supprimer', categorie.nom);
  }

  modifierCategorie(categorie: Categorie) {
    // TODO : appel API plus tard
    console.log('Modifier', categorie.nom);
  }

  supprimerModele(modele: Materiel) {
    console.log('Supprimer', modele.nom);
  }

  modifierModele(modele: Materiel) {
    // TODO : appel APi
    console.log('Modifier', modele.nom);
    console.log("Sauvegardé " , modele.nom)
  }


}
