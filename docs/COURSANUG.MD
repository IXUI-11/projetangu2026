ca c'est mes cours qui se trouvent sur mooedel appuie toi sur ca 

1) Création d'un premier component

Le mot component en anglais signifie "composant", et à juste titre : les components sont les composants de base d'une application Angular.

Une application Angular est une arborescence de components avec AppComponent comme component racine.

Un component Angular (ou composant Angular) est l’élément de base qui construit l’interface utilisateur (UI) d’une application Angular. Chaque portion visible de l’application est généralement un composant.

Le principe des composants est comparable à celui des classes en POO : créer un moule réutilisable pour gérer un (ou plusieurs) types de données / comportements.

Par exemple, une application simple ressemblerait à cela : 

Ici, l'application pourrait contenir 4 components :

    AppComponent : contenant principal, contenant tous les autres composants
    Menu  horizontal
    Page : contenant la page principale (changée par le menu)
    Menu latéral

Il n'y a pas de règle d'or dans le découpage d'une application en components : il faut essayer d'équilibrer entre ne pas avoir un trop grand nombre de components, et avoir quand même des components simples et pas trop gros. 

Un composant peut en contenir plusieurs autres, par exemple pour afficher le profil d'un utilisateur :

 

 

Avant de commencer à utiliser Angular, il faut vider le AppComponent de son contenu, afin de partir sur une page blanche (mais déjà embarquée dans un livre relié avec sa couverture) :

    Vider le fichier app.html
    Vider le fichier app.css
    Modifier le fichier app.ts pour qu'il ressemble à cela :

 
Création d'un component

Un composant est composé de 3 fichiers de base : 

    un fichier HTML
    un fichier CSS
    un fichier TypeScript

Pour générer un composant à l'aide du CLI, il faut lancer la commande suivante :

ng generate component nomDuComposant

Une fois la commande lancée, le terminal affiche les fichiers qui sont créés : 

On constate que le CLI a créé un nouveau dossier (du nom du composant) dans le dossier app (celui du composant racine).

Et dans ce nouveau dossier, les 3 fichiers ont bien été créés.

 
Le template HTML

Le fichier HTML d'un composant (appelé template), contiendra tout le code HTML du composant, donc sa coquille de présentation.

A la génération d'un composant, Angular génère le code HTML suivant (permettant de vérifier que le composant s'affiche bien) :

<p>nouveau composant works!</p>

 
Le fichier CSS

Le fichier CSS est lié au composant uniquement, il est généré vide !

 
Le fichier TypeScript

Le fichier TypeScript, qui est en charge de toute la logique du composant, est déjà plus rempli :

Les import servent à charger du code provenant (comme les using en C#) :

    d’un autre fichier : classe, interface,...
    d’un module Angular : composants, directives, pipes,...
    d’une librairie externe (npm) : framework css,...

Ensuite, il y a la déclaration de la classe définissant le composant...qui est vide pour le moment.

Cependant, cette classe est accompagnée d'un décorateur.

Un décorateur en TypeScript permet, entre autres, d'apporter des modifications à une classe. Ici, le décorateur  @Component  vient ajouter tous les comportements nécessaires à l'utilisation de ce component dans l'application. Il est importé depuis le package  @angular/core. 

 

Les attributs du décorateur @Component :

    selector : le nom de la balise HTML pour utiliser le composant dans l'application.
        Par défaut, le sélecteur est préfixé d'un app-
    imports : tableau contenant les imports Angular
        A la différence des imports en haut du fichier, ces imports permettent d'utiliser des fonctionnalités Angular dans le template HTML du composant
        La majorité du temps, un import dans le décorateur nécessite un import en haut du fichier
    templateUrl : le chemin relatif vers le template HTML
    styleUrl : le chemin relatif vers le fichier CSS

Il existe d'autres attributs pour le décorateur Component : → ici ←

 
Utilisation d'un component

Maintenant que le composant est créé, il faut l'utiliser dans l’application. Comme vu précédemment, le AppComponent est le composant racine...c'est donc dans celui ci qu'il faut ajouter les composants de premier niveau pour les afficher.

Dans le fichier ./src/app/app.html, ajouter la balise du composant créé plus haut (utiliser l’auto-complétion de VS Code).

ou

Si vous utilisez bien l'auto-complétion, VS Code ajoutera automatiquement les imports nécessaires dans le fichier ./src/app/app.ts, sinon il faudra les ajouter à la main :

 
Lancement de l'application

De manière générale, il est conseillé de lancer la commande ng serve à l'ouverture du projet.

En effet, lancer le serveur permet (à chaque sauvegarde de fichier) :

    d'avoir l'affichage des erreurs potentielles en temps réel dans le terminal
    de rafraîchir automatiquement la page dans le navigateur 

Une fois la commande exécutée, ouvrir un navigateur à l'adresse indiquée dans le terminal (localhost:4200 par défaut) et voir le résultat :


2) Personaliser un composant

    B2-3 - SLAM
    Angular
    Personaliser un composant

Conditions d’achèvement

Le premier component est prêt, mais il est vide : n'affiche rien (ou presque) et ne permet aucun interaction avec l'utilisateur.

Comp

 
Afficher des données dans le composant

Comme vu précédemment, c'est le fichier TypeScript du composant qui est en charge de sa logique, c'est donc lui qui va contenir les données pour les passer au template.

A termes, les données seront envoyées par un serveur, mais pour cet exemple, les données seront en dur.

Ce premier composant affichera une fiche de présentation d'un élève.

Pour commencer, il faut ajouter les attributs à suivants la classe TypeScript : 

    nom : string
    prenom : string
    age : number
    filière : string
    photo : string (lien vers l'image)

    L'ajout de ! derrière le nom des attributs dit au compilateur TypeScript qu'elles seront initialisées plus tard (sinon, il génère une erreur).

 

Pour suivre les bonnes pratiques Angular, tous les composants doivent avoir une méthode ngOnInit().

Cette méthode est appelée (automatiquement) à la création de chaque instance du composant, elle sert notamment à initialiser les propriétés :

Pour afficher du contenu dans un template, il existe deux méthodes :

    la string interpolation
    l'attribute binding

 
String interpolation : Afficher du contenu

Cette méthode sert à afficher une valeur sous forme de texte dans le template HTML.

Pour l'utiliser, il faut mettre le nom de l'attribut (venant du TypeScript) entre des doubles accolades : {{ nomAttribut }}

Template HTML
	Rendu navigateur

	

 
Attribute binding : Lier vos données aux balises

Cette méthode sert à lier des valeurs aux attributs des balises HTML.

Pour l'utiliser, il faut entourer le nom de la balise HTML entre crochets :  [] et passer le nom de l'attribut de classe en valeur à l'attribut HTML :
Template HTML 	Rendu navigateur
	

 

Il ne manque plus qu'un petit peu de HTML (dans le template) et de CSS (dans le fichier de style du composant) pour arriver à quelque chose de présentable :

 

 
Gérer les évènements du composant

Notre composant affiche maintenant des données provenant du script, cependant il ne permet toujours pas à l'utilisateur d’interagir.

Pour cela, il faut ajouter des évènements dans le template, qui seront gérés dans le script.
Voici les étapes à suivre :

    Création d'un élément HTML (ici un bouton) dans le template HTML :

    Création de la méthode qui réagira à l'évènement dans le TypeScript :

    Le nom des méthodes réagissant aux évènements doivent (par convention) commencer par on

    Liaison de l'évènement dans le template HTML :

    Cette méthode se nomme l'event binding (liaison d'évènement), il faut ici utiliser des parenthèses () autour du nom de l'évènement. 

    Il faut bien utiliser click : le nom de l'évènement en JavaScript et non onclick : la propriété HTML.

 

Si les étapes ont étés réalisées correctement, l'âge affiché dans le composant devrait augmenter de 1 à chaque clic sur le bouton.

 

 
Gérer les données variables avec les signaux

Un signal Angular est une manière pour gérer l'état d'une variable.

    C'est une valeur qui avertit les éléments qui l'utilisent qu'elle a été modifiée.

Les signaux sont très utiles dans les nouvelles versions d'Angular car ils sont : 

    Simples à utiliser : ce sont des variables qui se mettent à jour de manière presque classique (à travers des fonctions)
    Optimisés : permettent de rafraîchir uniquement les zones qui les utilisent

Ils sont très adaptés pour : 

    Afficher un écran de chargement
    Mettre à jour une liste en fonction des filtres
    ...

 
Writable Signals

Pour écrire un signal sur une valeur modifiable, il faut la déclarer comme ci-dessous : 

    WritableSignal : signal sur une valeur modifiable
    <number> : indique que la valeur sera un nombre

 

Il faut ensuite (dans le ngOnInit()), l'initialiser :

    signal : constructeur
    <number> : typage 
    (35) : première valeur

 

Pour modifier la valeur d'un signal dans le code TypeScript, deux méthode :

    this.age.set(this.age() + 1);

    this.age.update(value => value + 1);

  

Pour accéder à la valeur du signal :

    Dans le TypeScript : 

    this.age()

    Dans le template : 

    <p>{{age()}}</p>

 
Computed Signals

Les signaux calculés, sont des signaux en lecture seule, dont la valeur dépend d'autres signaux.

Pour écrire un signal calculé, il faut la déclarer comme ci-dessous : 

    Signal: signal en lecture seule
    <number> : indique que la valeur sera un nombre

 

Il faut ensuite (dans le ngOnInit()), l'initialiser :

    signal : constructeur
    <number> : typage 
    () => : fonction permettant de calculer la nouvelle valeur

    La fonction sera appelée dès qu'un signal utilisé à l'intérieur est modifié

 

Pour accéder à la valeur du signal :

    Dans le TypeScript : 

    this.anneNaissance();

    Dans le template : 

    <p>{{anneNaissance()}}</p>

  
 
Exercice

L'objectif est de faire évoluer le composant pour que l'âge ne puisse pas dépasser 30 ans, une fois cette limite atteinte : 

    Le texte du bouton devient "Baisser l'âge"
    Le clic sur le bouton fait descendre l'âge de 1

A l'inverse, l'âge ne doit pas pouvoir descendre en dessous de 18 ans, une fois cette limite atteinte : 

    Le texte du bouton devient "Augmenter l'âge"
    Le clic sur le bouton augmente l'âge de 1

Utiliser des signaux !!

Une fois cette fonctionnalité terminée, afficher plusieurs fois le composant dans la page. 

Modifié le: jeudi 27 novembre 2025, 13:26


3) 
Envoyer des données à un composant

    B2-3 - SLAM
    Angular
    Envoyer des données à un composant

Conditions d’achèvement

Le composant est maintenant affiché plusieurs fois dans la page, cependant ils affichent tous les mêmes informations, ce qui est normal étant donné que les données ont été écrites en dur dans la classe.

Le but d'un composant est d'être réutilisable et d'avoir le même comportement pour le même type de données (même si les valeurs changent).

Pour envoyer des données à un composant depuis sa déclaration (dans le composant parent), il faut créer des inputs (propriétés personnalisées).

Ici les informations de l'élève (nom, prénom, âge, filière, photo, année de naissance). Il serait trop fastidieux de créer autant de propriétés dans le composant qu'il y en a pour l'élève (surtout que celui ci a de fortes chances d'évoluer).

La solution se trouve dans un concept connu : les classes, et TypeScript les gère très bien.

 
Création de la classe Eleve

Dans le dossier src, créer un nouveau dossier models.

Dans ce nouveau dossier, créer un nouveau fichier eleve.model.ts.

En TypeScript, il est possible de se passer de la déclaration des attributs dans la classe et de leur initialisation dans le constructeur en utilisant la syntaxe suivante :

import { Signal, WritableSignal } from "@angular/core";

export class Eleve {

    constructor(public nom: string,
        public prenom: string,
        public age: WritableSignal<number>,
        public filiere: string,
        public photo: string) {
    }

}

La syntaxe ci-dessus fait exactement la même chose que la suivante :

import { Signal, WritableSignal } from "@angular/core";

export class Eleve {

    public nom!: string;
    public prenom!: string;
    public age!: WritableSignal<number>;
    public filiere!: string;
    public photo!: string;

    constructor(nom: string, prenom: string, age: WritableSignal<number>, filiere: string, photo: string) {
        this.nom = nom;
        this.prenom = prenom;
        this.age = age;
        this.filiere = filiere;
        this.photo = photo;
    }

}

 
Ajouter des propriétés personnalisées 

Une propriété personnalisée permet de passer n'importe quel type à un composant lors de son écriture dans le template du composant parent.

Pour permettre cela, il faut ajouter un attribut (dans la classe du composant auquel on veut envoyer la donnée) avec le décorateur @Input() :

@Input() eleve!: Eleve;

Et modifier la classe et le template pour utiliser la nouvelle classe.

 

Une fois cela fait, il faut ajouter la donnée à envoyer dans le composant parent (ici AppComponent) et l'initialiser correctement :

export class App implements OnInit {

  eleve!: Eleve;


  ngOnInit(): void {
    this.eleve = new Eleve("Seux", "Mathieu", 35, "SLAM", "loutre.jpg");
  }
}

Puis passer la variable dans le template :

<app-new-comp [eleve]="eleve"></app-new-comp>


Structurer les pages

    B2-3 - SLAM
    Angular
    Structurer les pages

Conditions d’achèvement

Il arrive fréquemment qu'un bloc HTML doit être affiché :

    Sous certaines conditions : si l'utilisateur est connecté, affiché sa photo de profil, sinon, afficher le bouton de connexion
    En boucle : pour créer une liste

  
 
Afficher sous condition

Il est tout à fait possible d'afficher / masquer des éléments à l'aide du CSS notamment ou en modifiant le CSS avec du JavaScript. Il est pourtant préférable de ne créer la structure (et de l'envoyer au navigateur) que si nécessaire, ne serait-ce que pour des questions de performances de l'application.

Les propriétés optionnelles 

Les propriétés optionnelles, en TypeScript, sont des propriétés (de classes ou méthodes) qui sont...optionnelles, c'est à dire que l'on est pas obligé de renseigner.

Pour déclarer une propriété comme optionnelle, il faut ajouter un ? après son nom lors de sa déclaration :

import { Signal, WritableSignal } from "@angular/core";

export class Eleve {

    constructor(public nom: string,
        public prenom: string,
        public age: WritableSignal<number>,
        public filiere: string,
        public photo: string,
        public adresse?: string) {
    }

}

Dans la classe élève (et son constructeur), la propriété adresse n'est pas obligatoire. Lors de la création on peut donc choisir de renseigner ou non cette valeur :

this.eleve = new Eleve("Seux", "Mathieu", signal(35), "SLAM", "loutre.jpg");
this.eleve2 = new Eleve("Bono", "Jean", signal(19), "SISR", "loutre.jpg", "12 rue du poulet 45890 Lyon");

Tester l'existence de la valeur d'une propriété optionnelle :

if (this.eleve.adresse) {
  console.log("Adresse renseignée");
}
else {
  console.log("Adresse non renseignée");
}

Gestion dans le template

Le choix de créer un bloc HTML sous condition se fait directement dans le template HTML, à l'aide du bloc de contrôle (control block) @if.

Syntaxe :

@if (a > b) {
  {{a}} is greater than {{b}}
} @else if (b > a) {
  {{a}} is less than {{b}}
} @else {
  {{a}} is equal to {{b}}
}

 
Exercice

Dans le composant affichant un élève, afficher un nouveau paragraphe pour afficher l'adresse que si celle si est renseignée.

 

 
Afficher des éléments en boucle

La majorité du temps, lorsque l'on fait une requête vers un serveur pour récupérer des données, on ne sait pas combien le serveur va en renvoyer, il n'est donc pas possible de prévoir une structure HTML bien dimensionnée pour afficher toutes les données correctement.

Il faut donc parcourir la liste de données collectée, pour afficher autant d’éléments qu'elle en contient, pour cela, dans les templates, il faudra utiliser le control block @for.

Syntaxe :

@for (item of items; track item.name) {
    <li>{{ item.name }}</li>
} @empty {
    <li>There are no items.</li>
}

    @for : fonctionne comme une boucle for...of en JavaScript, c'est à dire un parcours d'une liste en remplissant une variable avec l'objet présent à l'index en cours 
    item : nom de la variable changeant à chaque tour de boucle
    items : tableau contenant les objets
    track item.name : la valeur suivant le mot clé track détermine quelle clé sera utilisée par Angular pour identifier les différents éléments de la liste
    @empty : est un bloc utilisable uniquement directement après un bloc @for, son contenu est affiché si la liste à parcourir est vide

 
Exercice

Faire évoluer le AppComponent pour qu'il contienne un tableau d'élèves et que ceux ci soient affichés à l'aide d'un bloc @for.
Modifié le: mardi 17 mars 2026, 19:42



Ajouter du style

    B2-3 - SLAM
    Angular
    Ajouter du style

Conditions d’achèvement

Avant toute chose, il est important de comprendre le fonctionnement des styles dans Angular.

Chaque composant a un fichier de style associé, et dans le composant seuls les styles/classes présents dans ce fichier seront disponibles.

    Une classe présente dans un composant parent n'est pas disponible dans un composant enfant !

La seule exception à cette règle, sont les styles/classes présents dans le fichier styles.css présent à la racine du projet (src), ce fichier sert justement à déclarer les styles/classes globaux.

 

 
ngStyle

NgStyle est une directive permettant de modifier un style CSS en fonction de la valeur d'un attribut, d'un calcul, ... .

Pour commencer, il faut ajouter NgStyle au imports du component :

 

Une directive ngStyle est à intégrer directement dans le template, au niveau des éléments HTML.

Elle est composée de deux parties :

    les clés : les styles CSS à modifier
    les valeurs : les valeurs que doivent prendre ces styles

 
Exemple : 

Dans le composant affichant un élève, si l'on veut faire grandir la taille de la date de naissance en fonction de l'âge de l'élève, il faut faire de la manière suivante :

<span [ngStyle]="{ 'font-size': eleve.age() + 'px'}">{{anneNaissance()}}</span>

Les étapes : 

    Ajouter une balise entourant la valeur à styliser
    Ajouter la directive [ngStyle]
    Première clé : le nom de la propriété CSS
    Deuxième clé : la valeur 

 

 
ngClass

Modifier le style d'un élément peut être utile dans certains cas précis, cependant la majorité du temps en CSS, il faut utiliser les classe.

De la même façon qu'il est possible de modifier un style à la volée avec la directive ngStyle, il est possible de modifier les classes avec la directive ngClass.

Comme précédemment, il faut commencer par ajouter NgClass dans les imports du composant : 

Une directive ngClass est à intégrer directement dans le template, au niveau des éléments HTML.

Elle est composée de deux parties :

    les clés : le nom des classes CSS à appliquer
    les valeurs : les valeurs que doivent prendre ces styles

 
Exemple :

Dans le composant affichant un élève, si l'on veut faire passer la couleur du fond de la div lorsque l'âge est incrémenté (mais lorsqu'il est décrémenté), il faut faire de la manière suivante :
CSS : 

.fondVert {
    background-color: green;
}

HTML : 

<div class="info" [ngClass]="{ 'fondVert':  incAge}">
</div>

Les étapes : 

    Créer / avoir une classe CSS
    Ajouter la directive [ngClass]
    Première clé : le nom des classes CSS
    Deuxième clé : la condition 

Modifié le: jeudi 27 novembre 2025, 13:26



Afficher des données avec les pipes

    B2-3 - SLAM
    Angular
    Afficher des données avec les pipes

Conditions d’achèvement

La source de données (serveur, fichier plat, service interne) prépare les données en termes de quantité et d'organisation :

    N'envoyer que les données nécessaires
    Agréger ce qui doit l'être

Cependant, ces données sont brutes et nécessite souvent un traitement afin de pouvoir être affiché correctement :

    Formatage des dates / nombres
    Passage en minuscule / majuscule
    Abréger un texte

Ce traitement pourrait se faire sur la donnée elle même avant son affichage, toutefois cela nuirait à leur intégrité et leur compatibilité (ou nécessiterait trop de traitement supplémentaires) :

    Formater une date peut la rendre incompatible pour son enregistrement
    Modifier un texte peut entraîner une perte de données 
    ...

 

Pour répondre à ces problématiques, Angular possède un outil : les pipes : |

Un pipe est un opérateur spécial |, qui permet de transformer des données directement dans le template et ce uniquement pour l'affichage, la donnée présente en mémoire n'est pas modifiée !

Un pipe est associé à une fonction de transformation qui est appelée lorsque ce pipe est utilisé.

Il existe des pipes prédéfinis dans Angular : la liste → ici ←

 
 
Utiliser un pipe

Pour utiliser un Pipe, comme pour toutes les fonctionnalités des templates, il faut : 

    Ajouter les imports nécessaires dans la classe TypeScript du component
    Ajouter les imports nécessaires dans le décorateur du component

 

    Un pipe ne peut être utilisé que dans les templates.
    Il est possible d’enchaîner les pipes

 

 
Modifier la casse d'un texte

Il existe trois pipes fournis par Angular pour modifier la casse :

    LowerCasePipe : affiche le texte en minuscules
    UpperCasePipe : affiche le texte en majuscules
    TitleCasePipe :  affiche le texte avec une majuscule au début de chaque mot, avec le reste du mot en minuscules

Exemple : 
TypeScript : 

HTML : 

Résultat : 

 

 
Formater une date

A la différence de minuscule / majuscule, les dates ont de multiples formats d'affichage, il faut donc pouvoir spécifier au pipe quel format on souhaite utilisé à tel endroit.

Pour cela, il est possible de passer des paramètres aux pipes.

Pour formater une date, il faut utiliser le DatePipe. 

Pour envoyer un paramètre à un Pipe, il faut ajouter : derrière son nom dans le template et fournir une valeur correcte.

<div class="item"><span class="label">Année de naissance :</span> {{date | date:"dd:MM:yy"}}</div>

Ici la date sera affichée au format : 07 / 10 / 90

 
Exercice 

Ajouter la date de naissance à la classe Eleve et l'afficher dans le composant à l'aide du DatePipe. 

Vous utiliserez le format que vous souhaitez.

Modifié le: lundi 1 décembre 2025, 14:05



Gérer la logique avec les services

    B2-3 - SLAM
    Angular
    Gérer la logique avec les services

Conditions d’achèvement

Dans une application complète Angular, vous aurez des dizaines, voire des centaines de components différents.

Ces components auront très souvent besoin d'accéder aux mêmes données. Il y aura des interactions courantes avec ces données, comme l'écriture, la modification et la suppression.

L'application peut également avoir besoin d'interagir avec un serveur concernant ces données, pour la lecture et l'enregistrement. 

Pour mieux organiser le code, pour éviter de répéter des blocs et pour toujours avoir des données à jour partout dans l'application, il est intéressant de pouvoir regrouper les données et leurs méthodes ensemble, de les centraliser.

Avec Angular, cette centralisation se fait dans des services.

 
Restructurer l'application

Pour l'instant, l'application de démo :

    Contient un composant représentant un élève 
    Contient une classe Élève
    C'est l'AppComponent qui porte la liste des élèves
        Ceci n'est pas possible puisque l'appComponent représente l'application complète, pas juste un écran !

Pour afficher plusieurs élèves provenant d'une liste, il est nécessaire de créer un composant capable de gérer cette liste (affichage, tri, action(s) par élève).
Générer le nouveau composant :

 ng generate component eleveComponentList

Ce nouveau composant, chargé de gérer une liste, doit donc en avoir la charge : il faut déplacer la logique et le template de appComponent vers eleveComponentList :
Template :

@for(el of eleves; track el.nom)
{
    <app-new-comp [eleve]="el" />
}

TS :

import { Component, signal } from '@angular/core';
import { Eleve } from '../../models/eleve.model';
import { NewComp } from '../new-comp/new-comp'

@Component({
  selector: 'app-eleve-list-component',
  imports: [NewComp],
  templateUrl: './eleve-list-component.html',
  styleUrl: './eleve-list-component.css',
})
export class EleveListComponent implements OnInit{
  eleves!:Eleve[];

  ngOnInit(): void {
    this.eleves = [new Eleve("Seux", "Mathieu", signal(35), "SLAM", "loutre.jpg"),
                  new Eleve("Bono", "Jean", signal(19), "SISR", "loutre.jpg", "12 rue du poulet 45890 Lyon")];

  }
}

Et enfin, afficher un eleveComponentList dans app.html :

<app-eleve-list-component></app-eleve-list-component>

 

Logiquement, après ces modifications, l'application fonctionne toujours et n'a pas changée...mais elle est mieux structurée.

 
Exercice : Ajouter un header pour l'application

    Créer un nouveau composant: header
    Faire en sorte que le composant :
        S'affiche en haut de la page
        Affiche le nom de l'application

Résultat attendu :

 
Création du service

Un service Angular est une classe chargée de centraliser les données et les règles de gestions côté client.

Commencer par créer un dossier services à la racine du site (au même niveau que app et models) :

Un service est une classe, et la façon la plus simple de déclarer une classe comme étant un service est d'utiliser le décorateur  @Injectable()  qui s'importe depuis  @angular/core  :

import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})

export class EleveService {
  
}

Dans Angular, @Injectable est une décoration qui indique qu'une classe peut être utilisée comme un service injectable. Cela signifie qu'il est possible d'injecter une instance de cette classe dans d'autres classes de l'application, comme un composant ou un autre service.

L'objet de configuration qui spécifie  providedIn: 'root'  dit à Angular d'enregistrer ce service à la racine de l'application. Ce sera très souvent le cas pour les services, car cela permet de s'assurer de n'avoir qu'une seule instance du service, partagée par tous les consommateurs intéressés.

 

Il faut maintenant déporter la logique de la gestion des élèves dans le service...il faut donc que ce soit le service qui porte la liste :

export class EleveService {
  
    private eleves : Eleve[] = [
                new Eleve("Seux", "Mathieu", signal(35), "SLAM", "loutre.jpg"),
                new Eleve("Bono", "Jean", signal(19), "SISR", "loutre.jpg", "12 rue du poulet 45890 Lyon")
            ];

  getEleves(): Eleve[] {
      return [...this.eleves];
    }

}

 
Injection d'un service

Pour pouvoir utiliser un service dans un composant, il faut utiliser le système d'injection de dépendances (dependency injection ou DI) que fournit Angular.

C'est très simple : il suffit de passer un argument du type du service au constructeur du composant, et Angular fournit la bonne instance du service.

Dans eleveListComponent :

export class EleveListComponent implements OnInit{
  eleves!:Eleve[];

  constructor(private eleveService: EleveService) { }

  ngOnInit(): void {
    this.eleves = this.eleveService.getEleves();
  }
}

 
Centraliser les interactions

Dans une application dynamique, il faut imaginer que les élèves viennent d'un serveur, ou d'une autre partie de l'application, et qu'il faut appeler une méthode pour les récupérer.

D'ailleurs, toute modification d'un Élève entraînera un appel au serveur pour sauvegarde des données...

Il faut donc centraliser toutes les interactions avec les Élèves dans EleveService !

 

Pour le moment, la seule interaction possible sur un Élève est d'augmenter son âge, et cette interaction se fait dans le composant associé. Ceci fait que la modification de l'élève est faite

uniquement dans le composant, et personne en dehors n'est notifié de cette modification...pour pouvoir réagir correctement à cette modification, il faut qu'elle se fasse dans  le service associé.

Pour pouvoir gérer cela correctement, il faut pouvoir identifier un élève dans la liste contenue dans le service, il faut donc ajouter un identifiant sur la classe Élève :

export class Eleve {

    constructor(
        public int:number,
        public nom: string,
        public prenom: string,
        public age: WritableSignal<number>,
        public filiere: string,
        public photo: string,
        public adresse?: string) {
    }

}

Dans le service, il faut maintenant créer la méthode permettant de modifier l'âge du bon élève :

addAgeEleveById(id:number, incAge:boolean)
{
  var eleve =  this.eleves.find(eleve => eleve.id == id);
  
  if (!eleve)
	 throw new Error('Eleve non trouvé !');
  
  if(incAge)
	eleve.age.update(value => value + 1);
  else
	eleve.age.update(value => value - 1);
}

 

Normalement, votre application fonctionne toujours comme précédemment...cependant le moteur a changé :

    Un service est en charge la gestion des données
    La modification des données à l'intérieur des composants modifie les valeurs des données contenues dans le service

Modifié le: jeudi 19 mars 2026, 13:05





Gérer les routes

    B2-3 - SLAM
    Angular
    Gérer les routes

Conditions d’achèvement

Les Single Page Applications (ou SPA) sont de plus en plus courantes dans le monde du développement web moderne.

Elles permettent une performance sans égale en enlevant le besoin d'une application de demander, recevoir, puis afficher une nouvelle page HTML à chaque changement d'URL.

Angular permet avec le routing de créer ce genre d'application – à chaque URL correspondra un composant, et Angular remplacera le composant actif sans émettre de requête au serveur (sauf pour les données dynamiques si besoin).

 
Créer des routes

La configuration des routes de l'application se fait dans  app.routes.ts. 

Pour ajouter une route, il faut modifier le tableau routes en y ajoutant une route :

{ path: 'chemin', component: nomDuComposant }

Pour le composant EleveListComponent :

{ path: 'eleves', component: EleveListComponent }

Ceci fonctionne car par défaut Angular lie le routeur à cette variable dans app.config.ts :

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes)
  ]
};

 
Route par défaut

Pour utiliser les routes, il faut utiliser le composant RouterOutlet.

C'est ce dernier qui sera chargé de choisir le composant à afficher en fonction de la route.

Dans le composant principal :

AppComponent représentant la racine de l'application, c'est elle qui doit contenir le routeur principal et les zones fixes (header, footer, menu,...).
Template :

<app-header />
<router-outlet />

TS : 

import { Component, OnInit, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.css',
  imports: [RouterOutlet],
})
export class App implements OnInit {

  ngOnInit(): void {

  }
}

Rendu localhost:4200 :

Ici à part le header, l'application n'affiche plus rien !

C'est normal car le routeur n'a reçu aucune route, et aucune route par défaut n'a été configurée.
Rendu localhost:4200/eleves :

Ici le routeur a bien une route, et affiche le bon composant.

Il faut donc définir une route par défaut, la page d'accueil.
Création d'un AccueilComponent

ng generate c Accueil

Il faut y ajouter un lien pour accéder au composant listant les élèves.

Le composant est maintenant créé, il faut l'ajouter comme route par défaut dans app.routes.ts :

{ path: '', component: AccueilComponent }

Il sera désormais affiché à chaque fois que la route sera vide.

 
Changer de route

Afin de pouvoir rediriger la route vers un composant particulier, il faut utiliser la directive RouterLink.
Dans AccueilComponent :
Template :

<a routerLink="eleves">Aller voir les élèves</a>

TS :

 imports: [RouterLink],

Le clic sur lien HTML redirige désormais bien vers la liste des élèves.
Revenir en arrière

Attention, pour revenir d'une route en arrière, il faut précéder le nom de la route par un / car le routeur essaiera d'accéder à une route enfant.

 
Gestion de la route active

Une application complexe comporte toujours un menu, et pour que l'utilisateur s'y retrouve, l'application doit afficher le menu actif (page ou sous page affichée).

Pour gérer cela, Angular fournit un attribut HTML : routerLinkActive, auquel il est possible de rajouter une classe CSS pour le faire ressortir différemment.

 

<a routerLink="" routerLinkActive="cssClass">Lien</a>

Attention, une route est considérée comme active lorsqu'elle même ou l'une des routes enfants est sélectionnée. Angular permet de vérifier si la route active est bien la route exacte :

<a routerLink="" routerLinkActive="cssClass" [routerLinkActiveOptions]="{ exact: true }">Lien</a>

 
Naviguer avec le routeur

Il est également d'injecter le routeur directement dans un composant pour l'utiliser dans le code TypeScript ainsi gérer le changement de composant programmatiquement.
Dans AccueilComponent
Template :

<div class="landing-block">
  <img src="loutre.jpg" alt="Snapface logo" width="400px">
  
  <div class="landing-links">
    <br/><br/><br/>
    <button  (click)="showEleves()">Aller voir les élèves</button >
  </div>
</div>

TS : 

export class AccueilComponent {

  constructor(private router: Router) { }
  
  showEleves()
  {
      this.router.navigateByUrl('eleves');
  }
}

 
Passer des paramètres à une route

Il est souvent utile de passer des paramètres (id notamment) à une route, puisque de nouvelles données seront affichées.

La configuration des paramètres d'une route se fait encore une fois dans app.routes.ts :

{ path: 'route/:id', component: Composant }

Le :id après la route correspond à un paramètre nommé id qui sera envoyé au composant cible.

On peut donc avoir des routes identiques (avec juste des paramètres qui diffèrent) qui renvoie vers des composants différents.

 
Récupérer des paramètres de route

Il faut, dans le composant cible, injecter ActivatedRoute

constructor(private route: ActivatedRoute) {}

Ensuite, dans la méthode ngOnInit(), le paramètre sera accessible comme ci dessous :

let id = this.route.snapshot.params['id'];

Une fois l'id récupéré, il peut être utilisé pour récupérer l'objet à partir du service.
Modifié le: jeudi 19 mars 2026, 13:05

Maintenant que l'on sait comment architecturer une application Angular avec des données statiques, il faut rendre ces dernières dynamiques...et donc les récupérer depuis un serveur !

Tout d'abord, il faut dire à Angular que l'application va utiliser des requêtes HTTP.

Dans app.config.ts, il faut ajouter provideHttpClient():

providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient()
  ]

 
Création des composants

Pour cet exercice de démonstration, nous allons utiliser l'API suivante : https://jsonplaceholder.typicode.com/users

Cet API expose des utilisateurs dont nous allons utiliser les données suivantes :

    id
    name
    username
    email

Générer un composant User :

ng generate component userComponent

Template :

<div class="card">
  <h1 class="name" id="display-name">{{utilisateur.name}}</h1>
  <div class="divider"></div>
  <div class="field">
    <span class="field-label">Nom utilisateur</span>
    <span class="field-value" id="display-login">{{utilisateur.username}}</span>
  </div>
  <div class="field">
    <span class="field-label">Email</span>
    <span class="field-value" id="display-email">{{utilisateur.email}}</span>
  </div>
</div>

Css :

.card {
      width: 360px;
      background: #ffffff;
      border: 1px solid #e0e0de;
      border-radius: 6px;
      padding: 36px 32px;
      margin:20px;
    }

    .name {
      font-size: 1.25rem;
      font-weight: 500;
      color: #1a1a1a;
      margin-bottom: 20px;
    }

    .divider {
      height: 1px;
      background: #e8e8e6;
      margin-bottom: 20px;
    }

    .field {
      display: flex;
      align-items: baseline;
      gap: 12px;
      padding: 6px 0;
    }

    .field + .field {
      border-top: 1px solid #f0f0ee;
    }

    .field-label {
      font-size: 0.65rem;
      font-weight: 500;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: #aaa;
      width: 48px;
      flex-shrink: 0;
    }

    .field-value {
      font-size: 0.85rem;
      color: #444;
      font-weight: 300;
    }

TS :

import { Component, Input } from '@angular/core';
import { User } from '../../models/user.model';

@Component({
  selector: 'app-user',
  imports: [],
  templateUrl: './user.html',
  styleUrl: './user.css',
})
export class UserComponent {
  @Input() utilisateur!: User;
  
}

 
Générer un composant UserList :

ng generate component userListComponent

Template :

@for(user of utilisateurs; track user.id)
{
    <app-user [utilisateur]="user"></app-user>
}

Css :

.row {
    display: flex; /* Flexbox */
    flex-direction: row; /* En ligne, pas obliger de le mettre car il y est déjà par défaut */
}

TS :

import { Component } from '@angular/core';
import { User } from '../../models/user.model';
import { UsersService } from '../../services/users.service';
import { UserComponent } from '../user/user';

@Component({
  selector: 'app-user-list',
  imports: [UserComponent],
  templateUrl: './user-list.html',
  styleUrl: './user-list.css',
})
export class UserListComponent {

utilisateurs!:User[];

  constructor(private userService: UsersService) { }

  ngOnInit(): void {
    this.utilisateurs = this.userService.getUtilisateurs();
  }

}

 
Créer le model User :

export class User {
    constructor(
        public id:number,
        public name:string,
        public username:string,
        public email:string)
        {    }
}

 
Créer le service UsersService :

import { Injectable, signal } from '@angular/core';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})

export class UsersService {
  
    private utilisateurs : User[] = [];

    getUtilisateurs() : User[]
    {
       return this.utilisateurs;
    }
}

 
Utilisation dans les services

Comme vu précédemment, ceux sont les services qui sont en charge de la gestion des données, ceux sont donc eux qui vont faire appel au serveur.

Pour pouvoir effectuer des appels HTTP depuis un service, il faut injecter HttpClient au service voulu :

export class UsersService {
  
  constructor(private http:HttpClient){}

  //...
}

Créer ensuite la méthode qui va appeler l'API : 

getUtilisateurFromHTTP()
{
  return this.http.get('https://jsonplaceholder.typicode.com/users');
}

Attention : toutes les méthodes du HttpClient retournent des Observables. Si vous ne souscrivez pas à ces Observables, il ne se passe rien : aucune requête n'est envoyée.

Un Observable est un objet qui représente un flux de données asynchrone auquel il est possible de s'abonner pour réagir aux valeurs émises au fil du temps. 

 
Quel objet est censé recevoir les données du service ? 

La liste d'utilisateurs contenue dans le composant UserList, c'est donc cette liste qui doit être transformée en Observable :

utilisateurs!:Observable<User[]>;

Il faut également modifier son chargement dans la méthode ngOnInit :

 ngOnInit(): void {
    this.utilisateurs = this.userService.getUtilisateurFromHTTP();
  }

 

Si tout se passe bien, une erreur devrait apparaître :

Type 'Observable<Object>' is not assignable to type 'Observable<User[]>'

Ceci se produit car TypeScript n'est pas capable de transformer Observable<Object> (type de retour de HttpClient.get) en Observable<User[]> (type attendu par le service).

Il faut donc modifier la méthode dans le service :

getUtilisateurFromHTTP()
{
  return this.http.get<User[]>('https://jsonplaceholder.typicode.com/users');
}

Le type passé entre les chevrons indique à TypeScript dans quel objet il doit désérialiser les données reçues.

 

Ici, normalement, plus d'erreur...et pourtant la liste ne s'affiche toujours pas !

C'est au niveau du composant de la liste qu'il faut faire la dernière modification. En effet, jusqu'à présent, les composants affichaient des données statiques, donc synchrones...il faut ici indiquer au template que la liste provient d'une source de données asynchrone...à l'aide du pipe AsyncPipe.
Template :

@for(user of utilisateurs | async; track user.id)
{
    <app-user [utilisateur]="user"></app-user>
}

TS : 

imports: [UserComponent, AsyncPipe],

 
Afficher une page Détail

Généralement, une liste n'affiche pas tous les champs d'un objet, il faut accéder à une page de détail pour voir toutes ses informations.

Pour cela, il faut :

    Générer un nouveau composant
    Créer la route vers ce nouveau composant
    Faire évoluer le service
    Faire évoluer la modèle
    Modifier le composant UserComponent pour y ajouter un bouton vers la page détail

 
Création du composant UserDetail

ng generate c userDetails

Template :

@let us = user | async;
<article class="card">
    <h2 class="name">{{us?.name}}</h2>
    <div class="divider"></div>

    <div class="section-title">Contact</div>
    <div class="field">
      <span class="field-label">Login</span>
      <span class="field-value">{{us?.username}}</span>
    </div>
    <div class="field">
      <span class="field-label">Email</span>
      <span class="field-value">{{us?.email}}</span>
    </div>
    <div class="field">
      <span class="field-label">Téléphone</span>
      <span class="field-value">{{us?.phone}}</span>
    </div>

    <div class="section-title">Adresse</div>
    <div class="field">
      <span class="field-label">Rue</span>
      <span class="field-value">{{us?.address?.street}}</span>
    </div>
    <div class="field">
      <span class="field-label">Complément</span>
      <span class="field-value">{{us?.address?.suite}}</span>
    </div>
    <div class="field">
      <span class="field-label">Code postal</span>
      <span class="field-value">{{us?.address?.zipcode}}</span>
    </div>
    <div class="field">
      <span class="field-label">Ville</span>
      <span class="field-value">{{us?.address?.city}}</span>
    </div>
  </article>

CSS :

    .grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 20px;
      width: 100%;
      max-width: 820px;
    }

    .card {
      background: #ffffff;
      border: 1px solid #e0e0de;
      border-radius: 6px;
      padding: 28px 24px;
    }

    .name {
      font-size: 1.1rem;
      font-weight: 500;
      color: #1a1a1a;
      margin-bottom: 16px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .divider {
      height: 1px;
      background: #e8e8e6;
      margin-bottom: 14px;
    }

    /* ── Section title ── */
    .section-title {
      font-size: 0.58rem;
      font-weight: 500;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: #c0c0be;
      margin: 14px 0 6px;
    }

    /* ── Fields ── */
    .field {
      display: flex;
      align-items: baseline;
      gap: 10px;
      padding: 5px 0;
    }

    .field + .field {
      border-top: 1px solid #f0f0ee;
    }

    .field-label {
      font-size: 0.6rem;
      font-weight: 500;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #bbb;
      width: 80px;
      flex-shrink: 0;
    }

    .field-value {
      font-size: 0.8rem;
      color: #444;
      font-weight: 300;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .field-value.muted {
      color: #999;
      font-style: italic;
    }

    @media (max-width: 560px) {
      .grid { grid-template-columns: 1fr; }
    }

TS :

import { Component, Input } from '@angular/core';
import { UsersService } from '../../services/users.service';
import { Observable } from 'rxjs';
import { User } from '../../models/user.model';
import { AsyncPipe } from '@angular/common';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-user-details',
  imports: [AsyncPipe],
  templateUrl: './user-details.html',
  styleUrl: './user-details.css',
})
export class UserDetails {
  id!: number;

  user! : Observable<User>;
  constructor(private userService: UsersService, private route: ActivatedRoute) { }
  
  ngOnInit() {
    this.user = this.userService.getUtilisateurById(this.route.snapshot.params['id']);
  }
}

 
app.route.ts

Ajouter la route suivante :

{ path: 'users/:id', component: UserDetails }

 
user.model.ts

Ajout des champs : 

    phone:string
    address:Address

export class User {
    constructor(
        public id:number,
        public name:string,
        public username:string,
        public email:string,
        public phone:string,
        public address:Address)
        {    }
}

Création d'une classe Address :

export class Address {
constructor(
        public street:string,
        public suite:string,
        public city:string,
        public zipcode:string)
        {    }
}

 
Modification du service 

Nouvel appel serveur :

getUtilisateurById(id: number) 
{
      return this.http.get<User>(`https://jsonplaceholder.typicode.com/users/` + id);
}

 
Modification du composant UserComponent
Template :

<div class="card">
  <h1 class="name" id="display-name">{{utilisateur.name}}</h1>
  <div class="divider"></div>
  <div class="field">
    <span class="field-label">Nom utilisateur</span>
    <span class="field-value" id="display-login">{{utilisateur.username}}</span>
  </div>
  <div class="field">
    <span class="field-label">Email</span>
    <span class="field-value" id="display-email">{{utilisateur.email}}</span>
  </div>
  <button (click)="onDetail()" >Afficher details</button>
</div>

TS :

import { Component, Input } from '@angular/core';
import { User } from '../../models/user.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-user',
  imports: [],
  templateUrl: './user.html',
  styleUrl: './user.css',
})

export class UserComponent {
  @Input() utilisateur!: User;
  
  constructor(private router: Router)  {  }

  onDetail()
  {
    this.router.navigateByUrl('users/'+this.utilisateur.id);
  }
}

Modifié le: samedi 21 mars 2026, 15:04


Créer des requêtes complexes et réagir aux réponses

    B2-3 - SLAM
    Angular
    Créer des requêtes complexes et réagir aux réponses

Conditions d’achèvement
Création d'un utilisateur
Création du composant

ng generate c createUser

Template :

<div class="card">

  <h2>Ajouter le contact</h2>

  <div class="field">
    <label for="username">Login</label>
    <input type="text" [(ngModel)]="utilisateur.username" id="username" placeholder="Login" />
  </div>

  <div class="field">
    <label for="telephone">Téléphone</label>
    <input type="tel" id="telephone" name="telephone" [(ngModel)]="utilisateur.phone" placeholder="06 00 00 00 00" />
  </div>

  <div class="divider"></div>

  <div class="actions">
    <button type="button" class="btn-save" (click)="onSubmit()">Enregistrer</button>
  </div>
</div>

CSS :

.card {
  width: 100%;
  max-width: 400px;
  background: #ffffff;
  border: 1px solid #e0e0de;
  border-radius: 6px;
  padding: 32px 28px;
}

h2 {
  font-size: 1rem;
  font-weight: 500;
  color: #1a1a1a;
  margin-bottom: 24px;
}

.field {
  display: flex;
  flex-direction: column;
  gap: 6px;
  margin-bottom: 16px;
}

label {
  font-size: 0.62rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: #aaa;
}

input {
  font-family: 'Inter', sans-serif;
  font-size: 0.85rem;
  font-weight: 300;
  color: #1a1a1a;
  background: #fafafa;
  border: 1px solid #e0e0de;
  border-radius: 4px;
  padding: 9px 12px;
  outline: none;
  transition: border-color 0.15s;
}

input:focus {
  border-color: #aaa;
  background: #fff;
}

.divider {
  height: 1px;
  background: #e8e8e6;
  margin: 24px 0;
}

.actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

button {
  font-family: 'Inter', sans-serif;
  font-size: 0.8rem;
  font-weight: 400;
  padding: 8px 18px;
  border-radius: 4px;
  cursor: pointer;
  border: 1px solid #e0e0de;
  transition: background 0.15s, border-color 0.15s;
}

.btn-cancel {
  background: #fff;
  color: #666;
}

.btn-cancel:hover {
  background: #f4f4f2;
}

.btn-save {
  background: #1a1a1a;
  color: #fff;
  border-color: #1a1a1a;
}

.btn-save:hover {
  background: #333;
}

TS :

import { Component, Input } from '@angular/core';
import { User } from '../../models/user.model';
import { FormsModule } from '@angular/forms';
import { UsersService } from '../../services/users.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-create-user',
  imports: [FormsModule ],
  templateUrl: './create-user.html',
  styleUrl: './create-user.css',
})
export class CreateUser {
   utilisateur!:User ;

  constructor(private userService:UsersService, private routeur:Router)  {  }

  ngOnInit()
  {
      this.utilisateur = new User();
  }

  onSubmit()
  {
    this.userService.creerUtilisateur(this.utilisateur).subscribe({
      next: (user) => {
        //Requête OK -> redirection vers la page détail de l'objet créé par exemple
        console.log(user);
      },
      error: (err) => {
        //Requête KO -> redirection vers la page d'erreur
        console.log(err);
      }
    });
  }
}

 
Modifier un utilisateur

Il est possible ici de réutiliser le même composant que pour la création, en apportant quelque modifications :

    Modifier le composant Détail pour :
        Ajouter un bouton d'accès au composant de modification
        Gérer cet utilisateur dans les composants Détails et Create
        Gérer l'utilisateur sélectionné à travers le service

 
Modification du composant Détail
Template :

@let us = user | async;
<article class="card">
    <h2 class="name">{{us?.name}}</h2>
    <div class="divider"></div>

    <div class="section-title">Contact</div>
    <div class="field">
      <span class="field-label">Login</span>
      <span class="field-value">{{us?.username}}</span>
    </div>
    <div class="field">
      <span class="field-label">Email</span>
      <span class="field-value">{{us?.email}}</span>
    </div>
    <div class="field">
      <span class="field-label">Téléphone</span>
      <span class="field-value">{{us?.phone}}</span>
    </div>

    <div class="section-title">Adresse</div>
    <div class="field">
      <span class="field-label">Rue</span>
      <span class="field-value">{{us?.address?.street}}</span>
    </div>
    <div class="field">
      <span class="field-label">Complément</span>
      <span class="field-value">{{us?.address?.suite}}</span>
    </div>
    <div class="field">
      <span class="field-label">Code postal</span>
      <span class="field-value">{{us?.address?.zipcode}}</span>
    </div>
    <div class="field">
      <span class="field-label">Ville</span>
      <span class="field-value">{{us?.address?.city}}</span>
    </div>
  </article>

  <button (click)="onModif()">Modifier</button>

TS :

import { Component, Input } from '@angular/core';
import { UsersService } from '../../services/users.service';
import { Observable, take } from 'rxjs';
import { User } from '../../models/user.model';
import { AsyncPipe } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-user-details',
  imports: [AsyncPipe],
  templateUrl: './user-details.html',
  styleUrl: './user-details.css',
})
export class UserDetails {
  id!: number;

  user! : Observable<User>;
  constructor(private userService: UsersService, private route: ActivatedRoute, private router:Router) { }
  
  ngOnInit() {
    this.user = this.userService.getUtilisateurById(this.route.snapshot.params['id']);
  }

  onModif()
  {
      this.user.pipe(take(1)).subscribe(user => {
        this.userService.select(user);
        this.router.navigateByUrl('/createUser');
      });
  }

}

 
Composant Create
TS :

import { Component, Input } from '@angular/core';
import { User } from '../../models/user.model';
import { FormsModule } from '@angular/forms';
import { UsersService } from '../../services/users.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-create-user',
  imports: [FormsModule ],
  templateUrl: './create-user.html',
  styleUrl: './create-user.css',
})
export class CreateUser {
  utilisateur!:User;

  constructor(private userService:UsersService, private routeur:Router)  {  }

  ngOnInit()
  {
    if(this.userService.getSelectedUser())
    {
      this.utilisateur = this.userService.getSelectedUser();
    }
    else
    {
      this.utilisateur = new User();
    }
  }

  onSubmit()
  {
    this.userService.creerUtilisateur(this.utilisateur).subscribe({
      next: (user) => {
        //Requête OK -> redirection vers la page détail de l'objet créé par exemple
        console.log(user);
      },
      error: (err) => {
        //Requête OK -> redirection vers la page d'erreur
        console.log(err);
      }
    });
  }
}

 
UserService :

import { Injectable, signal, WritableSignal } from '@angular/core';
import { User } from '../models/user.model';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class UsersService {
  
    private utilisateurs : User[] = [];

    private selectedUser : WritableSignal<User> = signal<User>(new User());
    constructor(private http:HttpClient){}

    getUtilisateurs() : User[]
    {
       return this.utilisateurs;
    }
    
    getUtilisateurFromHTTP() : Observable<User[]>
    {
      return this.http.get<User[]>('https://jsonplaceholder.typicode.com/users');
    }

    getUtilisateurById(id: number) 
    {
      return this.http.get<User>(`https://jsonplaceholder.typicode.com/users/` + id);
    }

    creerUtilisateur(utilisateur:User)
    {
      if(utilisateur.id == 0)
        return this.http.post<User>(`https://jsonplaceholder.typicode.com/users/`, {utilisateur})
      else
        return this.http.put<User>(`https://jsonplaceholder.typicode.com/users/`+utilisateur.id, {utilisateur})

    }

    select(user: User) {
      this.selectedUser.set(user);
    }

    getSelectedUser()
    {
      return this.selectedUser();
    }
}

 
Résumé 

Lier les données du TypeScript avec le template dans les deux sens :

    Importer FormsModule et utiliser [(ngModel)]

 

Gérer les réponses d'une requête (Observable) :

    S'abonner à l'observable avec .subsribe()
        Utiliser next pour une réponse OK
        Utiliser error pour une réponse KO

 

Passer des données entre les composants :

    Utiliser @Input pour passer des données depuis les templates
    Utiliser les routes pour récupérer les données dans l'URL
    Utiliser les services pour stocker l'objet en cours, ou pour faire appel au serveur

Modifié le: lundi 23 mars 2026, 12:02