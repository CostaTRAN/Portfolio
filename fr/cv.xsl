<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template pour correspondre à l'élément racine cv -->
    <xsl:template match="cv">
        <!-- En-tête -->
        <header>
            <h1 id="title">CV de Costa TRAN</h1>
            <nav>
                <a href="index.html">Retour à l'accueil</a>
            </nav>
            <!-- Sélecteur de langue -->
            <div>
                <a href="?lang=fr"><img src="./img/fr-flag.png" alt="Français"/></a>
                <a href="?lang=en"><img src="./img/en-flag.png" alt="English"/></a>
                <a href="?lang=ja"><img src="./img/ja-flag.png" alt="日本語"/></a>
            </div>
        </header>
        <main>
            <!-- Section des informations personnelles -->
            <section>
                <h2>Informations personnelles</h2>
                <p><strong>Nom: </strong><xsl:value-of select="personal_info/name"/></p>
                <p><strong>Adresse: </strong><xsl:value-of select="personal_info/address"/></p>
                <p><strong>Téléphone: </strong><xsl:value-of select="personal_info/phone"/></p>
                <p><strong>Email: </strong><xsl:value-of select="personal_info/email"/></p>
                <p><strong>Site Web: </strong><a href="{personal_info/website}"><xsl:value-of select="personal_info/website"/></a></p>
            </section>
            
            <!-- Section du profil -->
            <section>
                <h2>Profil</h2>
                <p><xsl:value-of select="profile/summary"/></p>
            </section>
            
            <!-- Section de l'expérience -->
            <section>
                <h2>Expérience professionnelle</h2>
                <p><xsl:apply-templates select="experience/job"/></p>
            </section>
            
            <!-- Section de l'éducation -->
            <section>
                <h2>Formation</h2>
                <xsl:apply-templates select="education/degree"/>
            </section>
            
            <!-- Section des compétences -->
            <section>
                <h2>Compétences</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill"/>
                </ul>
            </section>
            
            <!-- Section des langues -->
            <section>
                <h2>Langues</h2>
                <ul>
                    <xsl:apply-templates select="languages/language"/>
                </ul>
            </section>
        </main>
        <footer>
            <xsl:apply-templates select="copyright"/>
        </footer>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type job -->
    <xsl:template match="job">
        <p><strong><xsl:value-of select="title"/></strong> (<xsl:value-of select="date"/>)</p>
        <p><strong>Rôle : </strong><xsl:value-of select="title"/></p>
        <p><strong>Entreprise : </strong><xsl:value-of select="company"/></p>
        <p><strong>Lieu : </strong><xsl:value-of select="location"/></p>
        <p><strong>Date de début : </strong><xsl:value-of select="date"/></p>
        <p><strong>Description de la mission : </strong><xsl:value-of select="responsibility"/></p>
    </xsl:template>
    
    <!-- Template pour correspondre à chaque élément de type degree -->
    <xsl:template match="degree">
        <p><strong><xsl:value-of select="title"/></strong> (<xsl:value-of select="date"/>)</p>
        <p><strong>Institution : </strong><xsl:value-of select="institution"/></p>
    </xsl:template>
    
    <!-- Template pour correspondre à chaque élément de type skill -->
    <xsl:template match="skill">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
    <!-- Template pour correspondre à chaque élément de type language -->
    <xsl:template match="language">
        <li><strong><xsl:value-of select="name"/>: </strong><xsl:value-of select="proficiency"/></li>
    </xsl:template>
    
</xsl:stylesheet>