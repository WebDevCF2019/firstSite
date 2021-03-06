# firstSite
## Premier site en Symfony 5
### Pour installer Symfony sous Windows
Téléchargez celui-ci sur :
https://symfony.com/download

Puis, dans le dossier désiré, installez celui-ci avec la commande:

    symfony new firstSite --full
### Pour lancer le serveur
Mettez-vous dans le dossier firstSite

    symfony server:start 
### Création d'un contrôleur


    php bin/console make:controller

On l'appelle BaseController. Il se place ici : src/controller/BaseController.php
Modifions le chemin des annotations à "/" et le nom à "homapage" :

    <?php
    
    namespace App\Controller;
    
    use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
    use Symfony\Component\Routing\Annotation\Route;
    
    class BaseController extends AbstractController
    {
        /**
         * @Route("/", name="homepage")
         */
        public function index()
        {
            return $this->render('base/index.html.twig', [
                'controller_name' => 'BaseController',
            ]);
        }
    }
### Création de .env.local
C'est une copie de .env qui se trouve dans .gitignore, il ne sera donc pas envoyé sur un serveur git (github ...) pour des raisons de sécurité (par exemple la connexion à la db se trouve dans ce fichier)    

On peut tester ce fichier en changeant

    APP_ENV=dev
en

    APP_ENV=prod    
On passe ici du mode développement au mode production

### Accès au site
Dans .env.local on peut permettre à accès qu'aux hôtes mentionnés en décommentant:

    # hôtes autorisés pour accèder au site séparés par des pipes |
    TRUSTED_HOSTS='^localhost|example\.com|127.0.0.1$'    
    
### Chargement de bootstrap
On crée un dossier datas puis on télécharge bootstrap 4 : https://getbootstrap.com/docs/4.3/getting-started/download/

On dézipe le fichier bootstrap, on met ensuite les dossiers js et css dans le dossier /public

on utilise asset pour la gestion de ces fichiers:

    <script src="{{ asset('js/popper.min.js') }}"></script>    
    
On a créé un fichier twig nommé bootstrap4.html.twig qui charge le css et les jss de bootsrap, tous fichiers utilisant bootstrap devront être les "enfants" de celui-ci: 

    templates/base/index.html.twig
contient donc:

    {% extends 'bootstrap4.html.twig' %}
### Création d'une database mysql
dans .env.local on va changer

    DATABASE_URL=mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7
par :

    DATABASE_URL=mysql://root:@127.0.0.1:3306/firstsite?serverVersion=5.7   
Ceci devrait, en local du moins, permettre la création de la DB en utilisant doctrine

    php bin/console doctrine:database:create
La database "firstsite" est maintenant créée    
### Création d'entités

    php bin/console make:entity    
    
On crée 2 futures tables : Articles et Utilisateurs, en choisissant le nom des champs (sauf l'id)

Sont créés le mapping de ces tables (dans src/Entity/) avec les getters et setters

Sont également créés leurs Repository (dans src/Repository) les "managers" des tables ci-dessus
### Voir les services actifs

    php bin/console debug:autowiring --all
### Pour créer le fichier de migration vers MySQL

    php bin/console make:migration
Création d'un fichier php contenant le sql créant les tables        
### Migration vers votre database

    php app/console doctrine:migrations:migrate
Les tables ont bien été créées sur le database sql

pour voir si nos mapping sont valides :

    php bin/console doctrine:mapping:info
    
Pour vérifier la synchronicité entre les tables de la DB et les fichiers de mapping

    php bin/console doctrine:schema:validate
    
### Création d'une relation OneToMany entre Utilisateurs et Articles

Dans src/Entity/Articles.php (c'est du ManyToOne ! On crée les getters et setters, les noms utilisés sont ceux de la table qu'on veut lier (namespace et nom de la classe) !

    /**
         * @ORM\ManyToOne(targetEntity="App\Entity\Utilisateurs", inversedBy="articles")
         */
        private $utilisateurs;
    
        public function getUtilisateurs(): ?Utilisateurs
        {
            return $this->utilisateurs;
        }
    
        public function setUtilisateurs(?Utilisateurs $utilisateurs): self
        {
            $this->utilisateurs = $utilisateurs;
    
            return $this;
        }            
Dans src/Entity/Utilisateurs.php (c'est du OneToMany ! On crée les getters et un constructeur pour les mettres au format tableaux, les noms utilisés sont ceux de la table qu'on veut lier (namespace et nom de la classe) ! On doit utiliser en plus, (pour la gestion du many)     

    ...
    use Doctrine\Common\Collections\ArrayCollection;
    use Doctrine\Common\Collections\Collection;
    use Doctrine\ORM\Mapping as ORM;
    ... 
    ...
     /**
      * @ORM\OneToMany(targetEntity="App\Entity\Articles", mappedBy="utilisateurs")
      */
        private $articles;
    
        public function __construct()
        {
            $this->articles = new ArrayCollection();
        }
    
        /**
         * @return Collection|Articles[]
         */
        public function getArticles(): Collection
        {
            return $this->articles;
        }
Pour vérifier si le mapping est toujours exacte, on vide d'abord le cache:

    php bin/console cache:clear
Puis on vérifie le mapping

    php bin/console doctrine:schema:validate

Si le mapping est exacte: [OK], normalement la DB est en [ERROR], car il n'y a plus de lien entre les fichiers et la db

Pour voir les requêtes pour mettre à jour la DB (synchronisation)

    php bin/console doctrine:schema:update --dump-sql
    
Pour réellement mettre à jour la DB

    php bin/console doctrine:schema:update --force
                    