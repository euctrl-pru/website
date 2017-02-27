/*jslint browser: true */
/* manage active navbar:
 *  match root of active page with one of the navbar menu items
 *  i.e. '/posts/ace.html' with '/posts/static/web/jekyll/2015/01/02/welcome-to-pru.html'
 *  NOTE: always put a category 'posts' as first category for a post!!!
 */
(function () {
    'use strict';
    $(
        function () {
            var activePage = window.location.pathname;
            activePage = '/' + activePage.split('/')[1] + '/';
            $('.nav li a').each(function () {
                var currentPage = $(this)[0].pathname;
                console.log("active = " + activePage)
                console.log("current = " + currentPage)
                if (activePage === currentPage) {
                    $(this).parent().addClass('active');
                }
            });
        }
    );
}());
