<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Articles;
use App\Entity\Utilisateurs;

class BaseController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index()
    {
        $util = $this->getDoctrine()
            ->getRepository(Utilisateurs::class)
            ->find(1);

        dump($util);
        return $this->render('base/index.html.twig', [
            'controller_name' => 'BaseController',
        ]);
    }
}
