document.addEventListener("DOMContentLoaded", function () {
    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    function getLanguage() {
        let lang = getQueryParam('lang');
        if (lang) return lang;

        lang = sessionStorage.getItem('lang');
        if (lang) return lang;

        lang = navigator.language.split('-')[0];
        if (['en', 'fr', 'ja'].includes(lang)) return lang;

        return 'fr';
    }

    const lang = getLanguage();
    sessionStorage.setItem('lang', lang);

    var selectedXmlFile = `./${lang}/cv.xml`;
    var selectedXslFile = `./${lang}/cv.xsl`;

    function transformXMLtoHTML(xmlString, xslString) {
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(xmlString, "text/xml");
        const xslDoc = parser.parseFromString(xslString, "text/xml");

        const xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xslDoc);

        const resultFragment = xsltProcessor.transformToFragment(xmlDoc, document);

        const tempDiv = document.createElement('div');
        tempDiv.appendChild(resultFragment);

        return tempDiv.innerHTML;
    }

    function fetchXMLandXSL(xmlFile, xslFile) {
        fetch(xmlFile)
            .then(response => response.text())
            .then(xmlString => {
                fetch(xslFile)
                    .then(response => response.text())
                    .then(xslString => {
                        const transformedHTML = transformXMLtoHTML(xmlString, xslString);
                        document.body.innerHTML = transformedHTML;

                        document.getElementById('lang-selector').addEventListener('click', function (event) {
                            if (event.target.classList.contains('flag')) {
                                const selectedLang = event.target.getAttribute('about');
                                window.history.pushState({}, '', `?lang=${selectedLang}`);
                                sessionStorage.setItem('lang', selectedLang);
                                selectedXmlFile = `./${selectedLang}/cv.xml`;
                                selectedXslFile = `./${selectedLang}/cv.xsl`;
                                fetchXMLandXSL(selectedXmlFile, selectedXslFile);
                            }
                        });
                    })
                    .catch(error => console.error('Error loading XSL file:', error));
            })
            .catch(error => console.error('Error loading XML file:', error));
    }

    fetchXMLandXSL(selectedXmlFile, selectedXslFile);
});