<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:vocab="http://schema.org/"
    xmlns:dc="http://purl.org/dc/terms/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <!-- Template to match the root element cv -->
    <xsl:template match="cv">
        <!-- Header -->
        <div property="header">
            <h1 id="title" property="dc:title">Resume of Costa TRAN</h1>
        </div>
        <div
            property="nav">
            <a href="index.html" property="dc:relation">Homepage</a>
            <a href="cv.html" property="dc:relation">Resume</a>
            <!-- Language selector -->
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
            <!-- Section for personal information -->
            <div property="foaf:Person" about="#me">
                <h2>Personal Information</h2>
                <p>
                    <strong>First name: </strong>
                    <span property="foaf:givenName">
                        <xsl:value-of select="personal_info/first_name" />
                    </span>
                </p>
                <p>
                    <strong>Last name: </strong>
                    <span property="foaf:familyName">
                        <xsl:value-of select="personal_info/last_name" />
                    </span>
                </p>
                <p>
                    <strong>Address: </strong>
                    <span property="foaf:based_near">
                        <xsl:value-of select="personal_info/address" />
                    </span>
                </p>
                <p>
                    <strong>Phone: </strong>
                    <span property="foaf:phone">
                        <xsl:value-of select="personal_info/phone" />
                    </span>
                </p>
                <p>
                    <strong>Email: </strong>
                    <span property="foaf:mbox"><a href="mailto:{personal_info/email}"><xsl:value-of select="personal_info/email" /></a></span>
                </p>
                <p>
                    <strong>Website: </strong>
                    <a href="{personal_info/website}" property="foaf:homepage">
                        <xsl:value-of select="personal_info/website" />
                    </a>
                </p>
                <p>
                    <strong>Links: </strong>
                    <a href="{personal_info/link}" property="foaf:page">
                        <xsl:value-of select="personal_info/link" />
                    </a>
                </p>
            </div>

            <!-- Experience section -->
            <div>
                <h2>Professional Experiences</h2>
                <xsl:apply-templates select="experience/job" />
            </div>

            <!-- Education section -->
            <div>
                <h2>Education</h2>
                <xsl:apply-templates select="education/degree" />
            </div>

            <!-- Skills section -->
            <div>
                <h2>Skills</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill" />
                </ul>
            </div>

            <!-- Languages section -->
            <div>
                <h2>Languages</h2>
                <ul>
                    <xsl:apply-templates select="languages/language" />
                </ul>
            </div>
        </div>
        <div
            property="footer">
            <p id="copyright" property="dc:rightsHolder">
                <xsl:value-of select="copyright" />
            </p>
        </div>
    </xsl:template>

    <!-- Template to match each job element -->
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
                            <strong>Role: </strong>
                            <span property="schema:jobTitle">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Company: </strong>
                            <span property="schema:worksFor">
                                <xsl:value-of select="company" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Location: </strong>
                            <span property="schema:location">
                                <xsl:value-of select="location" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Responsibility: </strong>
                            <span property="schema:description">
                                <xsl:value-of select="responsibility" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template to match each degree element -->
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
                            <strong>Diploma: </strong>
                            <span property="schema:educationalCredentialAwarded">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>Institution: </strong>
                            <span property="schema:alumniOf">
                                <xsl:value-of select="institution" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- Template to match each skill element -->
    <xsl:template match="skill">
        <li property="schema:hasSkill">
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <!-- Template to match each language element -->
    <xsl:template match="language">
        <li>
            <strong><xsl:value-of select="name" />: </strong>
            <span property="schema:knowsLanguage">
                <xsl:value-of select="proficiency" />
            </span>
        </li>
    </xsl:template>
</xsl:stylesheet>