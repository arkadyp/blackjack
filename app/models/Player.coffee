class window.Player extends window.Hand

  checkBust: ->
    if @score > 21 then @trigger('bust')