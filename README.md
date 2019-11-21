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
### Chargement de bootstrap
On crée un dossier datas puis on télécharge bootstrap 4 : https://getbootstrap.com/docs/4.3/getting-started/download/

       