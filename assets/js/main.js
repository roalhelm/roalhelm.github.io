const toggle = document.querySelector('.nav-toggle');
const nav = document.querySelector('#main-nav');
if (toggle && nav) {
  toggle.addEventListener('click', () => {
    const isOpen = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(isOpen));
  });
  nav.querySelectorAll('a').forEach(link => link.addEventListener('click', () => {
    nav.classList.remove('open');
    toggle.setAttribute('aria-expanded', 'false');
  }));
}

// Tools dropdown: close it on a click outside or on Escape.
document.querySelectorAll('.nav-tools').forEach(function (menu) {
  document.addEventListener('click', function (event) {
    if (menu.open && !menu.contains(event.target)) menu.open = false;
  });
  menu.addEventListener('keydown', function (event) {
    if (event.key === 'Escape' && menu.open) {
      menu.open = false;
      menu.querySelector('summary').focus();
    }
  });
});

// Theme: Dark ist Standard, Light wird nur nach expliziter Wahl gespeichert.
const root = document.documentElement;
const header = document.querySelector('.site-header');
if (header) {
  const isEn = root.lang === 'en';
  const themeBtn = document.createElement('button');
  themeBtn.type = 'button';
  themeBtn.className = 'theme-toggle';
  const render = () => {
    const light = root.dataset.theme === 'light';
    themeBtn.textContent = light ? '☀' : '☾';
    const label = light
      ? (isEn ? 'Switch to dark mode' : 'Zum dunklen Design wechseln')
      : (isEn ? 'Switch to light mode' : 'Zum hellen Design wechseln');
    themeBtn.setAttribute('aria-label', label);
    themeBtn.title = label;
    document.querySelectorAll('meta[name="theme-color"]').forEach(m => m.setAttribute('content', light ? '#f4f8fb' : '#0b1120'));
  };
  themeBtn.addEventListener('click', () => {
    const light = root.dataset.theme !== 'light';
    if (light) root.dataset.theme = 'light'; else delete root.dataset.theme;
    try { localStorage.setItem('theme', light ? 'light' : 'dark'); } catch (e) {}
    render();
  });
  render();
  header.appendChild(themeBtn);
}

const year = document.querySelector('#year');
if (year) year.textContent = new Date().getFullYear();
