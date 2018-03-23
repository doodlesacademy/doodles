/* eslint func-names: ["error", "never"] */
/* global window, _ */

(function ($, window) {
  return $(function () {
    let imgNumber;
    let leftGalImg;
    let onScroll;
    let quoteNumber;
    let rightGalImg;
    let url;
    const $window = $(window);
    const $document = $(window.document);
    const $nav = $('.doodles-nav');
    const navHeight = $nav.height();
    const scrollClass = 'is-scrolled';

    const getUrlVars = function () {
      const vars = {};
      url = decodeURIComponent(window.location.href.replace(/\+/g, '%20'));

      url.replace(/[?&]+([^=&]+)=([^&]*)/gi, (m, key, value) => {
        vars[key] = value;
      });

      return vars;
    };

    const text = getUrlVars()['email-submit'];

    $('#mce-EMAIL').val(text);

    onScroll = function () {
      const top = $document.scrollTop();
      const hasScrolled = top > navHeight;
      $nav.toggleClass(scrollClass, hasScrolled);
      return $nav.removeClass('hidden');
    };

    onScroll = _.debounce(onScroll);
    onScroll();

    $window.scroll(onScroll);
    $('.dropdown').hover(
      () => $(this).find('.dropdown-content').show(),
      () => $('.dropdown-content').hide(),
    );

    const galImages = [1, 2, 3, 4, 5].map(n => `gal${n}.jpg`);
    imgNumber = 0;
    leftGalImg = galImages[imgNumber + 1];
    rightGalImg = galImages[imgNumber];
    $('.img_left').attr('src', `assets/${leftGalImg}`);
    $('.img_right').attr('src', `assets/${rightGalImg}`);

    $('.right-arrow').click(() => {
      if (imgNumber === 4) {
        leftGalImg = 'gal2.jpg';
        rightGalImg = 'gal1.jpg';
        imgNumber = 0;
      } else if (imgNumber === 3) {
        leftGalImg = 'gal1.jpg';
        rightGalImg = 'gal5.jpg';
        imgNumber = 4;
      } else {
        imgNumber += 1;
        leftGalImg = galImages[imgNumber + 1];
        rightGalImg = galImages[imgNumber];
      }
      $('.img_left').attr('src', `assets/${leftGalImg}`);
      $('.img_right').attr('src', `assets/${rightGalImg}`);
    });

    $('.left-arrow').click(() => {
      if (imgNumber === 0) {
        leftGalImg = 'gal1.jpg';
        rightGalImg = 'gal5.jpg';
        imgNumber = 4;
      } else {
        imgNumber -= 1;
        leftGalImg = galImages[imgNumber + 1];
        rightGalImg = galImages[imgNumber];
      }
      $('.img_left').attr('src', `assets/${leftGalImg}`);
      $('.img_right').attr('src', `assets/${rightGalImg}`);
    });

    const quotes = ['Since [our daughter’s] school doesn\'t have an art curriculum, she has not been able to explore and learn about her passion until now. She has become more confident, articulate and definitely much happier since she\'s been enrolled in Doodles.', 'With no art classes at her school, my daughter was floundering–always sketching, but frustrated by her lack of direction... We are grateful for the excellent guidance provided by Doodles Academy, which has filled a void in our daughter’s life.', 'The online art classes provided by Doodles Academy are invaluable to me as a homeschool mom and teacher... I also appreciate the flexibility of the program. We can adjust it to our life, schedule, and health.', 'I absolutely love your website and have begun to use it in my classroom quite frequently ... some of my students love the website so much that they have done some lessons on their own at home.'];
    const quoted = ['Kara Bloom', 'Laura Harris', 'Erin Scott', 'Julie Rains'];
    quoteNumber = 0;
    $('#quotes p').append(quotes[quoteNumber]);
    $('.quoted-parent').append(`<p>${quoted[quoteNumber]}</p>`);
    $(`#dot${quoteNumber} img`).attr('src', 'assets/bluedot.png');

    const nextQuote = function () {
      $('.dot img').attr('src', 'assets/dot.png');
      $('#quotes p').text(quotes[quoteNumber]);
      $('.quoted-parent p').text(quoted[quoteNumber]);
      $(`#dot${quoteNumber} img`).attr('src', 'assets/bluedot.png');

      if (quoteNumber < quotes.length - 1) {
        quoteNumber += 1;
      } else {
        quoteNumber = 0;
      }
      setTimeout(nextQuote, 8000);
    };

    setTimeout(nextQuote, 8000);

    const clickDots = function () {
      $('#quotes p').text(quotes[quoteNumber]);
      $('.quoted-parent p').text(quoted[quoteNumber]);

      const nums = (function () {
        const ref = quotes.length;
        const results = [];

        for (let j = 0; j <= ref; j += 1) {
          results.push(j);
        }

        return results;
      }).apply(this);

      nums.forEach((i) => {
        const dot = i === quoteNumber ? 'bluedot' : 'dot';
        $(`#dot${i} img`).attr('src', `assets/${dot}.png`);
      });
    };

    $('.dot').click(function () {
      quoteNumber = Number(/\d/.exec(this.id)[0]);
      clickDots(quoteNumber);
    });
  });
}(window.$ || window.jQuery || window.Zepto, window));
