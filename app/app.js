(function() {
  'use strict';

  angular.module('app', [
    'ui.router'
  ])
  .config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/");

    $stateProvider
    // Layouts
    .state( 'app.main.users.list', {
      url: '/'
    });

  });
})();