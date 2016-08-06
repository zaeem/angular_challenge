describe 'UserFactory', ->
  UserFactory = null
  $httpBackend = null
  userFields = {
    first_name: 'test'
    last_name: 'test'
    user_type: [ {
      id: 'agent'
      value: 'Agent'
    } ]
    office_id: 'sample'
    email: 'test@email.com'
    phone: '1021314312312'
    email_notifications: true
    sms_notifications: true
  }
  savedUserFields = {
    id: 1
    first_name: 'test'
    last_name: 'test'
    user_type: [ {
      id: 'agent'
      value: 'Agent'
    } ]
    office_id: 'sample'
    email: 'test@email.com'
    phone: '1021314312312'
    email_notifications: true
    sms_notifications: true
  }
  beforeEach angular.mock.module('app')

  beforeEach inject((_UserFactory_, _$httpBackend_) ->
    UserFactory = _UserFactory_
    $httpBackend = _$httpBackend_
  )

  it 'should have user factory be defined', ->
    expect(UserFactory).toBeDefined()

  describe 'Constructor', ->
    it 'assigns a user', ->
      user = new UserFactory(userFields)
      expect(user).toBeDefined()
      expect(user instanceof UserFactory).toBeTruthy()
      expect(user.first_name).toBe 'test'

  describe '#save', ->
    it 'creates the user on the server if user is new', ->
      $httpBackend.expectPOST('/agent', userFields)
        .respond (method, url, data, headers, params) ->
          [ 201, savedUserFields ]
      succeeded = undefined
      new UserFactory(userFields).save().then ->
        succeeded = true
      $httpBackend.flush()
      expect(succeeded).toBe true

    it 'updates the user on the server if user is already exist', ->
      $httpBackend.expectPUT('/agent/' + savedUserFields.id, userFields)
        .respond (method, url, data, headers, params) ->
          [ 200, savedUserFields ]
      succeeded = undefined
      new UserFactory(savedUserFields).save().then ->
        succeeded = true
      $httpBackend.flush()
      expect(succeeded).toBe true
