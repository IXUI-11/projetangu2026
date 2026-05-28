import { Materiel } from './materiel.model'

export class Categorie {
  id!: number
  libelleCategorie!: string
  modeles!: Materiel[]
}