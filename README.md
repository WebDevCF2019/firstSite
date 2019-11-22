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
              