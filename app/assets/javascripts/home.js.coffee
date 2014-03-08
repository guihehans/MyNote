# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
'use strict'


# Declare app level module which depends on filters, and services
angular.module('myApp', [])
window.LoginController = ($scope,$http) ->
  $scope.notes = [];
  $scope.toekn = '';
  $scope.seeNotes = () ->
    console.log('logining');
    loginRequest = $http.post(
      '/login',
      {'name':$scope.username,'password':$scope.password}
    );
    loginRequest.success (response, status, headers, config) ->
      console.log('success')
      $scope.token = response.token;
      $http
      .get('/notes.json?token='+$scope.token)
      .success (data, status, headers, config) ->
        console.log(data)
        $scope.notes = data