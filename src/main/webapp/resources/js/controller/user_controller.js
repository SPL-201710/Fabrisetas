'use strict';

App.controller('UserController', ['$scope', 'User', function($scope, User) {
          var self = this;
          self.user= new User();
          
          self.users=[];
              
          self.fetchAllUsers = function(){
        	  self.users = User.query();
          };
           
          self.createUser = function(){
        	  self.user.$save(function(){
        		  self.fetchAllUsers();
        	  });
          };

          self.updateUser = function(){
        	  self.user.$update(function(){
    			  self.fetchAllUsers();
    		  });
          };

         self.deleteUser = function(identity){
        	 var user = User.get({id:identity}, function() {
        		  user.$delete(function(){
        			  console.log('Borrando Usuario con Id: ', identity);
        			  self.fetchAllUsers();
        		  });
        	 });
          };

          self.fetchAllUsers();

          self.submit = function() {
              if(self.user.id==null){
                  console.log('Guardando nuevo Usuario:', self.user);    
                  self.createUser();
              }else{
    			  console.log('Actualizando usuario con Id: ', self.user.id);
                  self.updateUser();
                  console.log('Usuario actualizado con Id ', self.user.id);
              }
              self.reset();
          };
              
          self.edit = function(id){
              console.log('Id para actualizar: ', id);
              for(var i = 0; i < self.users.length; i++){
                  if(self.users[i].id === id) {
                     self.user = angular.copy(self.users[i]);
                     break;
                  }
              }
          };
              
          self.remove = function(id){
              console.log('Id para borrar: ', id);
              if(self.user.id === id) {
                 self.reset();
              }
              self.deleteUser(id);
          };

          
          self.reset = function(){
              self.user= new User();
              $scope.myForm.$setPristine(); 
          };

      }]);
