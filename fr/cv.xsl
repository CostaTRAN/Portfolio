<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:vocab="http://schema.org/"
    xmlns:dc="http://purl.org/dc/terms/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <!-- Template pour correspondre à l'élément racine cv -->
    <xsl:template match="cv">
        <!-- En-tête -->
        <div property="header">
            <h1 id="title" property="dc:title">CV de Costa TRAN</h1>
        </div>
        <div property="nav">
            <a href="index.html" property="dc:relation">Accueil</a>
            <a href="cv.html" property="dc:relation">CV</a>
            <!-- Sélecteur de langue -->
            <div id="lang-selector">
                <img src="./img/fr-flag.png" alt="Français" class="flag" about="fr"
                    property="foaf:depiction" />
                <img src="./img/en-flag.png" alt="English" class="flag" about="en"
                    property="foaf:depiction" />
                <img src="./img/ja-flag.png" alt="日本語" class="flag" about="ja"
                    property="foaf:depiction" />
            </div>
        </div>
        <div property="main">
            <!-- Section des informations personnelles -->
            <div property="foaf:Person" about="#me">
                <h2>Informations personnelles</h2>
                <p>
                    <strong>Prénom : </strong>
                    <span property="foaf:givenName">
                        <xsl:value-of select="personal_info/first_name" />
                    </span>
                </p>
                <p>
                    <strong>Nom : </strong>
                    <span property="foaf:familyName">
                        <xsl:value-of select="personal_info/last_name" />
                    </span>
                </p>
                <p>
                    <strong>Adresse : </strong>
                    <span property="foaf:based_near">
                        <xsl:value-of select="personal_info/address" />
                    </span>
                </p>
                <p>
                    <strong>Téléphone : </strong>
                    <span property="foaf:phone">
                        <xsl:value-of select="personal_info/phone" />
                    </span>
                </p>
                <p>
                    <strong>Email : </strong>
                    <span property="foaf:mbox">
                        <a href="mailto:{personal_info/email}">
                            <xsl:value-of select="personal_info/email" />
                        </a>
                    </span>
                </p>
                <p>
                    <strong>Site Web : </strong>
                    <a href="{personal_info/website}" property="foaf:homepage">
                        <xsl:value-of select="personal_info/website" />
                    </a>
                </p>
                <p>
                    <strong>Liens : </strong>
                    <a href="{personal_info/link}" property="foaf:page">
                        <xsl:value-of select="personal_info/link" />
                    </a>
                </p>
            </div>

            <!-- Section de l'expérience -->
            <div>
                <h2>Expériences professionnelles</h2>
                <xsl:apply-templates select="experience/job" />
            </div>

            <!-- Section de l'éducation -->
            <div>
                <h2>Formations</h2>
                <xsl:apply-templates select="education/degree" />
            </div>

            <!-- Section des compétences -->
            <div>
                <h2>Compétences</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill" />
                </ul>
            </div>

            <!-- Section des langues -->
            <div>
                <h2>Langues</h2>
                <ul>
                    <xsl:apply-templates select="languages/language" />
                </ul>
            </div>
        </div>
        <div property="footer">
            <p id="copyright" property="dc:rightsHolder">
                <xsl:value-of select="copyright" />
            </p>
            <p about="" resource="https://www.w3.org/TR/rdfa-syntax" rel="dc:conformsTo"
                xmlns:dc="http://purl.org/dc/terms/">
                <a href="https://validator.w3.org/markup/check?uri=referer">
                    <img src="https://www.w3.org/Icons/valid-xhtml-rdfa" alt="Valid XHTML + RDFa"
                        height="31" width="88" />
                </a>
            </p>
            <p>
                <a href="https://jigsaw.w3.org/css-validator/check/referer">
                    <img style="border:0;width:88px;height:31px"
                        src="https://jigsaw.w3.org/css-validator/images/vcss"
                        alt="CSS Valide !" />
                </a>
            </p>
        </div>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type job -->
    <xsl:template match="job">
        <ul>
            <li typeof="schema:JobPosting">
                <h3>
                    <strong>
                        <xsl:value-of select="date" />
                    </strong>
                </h3>
                <ul>
                    <li>
                        <p>
                            <strong>Rôle : </strong>
                            <span property="schema:jobTitle">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Entreprise : </strong>
                            <span property="schema:worksFor">
                                <xsl:value-of select="company" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Lieu : </strong>
                            <span property="schema:location">
                                <xsl:value-of select="location" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Description de la mission : </strong>
                            <span property="schema:description">
                                <xsl:value-of select="responsibility" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type degree -->
    <xsl:template match="degree">
        <ul>
            <li typeof="schema:EducationalOccupationalCredential">
                <h3>
                    <strong>
                        <xsl:value-of select="date" />
                    </strong>
                </h3>
                <ul>
                    <li>
                        <p>
                            <strong>Diplôme : </strong>
                            <span property="schema:educationalCredentialAwarded">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Institution : </strong>
                            <span property="schema:alumniOf">
                                <xsl:value-of select="institution" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type skill -->
    <xsl:template match="skill">
        <li property="schema:hasSkill">
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <!-- Template pour correspondre à chaque élément de type language -->
    <xsl:template match="language">
        <li>
            <strong><xsl:value-of select="name" />: </strong>
            <span property="schema:knowsLanguage">
                <xsl:value-of select="proficiency" />
            </span>
        </li>
    </xsl:template>
</xsl:stylesheet>