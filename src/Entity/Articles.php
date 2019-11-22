<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ArticlesRepository")
 */
class Articles
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $titre;

    /**
     * @ORM\Column(type="text")
     */
    private $letexte;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $ladate;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getLetexte(): ?string
    {
        return $this->letexte;
    }

    public function setLetexte(string $letexte): self
    {
        $this->letexte = $letexte;

        return $this;
    }

    public function getLadate(): ?\DateTimeInterface
    {
        return $this->ladate;
    }

    public function setLadate(?\DateTimeInterface $ladate): self
    {
        $this->ladate = $ladate;

        return $this;
    }
}
