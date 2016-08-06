describe('AddUserController', function () {


  // var userFields = {
  //   first_name: 'test',
  //   last_name: 'test',
  //   user_type: [
  //     {
  //         id: 'agent',
  //         value: 'Agent'
  //     }
  //   ],
  //   office_id: 'sample',
  //   email: 'test@email.com',
  //   phone: '1021314312312',
  //   email_notifications: true,
  //   sms_notifications: true
  // }

  // var savedUserFields = {
  //   id: 1,
  //   first_name: 'test',
  //   last_name: 'test',
  //   user_type: [
  //     {
  //         id: 'agent',
  //         value: 'Agent'
  //     }
  //   ],
  //   office_id: 'sample',
  //   email: 'test@email.com',
  //   phone: '1021314312312',
  //   email_notifications: true,
  //   sms_notifications: true
  // };
  var scope, $state, $http, addUserCtrl, UserFactory, OfficesService;

  beforeEach(angular.mock.module('app'));
  
  beforeEach(inject(function($rootScope, $controller, _OfficesService_, _UserFactory_, _$state_, _$http_) {
    $state = _$state_;
    spyOn($state, 'go');
    scope = $rootScope.$new();
    $http = _$http_;
    UserFactory = _UserFactory_;
    OfficesService = _OfficesService_;
    addUserCtrl = $controller('AddUserController', {$scope: scope, $state: $state, $http: $http});
  }));


  it('to be defined', function () {
    expect( addUserCtrl ).toBeDefined();
  });


  describe('Constructor', function () {

    it('assigns a user', function () {
      expect(addUserCtrl.user).to.be.an.instanceOf(UserFactory);
    });

  });


  // describe('Constructor', function () {

  //   it('assigns a user', function () {
  //     user = new UserFactory(userFields)
  //     expect(user).toBeDefined();
  //     expect(user.first_name).toBe('test');
  //   });



  // });

  // describe('#save', function () {

  //   it('creates the user on the server if user is new', function () {
  //     $httpBackend
  //     .expectPOST('/agent', userFields)
  //     .respond(function(method, url, data, headers, params) {
  //       return [201, savedUser];
  //     });
  //     var succeeded;
      
  //     new UserFactory(userFields).save()
  //     .then(function () {
  //       succeeded = true;
  //     });
  //     $httpBackend.flush();
  //     expect(succeeded).toBe(true);
  //   });

  //   it('updates the user on the server if user is already exist', function () {
  //     $httpBackend
  //     .expectPUT('/agent/' + savedUser.id, userFields)
  //     .respond(function(method, url, data, headers, params) {
  //       return [200, savedUser];
  //     });
  //     var succeeded;
      
  //     new UserFactory(savedUser).save()
  //     .then(function () {
  //       succeeded = true;
  //     });
      
  //     $httpBackend.flush();
  //     expect(succeeded).toBe(true);
  //   });

  // });

});
