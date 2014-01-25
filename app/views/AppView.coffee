class window.AppView extends Backbone.View

  template: _.template '
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  initialize: -> 
    @render()

    @model.on 'dealCards', =>
      @dealCards()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new PlayerBetView(collection: @model.get 'playerHand').el

  dealCards: ->
    @$el.find('.player-hand-container').append new PlayerView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new DealerView(collection: @model.get 'dealerHand').el
