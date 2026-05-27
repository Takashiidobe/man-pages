(function () {
  // scripts are at end of body so DOM is already parsed — run immediately
  if (window.hljs) {
    hljs.highlightAll();
  }

  window.addEventListener('DOMContentLoaded', function () {
    if (window.PagefindUI) {
      new window.PagefindUI({
        element: '#search',
        showSubResults: false,
        resetStyles: false,
      });
    }
  });

  // keyboard shortcuts
  document.addEventListener('keydown', function (e) {
    const tag = document.activeElement && document.activeElement.tagName;
    const inInput = tag === 'INPUT' || tag === 'TEXTAREA';

    if (e.key === '/' && !inInput) {
      e.preventDefault();
      const input = document.querySelector('.pagefind-ui__search-input');
      if (input) input.focus();
      return;
    }

    if (e.key === 'Escape') {
      const input = document.querySelector('.pagefind-ui__search-input');
      if (input && document.activeElement === input) {
        input.blur();
        return;
      }
    }

    if (inInput) return;

    // on page lists: j/k move focus through .page-link items
    const links = Array.from(document.querySelectorAll('.page-link'));
    if (links.length > 0) {
      const cur = links.indexOf(document.activeElement);
      if (e.key === 'j' || e.key === 'ArrowDown') {
        e.preventDefault();
        links[cur < links.length - 1 ? cur + 1 : 0].focus();
      } else if (e.key === 'k' || e.key === 'ArrowUp') {
        e.preventDefault();
        links[cur > 0 ? cur - 1 : links.length - 1].focus();
      } else if (e.key === 'Enter' && cur !== -1) {
        links[cur].click();
      }
    }

    // u = go up one level (breadcrumb parent link)
    if (e.key === 'u') {
      const crumb = document.querySelector('.breadcrumb a');
      if (crumb) crumb.click();
    }

    // h = go home
    if (e.key === 'h') {
      window.location.href = '/';
    }
  });
})();
