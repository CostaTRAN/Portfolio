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
            <!-- Language Selector -->
            <div>
                <a href="?lang=fr"><img src="./img/fr-flag.png" alt="Français"/></a>
                <a href="?lang=en"><img src="./img/en-flag.png" alt="English"/></a>
                <a href="?lang=ja"><img src="./img/ja-flag.png" alt="日本語"/></a>
            </div>
        </header>
        <main>
            <!-- Section for Personal Information -->
            <section>
                <h2>Personal Information</h2>
                <p><strong>Name: </strong><xsl:value-of select="personal_info/name"/></p>
                <p><strong>Address: </strong><xsl:value-of select="personal_info/address"/></p>
                <p><strong>Phone: </strong><xsl:value-of select="personal_info/phone"/></p>
                <p><strong>Email: </strong><xsl:value-of select="personal_info/email"/></p>
                <p><strong>Website: </strong><a href="{personal_info/website}"><xsl:value-of select="personal_info/website"/></a></p>
            </section>
            
            <!-- Profile Section -->
            <section>
                <h2>Profile</h2>
                <p><xsl:value-of select="profile/summary"/></p>
            </section>
            
            <!-- Experience Section -->
            <section>
                <h2>Professional Experience</h2>
                <p><xsl:apply-templates select="experience/job"/></p>
            </section>
            
            <!-- Education Section -->
            <section>
                <h2>Education</h2>
                <xsl:apply-templates select="education/degree"/>
            </section>
            
            <!-- Skills Section -->
            <section>
                <h2>Skills</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill"/>
                </ul>
            </section>
            
            <!-- Languages Section -->
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
        <p><strong>Role: </strong><xsl:value-of select="title"/></p>
        <p><strong>Company: </strong><xsl:value-of select="company"/></p>
        <p><strong>Location: </strong><xsl:value-of select="location"/></p>
        <p><strong>Start Date: </strong><xsl:value-of select="date"/></p>
        <p><strong>Job Description: </strong><xsl:value-of select="responsibility"/></p>
    </xsl:template>
    
    <!-- Template to match each degree element -->
    <xsl:template match="degree">
        <p><strong><xsl:value-of select="title"/></strong> (<xsl:value-of select="date"/>)</p>
        <p><strong>Institution: </strong><xsl:value-of select="institution"/></p>
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
