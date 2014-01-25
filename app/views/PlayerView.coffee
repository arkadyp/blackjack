class window.PlayerView extends window.HandView

  className: 'playerHand'

  initialize: ->
    super();
    @collection.on 'scoreUpdated', => @collection.checkBust()


  #todo: switch to mustache
  template: _.template '<h2>Player (<span class="score"></span>)</h2>'