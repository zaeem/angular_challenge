describe 'ApplicationController', ->
  scope = null
  _$state = null
  $httpBackend = null
  ngDialog = null
  underscore = null
  appCtrl = null

  groups = [
    {
      pets: ''
      applicants: []
    },
    {
      pets: 'cock horse'
      applicants: ['smoker', 'stefan']
    }
  ]
  emptyGroup = {
    pets: ''
    applicants: []
  }

  filledGroup = {
    pets: 'cock horse'
    applicants: ['smoker', 'stefan']
  }

  beforeEach angular.mock.module('app')
  beforeEach inject(
    (
      $rootScope,
      $controller,
      $state,
      _$httpBackend_
      _ngDialog_
    ) ->
      _$state = $state
      scope = $rootScope.$new()
      $httpBackend = _$httpBackend_
      ngDialog = _ngDialog_
      params = {
        sort_by: 1
        sort_order: 'DESC'
        listingId: 1
      }
      appCtrl = $controller('ApplicationsController',
        {
          $scope: scope
          $state: $state
          $routeParams: params
          ngDialog: ngDialog
        }
      )
  )

  it 'to be defined', ->
    expect(appCtrl).toBeDefined()

  describe 'Constructor', ->
    it 'should assign sorting as empty json', ->
      expect(scope.sorting).toBeDefined()
      expect(scope.sorting).toEqual({})

    it 'should contain scope.hasPets function', ->
      expect(scope.hasPets(emptyGroup)).toBeDefined()

    it 'should return false if no pet in group', ->
      expect(scope.hasPets(emptyGroup)).toBe(false)

    it 'should return true if any pet in group', ->
      expect(scope.hasPets(filledGroup)).toBe(true)

    it 'should contain scope.ngClass function', ->
      expect(scope.ngClass('less')).toBeDefined()

    it 'should contain scope.hasSmokers function', ->
      expect(scope.hasSmokers(emptyGroup)).toBeDefined()

    it 'should return false if no smoker in group', ->
      expect(scope.hasSmokers(emptyGroup)).toBe(false)

    it 'should return false if any smoker in group', ->
      expect(scope.toggleGroup(filledGroup)).toBe(true)

    it 'should contain scope.toggleGroup function', ->
      expect(scope.toggleGroup(emptyGroup)).toBeDefined()

    it 'should return true if expand was false before function call', ->
      filledGroup.expanded = false
      expect(scope.toggleGroup(filledGroup)).toBe(true)

    it 'should return false if expand was true before function call', ->
      filledGroup.expanded = true
      expect(scope.toggleGroup(filledGroup)).toBe(false)

    it 'should not return true if expand was true before function call', ->
      filledGroup.expanded = true
      expect(scope.toggleGroup(filledGroup)).not.toBe(true)

    it 'should contain scope.expandIconClass function', ->
      expect(scope.expandIconClass(emptyGroup)).toBeDefined()

    it 'should return more=true if expand is false', ->
      filledGroup.expanded = false
      expect(scope.expandIconClass(filledGroup)).toEqual({more: true})

    it 'should return less=true if expand is true', ->
      filledGroup.expanded = true
      expect(scope.expandIconClass(filledGroup)).toEqual({less: true})


    it 'should contain scope.rentalAsPercentOfIncomeClass function', ->
      expect(scope.rentalAsPercentOfIncomeClass(emptyGroup)).toBeDefined()

    it 'should return groups data if rental_percent_of_income is 10', ->
      filledGroup.rental_percent_of_income = 10
      expect(scope.rentalAsPercentOfIncomeClass(filledGroup))
      .toEqual({green: true})

    it 'should contain scope.selectApplicants function', ->
      expect(scope.selectApplicants(emptyGroup)).toBeDefined()

    it 'should open ngDailog when we select selectApplicants', ->
      spyOn(ngDialog, 'open').and.returnValue(true)
      expect(scope.selectApplicants(emptyGroup)).toBe(true)


    it 'should return groups data on fetchData calling', ->
      _$state.params.listingId = 1
      url = "/agent/listings/#{_$state.params.listingId}/applications/"
      $httpBackend.whenGET(url).respond (method, url, data, headers, params) ->
        [ 200, groups ]
      scope.fetchData()
      scope.$apply()
