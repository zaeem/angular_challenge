describe 'AddUserController', ->
  scope = null
  _$state = null
  addUserCtrl = null
  UserFactory = null
  $httpBackend = null
  OfficesService = null

  beforeEach angular.mock.module('app')
  beforeEach inject(
    (
      $rootScope,
      $controller,
      $state,
      _OfficesService_,
      _$httpBackend_
      _UserFactory_
    ) ->
      _$state = $state
      scope = $rootScope.$new()
      UserFactory = _UserFactory_
      OfficesService = _OfficesService_
      $httpBackend = _$httpBackend_
      addUserCtrl = $controller('AddUserController',
        {
          $scope: scope
          $state: $state
        }
      )
  )

  it 'to be defined', ->
    expect(addUserCtrl).toBeDefined()

  describe 'Constructor', ->
    it 'assigns a user', ->
      expect(addUserCtrl.user instanceof UserFactory).toBeTruthy()

    it 'assigns a office', ->
      expect(addUserCtrl.offices).toBeTruthy()

    it 'has user_types array', ->
      expect(addUserCtrl.user_types).toBeTruthy()
      expect(addUserCtrl.user_types).toContain(
        {
          id: 'agent'
          value: 'Agent'
        }
      )
      expect(addUserCtrl.user_types).toContain(
        {
          id: 'manager'
          value: 'Manager'
        }
      )
      expect(addUserCtrl.user_types).not.toContain 'officer'

  it 'should go to app.main.users.list', ->
    $httpBackend.expectPOST('/agent')
      .respond (true)
      
    spyOn(_$state, 'go').and.callThrough()
    addUserCtrl.save().then (result) ->
      expect(_$state.go).toHaveBeenCalled()
      expect(_$state.go).toHaveBeenCalledWith('app.main.users.list')
