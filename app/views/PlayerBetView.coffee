class window.PlayerBetView extends Backbone.View

  className: 'playeHand'

  initialize: ->
    @collection.on 'resultChanged', =>
      result = @collection.getResult()
      @$el.find('.game-result').text("You #{result}!!")
      @$el.find('.newGame').show('slide')
      @render()


    #set up html
    @$el.html('<h2>Player</h2>')

    @$el.append('<div class="playerStats"><div>')
    @$el.find('.playerStats').html("<div class='cashAmount'>Cash: #{@collection.cashAmount}</div>")
    @$el.find('.playerStats').append("<div class='betAmount'>Current Bet: #{@collection.betAmount}</div>")
    @$el.find('.playerStats').append('<div class="results"> Game Result: <span class="game-result">Pending</span></div>')
    @$el.find('.playerStats').append('<button class="newGame">Play Again?</button>')

    @$el.append('<form class="bet">Enter Bet: <input type="number" name="betAmout"></form>')
    
    @render();

  render: ->
    @updateCashAndBet()

  updateCashAndBet: ->
    @$el.find('.cashAmount').text("Cash: $#{@collection.cashAmount}")
    @$el.find('.betAmount').text("Current Bet: $#{@collection.betAmount}")

  events:
    "submit .bet": (event) ->
      event.preventDefault()
      betAttempt = @$el.find('input').val() 
      @$el.find('input').val('')
      if 0 < betAttempt <= @collection.cashAmount
        @collection.betAmount = betAttempt
        @collection.cashAmount -= betAttempt
        @render()
        @collection.trigger('placeBet') #alert App that bet is placed so that cards can be dealt
        @$el.find('.bet').hide('slide')
      else
        alert 'Enter valid bet amount'


