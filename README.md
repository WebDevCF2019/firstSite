# firstSite
### Premier site en Symfony 5

#### Création d'un contrôleur

    php bin/console make:controller

On l'appelle BaseController. Dans src/controller/BaseController.php

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
#### Pour lancer le server

    symfony server:start        