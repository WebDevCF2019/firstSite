<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UtilisateursRepository")
 */
class Utilisateurs
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $lelogin;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $lemail;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $dateInscription;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLelogin(): ?string
    {
        return $this->lelogin;
    }

    public function setLelogin(string $lelogin): self
    {
        $this->lelogin = $lelogin;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getLemail(): ?string
    {
        return $this->lemail;
    }

    public function setLemail(string $lemail): self
    {
        $this->lemail = $lemail;

        return $this;
    }

    public function getDateInscription(): ?\DateTimeInterface
    {
        return $this->dateInscription;
    }

    public function setDateInscription(?\DateTimeInterface $dateInscription): self
    {
        $this->dateInscription = $dateInscription;

        return $this;
    }
}
