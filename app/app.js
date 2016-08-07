(function() {
  'use strict';

  angular.module('app', [
    'ui.router', 'angular-underscore', 'ngDialog'
  ])
  .config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise("/");

    $stateProvider
    // Layouts
    .state( 'app.main.users.list', {
      controller: 'ApplicationController',
      url: '/abc'
    });

  });
})();