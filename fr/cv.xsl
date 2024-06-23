<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template pour correspondre à l'élément racine cv -->
    <xsl:template match="cv">
        <!-- En-tête -->
        <header>
            <h1 id="title">CV de Costa TRAN</h1>
        </header>
        <nav>
            <a href="index.html">Accueil</a>
            <a href="cv.html">CV</a>
            <!-- Sélecteur de langue -->
            <div id="lang-selector">
                <img src="./img/fr-flag.png" alt="Français" class="flag" data-lang="fr" />
                <img src="./img/en-flag.png" alt="English" class="flag" data-lang="en" />
                <img src="./img/ja-flag.png" alt="日本語" class="flag" data-lang="ja" />
            </div>
        </nav>
        <main>
            <!-- Section des informations personnelles -->
            <section>
                <h2>Informations personnelles</h2>
                <p>
                    <strong>Prénom : </strong>
                    <xsl:value-of select="personal_info/first_name" />
                </p>
                <p>
                    <strong>Nom : </strong>
                    <xsl:value-of select="personal_info/last_name" />
                </p>
                <p>
                    <strong>Adresse : </strong>
                    <xsl:value-of select="personal_info/address" />
                </p>
                <p>
                    <strong>Téléphone : </strong>
                    <xsl:value-of select="personal_info/phone" />
                </p>
                <p>
                    <strong>Email : </strong>
                    <xsl:value-of select="personal_info/email" />
                </p>
                <p>
                    <strong>Site Web : </strong>
                    <a href="{personal_info/website}">
                        <xsl:value-of select="personal_info/website" />
                    </a>
                </p>
                <p>
                    <strong>Liens : </strong>
                    <a href="{personal_info/link}">
                        <xsl:value-of select="personal_info/link" />
                    </a>
                </p>
            </section>

            <!-- Section de l'expérience -->
            <section>
                <h2>Expériences professionnelles</h2>
                <xsl:apply-templates select="experience/job" />
            </section>

            <!-- Section de l'éducation -->
            <section>
                <h2>Formations</h2>
                <xsl:apply-templates select="education/degree" />
            </section>

            <!-- Section des compétences -->
            <section>
                <h2>Compétences</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill" />
                </ul>
            </section>

            <!-- Section des langues -->
            <section>
                <h2>Langues</h2>
                <ul>
                    <xsl:apply-templates select="languages/language" />
                </ul>
            </section>
        </main>
        <footer>
            <xsl:apply-templates select="copyright" />
        </footer>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type job -->
    <xsl:template match="job">
        <ul>
            <li>
                <h3>
                    <strong>
                        <xsl:value-of select="date" />
                    </strong>
                </h3>
                <ul>
                    <li>
                        <p>
                            <strong>Rôle : </strong>
                            <xsl:value-of select="title" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Entreprise : </strong>
                            <xsl:value-of select="company" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Lieu : </strong>
                            <xsl:value-of select="location" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Description de la mission : </strong>
                            <xsl:value-of select="responsibility" />
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type degree -->
    <xsl:template match="degree">
        <ul>
            <li>
                <h3>
                    <strong>
                        <xsl:value-of select="date" />
                    </strong>
                </h3>
                <ul>
                    <li>
                        <p>
                            <strong>
                                <xsl:value-of select="title" />
                            </strong>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Institution : </strong>
                            <xsl:value-of select="institution" />
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type skill -->
    <xsl:template match="skill">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type language -->
    <xsl:template match="language">
        <li>
            <strong><xsl:value-of select="name" />: </strong>
            <xsl:value-of select="proficiency" />
        </li>
    </xsl:template>
</xsl:stylesheet>