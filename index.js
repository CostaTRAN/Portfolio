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

    function fetchContent(lang) {
        fetch(`./${lang}/content.xml`)
            .then(response => response.text())
            .then(str => (new window.DOMParser()).parseFromString(str, "application/xml"))
            .then(data => {
                document.getElementById('title').textContent = data.querySelector('title').textContent;
                document.getElementById('homepage').textContent = data.querySelector('homepage').textContent;
                document.getElementById('cv').textContent = data.querySelector('cv').textContent;
                document.getElementById('about').textContent = data.querySelector('about').textContent;
                document.getElementById('about_content').textContent = data.querySelector('about_content').textContent;
                document.getElementById('video').textContent = data.querySelector('video').textContent;
                document.getElementById('copyright').textContent = data.querySelector('copyright').textContent;
            })
            .catch(error => console.error('Error loading content:', error));
    }

    function changeVideoSubtitlesLanguage(lang) {
        var object = document.getElementById('youtube_video');
        var video = document.getElementById('video_content');
        var youtubeLangCode = lang || 'fr';
        
        object.data = object.data.replace(/cc_lang_pref=[a-zA-Z-]{2}/, 'cc_lang_pref=' + youtubeLangCode);
        video.href = video.href.replace(/cc_lang_pref=[a-zA-Z-]{2}/, 'cc_lang_pref=' + youtubeLangCode);
    }

    document.getElementById('lang-selector').addEventListener('click', function (event) {
        if (event.target.classList.contains('flag')) {
            const selectedLang = event.target.getAttribute('about');
            fetchContent(selectedLang);
            changeVideoSubtitlesLanguage(selectedLang);

            window.history.pushState({}, '', `?lang=${selectedLang}`);
            sessionStorage.setItem('lang', selectedLang);
        }
    });

    const lang = getLanguage();
    sessionStorage.setItem('lang', lang);
    fetchContent(lang);
    changeVideoSubtitlesLanguage(lang);
});