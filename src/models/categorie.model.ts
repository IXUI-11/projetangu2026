import { Materiel } from './materiel.model'

export class Categorie {
  id!: number
  nom!: string
  modeles!: Materiel[]
}