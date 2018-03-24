/* eslint func-names: ["error", "never"] */
/* global window */

(function ($, window) {
  return $(() => {
    const getUrlVars = function () {
      const vars = {};
      const url = decodeURIComponent(window.location.href.replace(/\+/g, '%20'));

      url.replace(/[?&]+([^=&]+)=([^&]*)/gi, (m, key, value) => {
        vars[key] = value;
      });

      return vars;
    };

    const text = getUrlVars()['email-submit'];

    $('#mce-EMAIL').val(text);
  });
}(window.$ || window.jQuery || window.Zepto, window));
