<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- cv 要素を一致させるテンプレート -->
    <xsl:template match="cv">
        <!-- ヘッダー -->
        <header>
            <h1 id="title">コスタ・トランの履歴書</h1>
        </header>
        <nav>
            <a href="index.html">ホーム</a>
            <a href="cv.html">履歴書</a>
            <!-- 言語セレクター -->
            <div id="lang-selector">
                <img src="./img/fr-flag.png" alt="Français" class="flag" data-lang="fr" />
                <img src="./img/en-flag.png" alt="English" class="flag" data-lang="en" />
                <img src="./img/ja-flag.png" alt="日本語" class="flag" data-lang="ja" />
            </div>
        </nav>
        <main>
            <!-- 個人情報のセクション -->
            <section>
                <h2>個人情報</h2>
                <p>
                    <strong>名: </strong>
                    <xsl:value-of select="personal_info/first_name" />
                </p>
                <p>
                    <strong>名字: </strong>
                    <xsl:value-of select="personal_info/last_name" />
                </p>
                <p>
                    <strong>住所: </strong>
                    <xsl:value-of select="personal_info/address" />
                </p>
                <p>
                    <strong>電話: </strong>
                    <xsl:value-of select="personal_info/phone" />
                </p>
                <p>
                    <strong>メール: </strong>
                    <xsl:value-of select="personal_info/email" />
                </p>
                <p>
                    <strong>ウェブサイト: </strong>
                    <a href="{personal_info/website}">
                        <xsl:value-of select="personal_info/website" />
                    </a>
                </p>
                <p>
                    <strong>リンク: </strong>
                    <a href="{personal_info/link}">
                        <xsl:value-of select="personal_info/link" />
                    </a>
                </p>
            </section>

            <!-- 職務経験のセクション -->
            <section>
                <h2>職務経験</h2>
                <xsl:apply-templates select="experience/job" />
            </section>

            <!-- 学歴のセクション -->
            <section>
                <h2>学歴</h2>
                <xsl:apply-templates select="education/degree" />
            </section>

            <!-- スキルのセクション -->
            <section>
                <h2>スキル</h2>
                <ul>
                    <xsl:apply-templates select="skills/skill" />
                </ul>
            </section>

            <!-- 言語のセクション -->
            <section>
                <h2>言語</h2>
                <ul>
                    <xsl:apply-templates select="languages/language" />
                </ul>
            </section>
        </main>
        <footer>
            <xsl:apply-templates select="copyright" />
        </footer>
    </xsl:template>

    <!-- job 要素に一致させるテンプレート -->
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
                            <strong>役割: </strong>
                            <xsl:value-of select="title" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>会社: </strong>
                            <xsl:value-of select="company" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>所在地: </strong>
                            <xsl:value-of select="location" />
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>責任: </strong>
                            <xsl:value-of select="responsibility" />
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- degree 要素に一致させるテンプレート -->
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
                            <strong>機関: </strong>
                            <xsl:value-of select="institution" />
                        </p>
                    </li>
                </ul>
            </li>
        </ul>
    </xsl:template>

    <!-- skill 要素に一致させるテンプレート -->
    <xsl:template match="skill">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

    <!-- language 要素に一致させるテンプレート -->
    <xsl:template match="language">
        <li>
            <strong><xsl:value-of select="name" />: </strong>
            <xsl:value-of select="proficiency" />
        </li>
    </xsl:template>
</xsl:stylesheet>