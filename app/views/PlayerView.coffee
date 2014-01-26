class window.PlayerView extends window.HandView

  className: 'playerHand'

  initialize: ->
    @collection.on 'scoreUpdated change', =>
      @collection.checkBust()
      @render()

    @collection.on 'change:result', =>
      console.log 'result changed'

    @collection.on 'bust', =>
      @$el.find('.playerButtons').hide();

    @collection.on 'resultChanged', =>
      result = @collection.getResult()
      @$el.find('.game-result').text("You #{result}!!")


    #set up html
    @$el.html('<h3>Score: <span class="score"></span></h3>')
    @$el.append('<div class="playerCards"></div>')
    @$el.append('<div class="playerButtons"><button class="hit-button">Hit</button> <button class="stand-button">Stand</button><div>')

    @render();

  render: ->
    @$el.find('.playerCards').children().detach()
    @$el.find('.playerCards').append @collection.map (card) ->
      new CardView(model: card).$el
    @$el.find('.score').text @collection.getScore()

  events:
    "click .hit-button": -> @collection.hit()
    
    "click .stand-button": -> 
      @collection.trigger('stand')
      @$el.find('.playerButtons').hide()


