const toggle = document.querySelector('.nav-toggle');
const nav = document.querySelector('#main-nav');
if (toggle && nav) {
  toggle.addEventListener('click', () => {
    const isOpen = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(isOpen));
  });
}
const year = document.querySelector('#year');
if (year) year.textContent = new Date().getFullYear();

// language switcher
(function () {
  const stored = localStorage.getItem('lang');
  const initial = stored === 'en' ? 'en' : 'de';
  document.documentElement.lang = initial;

  function updateSwitchers(lang) {
    document.querySelectorAll('.lang-switch').forEach(sw => {
      sw.querySelector('[data-lang="de"]').classList.toggle('active', lang === 'de');
      sw.querySelector('[data-lang="en"]').classList.toggle('active', lang === 'en');
    });
  }

  updateSwitchers(initial);

  document.addEventListener('click', function (e) {
    const btn = e.target.closest('[data-lang]');
    if (!btn || !btn.closest('.lang-switch')) return;
    const lang = btn.dataset.lang;
    document.documentElement.lang = lang;
    localStorage.setItem('lang', lang);
    updateSwitchers(lang);
  });
})();
