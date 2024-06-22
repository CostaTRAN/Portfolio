<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template to match the root element cv -->
    <xsl:template match="cv">
        <!-- Header -->
        <header>
            <h1 id="title">CV of Costa TRAN</h1>
            <nav>
                <a href="index.html">Back to home page</a>
            </nav>
            <!-- Language selector -->
            <div>
                <a href="?lang=fr"><img src="./img/fr-flag.png" alt="Français"/></a>
                <a href="?lang=en"><img src="./img/en-flag.png" alt="English"/></a>
                <a href="?lang=ja"><img src="./img/ja-flag.png" alt="日本語"/></a>
            </div>
        </header>
        <main>
            <!-- Section for personal information -->
            <section>
                <h2>Personal Information</h2>
                <p><strong>Name: </strong><xsl:value-of select="personal_info/name"/></p>
                <p><strong>Address: </strong><xsl:value-of select="personal_info/address"/></p>
                <p><strong>Phone: </strong><xsl:value-of select="personal_info/phone"/></p>
                <p><strong>Email: </strong><xsl:value-of select="personal_info/email"/></p>
                <p><strong>Website: </strong><a href="{personal_info/website}"><xsl:value-of select="personal_info/website"/></a></p>
                <p><strong>Links: </strong><a href="{personal_info/link}"><xsl:value-of select="personal_info/link"/></a></p>
            </section>
            
            <!-- Experience section -->
            <section>
                <h2>Professional Experiences</h2>
                <xsl:apply-templates select="experience/job"/>
            </section>
            
            <!-- Education section -->
            <section>
                <h2>Education</h2>
                <xsl:apply-templates select="education/degree"/>
            </section>
            
            <!-- Skills section -->
            <section>
                <h2>Skills</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill"/>
                </ul>
            </section>
            
            <!-- Languages section -->
            <section>
                <h2>Languages</h2>
                <ul>
                    <xsl:apply-templates select="languages/language"/>
                </ul>
            </section>
        </main>
        <footer>
            <xsl:apply-templates select="copyright"/>
        </footer>
    </xsl:template>

    <!-- Template to match each job element -->
    <xsl:template match="job">
        <ul>
            <li>
                <h3><strong><xsl:value-of select="date"/></strong></h3>
                <ul>
                    <li><p><strong>Role: </strong><xsl:value-of select="title"/></p></li>
                    <li><p><strong>Company: </strong><xsl:value-of select="company"/></p></li>
                    <li><p><strong>Location: </strong><xsl:value-of select="location"/></p></li>
                    <li><p><strong>Responsibility: </strong><xsl:value-of select="responsibility"/></p></li>
                </ul>
            </li>
        </ul>
    </xsl:template>
    
    <!-- Template to match each degree element -->
    <xsl:template match="degree">
        <ul>
            <li>
                <h3><strong><xsl:value-of select="date"/></strong></h3>
                <ul>
                    <li><p><strong><xsl:value-of select="title"/></strong></p></li>
                    <li><p><strong>Institution: </strong><xsl:value-of select="institution"/></p></li>
                </ul>
            </li>
        </ul>
    </xsl:template>
    
    <!-- Template to match each skill element -->
    <xsl:template match="skill">
        <li><xsl:value-of select="."/></li>
    </xsl:template>
    
    <!-- Template to match each language element -->
    <xsl:template match="language">
        <li><strong><xsl:value-of select="name"/>: </strong><xsl:value-of select="proficiency"/></li>
    </xsl:template>
</xsl:stylesheet>
