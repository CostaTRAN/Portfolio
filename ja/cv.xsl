<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Template to match the root element cv -->
    <xsl:template match="cv">
        <!-- Header -->
        <header>
            <h1 id="title">コスタ・トランの履歴書</h1>
            <nav>
                <a href="index.html">ホームに戻る</a>
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
                <h2>個人情報</h2>
                <p><strong>名前: </strong><xsl:value-of select="personal_info/name"/></p>
                <p><strong>住所: </strong><xsl:value-of select="personal_info/address"/></p>
                <p><strong>電話: </strong><xsl:value-of select="personal_info/phone"/></p>
                <p><strong>メール: </strong><xsl:value-of select="personal_info/email"/></p>
                <p><strong>ウェブサイト: </strong><a href="{personal_info/website}"><xsl:value-of select="personal_info/website"/></a></p>
            </section>
            
            <!-- Profile Section -->
            <section>
                <h2>プロフィール</h2>
                <p><xsl:value-of select="profile/summary"/></p>
            </section>
            
            <!-- Experience Section -->
            <section>
                <h2>職務経験</h2>
                <p><xsl:apply-templates select="experience/job"/></p>
            </section>
            
            <!-- Education Section -->
            <section>
                <h2>教育</h2>
                <xsl:apply-templates select="education/degree"/>
            </section>
            
            <!-- Skills Section -->
            <section>
                <h2>スキル</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill"/>
                </ul>
            </section>
            
            <!-- Languages Section -->
            <section>
                <h2>言語</h2>
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
        <p><strong><xsl:value-of select="title"/></strong> (<xsl:value-of select="date"/>)</p>
        <p><strong>役割: </strong><xsl:value-of select="title"/></p>
        <p><strong>会社: </strong><xsl:value-of select="company"/></p>
        <p><strong>場所: </strong><xsl:value-of select="location"/></p>
        <p><strong>開始日: </strong><xsl:value-of select="date"/></p>
        <p><strong>職務内容: </strong><xsl:value-of select="responsibility"/></p>
    </xsl:template>
    
    <!-- Template to match each degree element -->
    <xsl:template match="degree">
        <p><strong><xsl:value-of select="title"/></strong> (<xsl:value-of select="date"/>)</p>
        <p><strong>機関: </strong><xsl:value-of select="institution"/></p>
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
