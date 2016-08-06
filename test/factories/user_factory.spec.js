describe('UserFactory', function () {

  var UserFactory, $httpBackend;

  var userFields = {
    first_name: 'test',
    last_name: 'test',
    user_type: [
      {
          id: 'agent',
          value: 'Agent'
      }
    ],
    office_id: 'sample',
    email: 'test@email.com',
    phone: '1021314312312',
    email_notifications: true,
    sms_notifications: true
  }

  var savedUserFields = {
    id: 1,
    first_name: 'test',
    last_name: 'test',
    user_type: [
      {
          id: 'agent',
          value: 'Agent'
      }
    ],
    office_id: 'sample',
    email: 'test@email.com',
    phone: '1021314312312',
    email_notifications: true,
    sms_notifications: true
  };

  beforeEach(angular.mock.module('app'));
  
  beforeEach(inject(function (_UserFactory_, _$httpBackend_) {
    UserFactory = _UserFactory_;
    $httpBackend = _$httpBackend_;
  }));

  it('should have user factory be defined', function () {
    expect(UserFactory).toBeDefined();
  });


  describe('Constructor', function () {

    it('assigns a user', function () {
      user = new UserFactory(userFields);
      expect(user).toBeDefined();
      expect(user.first_name).toBe('test');
    });

  });

  describe('#save', function () {

    it('creates the user on the server if user is new', function () {
      $httpBackend
      .expectPOST('/agent', userFields)
      .respond(function(method, url, data, headers, params) {
        return [201, savedUserFields];
      });
      var succeeded;
      
      new UserFactory(userFields).save()
      .then(function () {
        succeeded = true;
      });
      $httpBackend.flush();
      expect(succeeded).toBe(true);
    });

    it('updates the user on the server if user is already exist', function () {
      $httpBackend
      .expectPUT('/agent/' + savedUserFields.id, userFields)
      .respond(function(method, url, data, headers, params) {
        return [200, savedUserFields];
      });
      var succeeded;
      
      new UserFactory(savedUserFields).save()
      .then(function () {
        succeeded = true;
      });

      $httpBackend.flush();
      expect(succeeded).toBe(true);
    });

  });

});
