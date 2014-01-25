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
    @$el.html('<h2>Player (<span class="score"></span>)</h2>')
    @$el.append('<div class="playerCards"></div>')
    @$el.append('<div class="playerButtons"><button class="hit-button">Hit</button> <button class="stand-button">Stand</button><div>')

    @$el.append('<div class="playerStats"><div>')
    @$el.find('.playerStats').html("<div class='cashAmount'>Cash: #{@collection.cashAmount}</div>")
    @$el.find('.playerStats').append("<div class='betAmount'>Current Bet: #{@collection.betAmount}</div>")
    @$el.find('.playerStats').append('<div class="results"> Game Result: <span class="game-result">Pending</span></div>')

    @$el.append('<form class="bet">Enter Bet: <input type="number" name="betAmout"></form>')
    
    @render();

  render: ->
    @updateCashAndBet()
    @$el.find('.playerCards').children().detach()
    @$el.find('.playerCards').append @collection.map (card) ->
      new CardView(model: card).$el
    @$el.find('.score').text @collection.getScore()

  updateCashAndBet: ->
    @$el.find('.cashAmount').text("Cash: #{@collection.cashAmount}")
    @$el.find('.betAmount').text("Current Bet: #{@collection.betAmount}")

  events:
    "click .hit-button": -> @collection.hit()
    
    "click .stand-button": -> 
      @collection.trigger('stand')
      @$el.find('.playerButtons').hide();

    "submit .bet": (event) ->
      event.preventDefault()
      betAttempt = @$el.find('input').val() 
      @$el.find('input').val('')
      if 0 < betAttempt <= @collection.cashAmount
        @collection.betAmout = betAttempt
        @collection.cashAmount -= betAttempt
        @this.render()
      else
        alert 'Enter valid bet amount'


