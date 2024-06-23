<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:vocab="http://schema.org/"
    xmlns:dc="http://purl.org/dc/terms/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <!-- cv 要素を一致させるテンプレート -->
    <xsl:template match="cv">
        <!-- ヘッダー -->
        <div property="header">
            <h1 id="title" property="dc:title">コスタ・トランの履歴書</h1>
        </div>
        <div property="nav">
            <a href="index.html" property="dc:relation">ホーム</a>
            <a href="cv.html" property="dc:relation">履歴書</a>
            <!-- 言語セレクター -->
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
            <!-- 個人情報のセクション -->
            <div property="foaf:Person" about="#me">
                <h2>個人情報</h2>
                <p>
                    <strong>名: </strong>
                    <span property="foaf:givenName">
                        <xsl:value-of select="personal_info/first_name" />
                    </span>
                </p>
                <p>
                    <strong>名字: </strong>
                    <span property="foaf:familyName">
                        <xsl:value-of select="personal_info/last_name" />
                    </span>
                </p>
                <p>
                    <strong>住所: </strong>
                    <span property="foaf:based_near">
                        <xsl:value-of select="personal_info/address" />
                    </span>
                </p>
                <p>
                    <strong>電話: </strong>
                    <span property="foaf:phone">
                        <xsl:value-of select="personal_info/phone" />
                    </span>
                </p>
                <p>
                    <strong>メール: </strong>
                    <span property="foaf:mbox">
                        <a href="mailto:{personal_info/email}">
                            <xsl:value-of select="personal_info/email" />
                        </a>
                    </span>
                </p>
                <p>
                    <strong>ウェブサイト: </strong>
                    <a href="{personal_info/website}" property="foaf:homepage">
                        <xsl:value-of select="personal_info/website" />
                    </a>
                </p>
                <p>
                    <strong>リンク: </strong>
                    <a href="{personal_info/link}" property="foaf:page">
                        <xsl:value-of select="personal_info/link" />
                    </a>
                </p>
            </div>

            <!-- 職務経験のセクション -->
            <div>
                <h2>職務経験</h2>
                <xsl:apply-templates select="experience/job" />
            </div>

            <!-- 学歴のセクション -->
            <div>
                <h2>学歴</h2>
                <xsl:apply-templates select="education/degree" />
            </div>

            <!-- スキルのセクション -->
            <div>
                <h2>スキル</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill" />
                </ul>
            </div>

            <!-- 言語のセクション -->
            <div>
                <h2>言語</h2>
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

    <!-- job 要素に一致させるテンプレート -->
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
                            <strong>役割: </strong>
                            <span property="schema:jobTitle">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>会社: </strong>
                            <span property="schema:worksFor">
                                <xsl:value-of select="company" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>所在地: </strong>
                            <span property="schema:location">
                                <xsl:value-of select="location" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>責任: </strong>
                            <span property="schema:description">
                                <xsl:value-of select="responsibility" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- degree 要素に一致させるテンプレート -->
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
                            <strong>学位: </strong>
                            <span property="schema:educationalCredentialAwarded">
                                <xsl:value-of select="title" />
                            </span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>機関: </strong>
                            <span property="schema:alumniOf">
                                <xsl:value-of select="institution" />
                            </span>
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- skill 要素に一致させるテンプレート -->
    <xsl:template match="skill">
        <li property="schema:hasSkill">
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <!-- language 要素に一致させるテンプレート -->
    <xsl:template match="language">
        <li>
            <strong><xsl:value-of select="name" />: </strong>
            <span property="schema:knowsLanguage">
                <xsl:value-of select="proficiency" />
            </span>
        </li>
    </xsl:template>
</xsl:stylesheet>