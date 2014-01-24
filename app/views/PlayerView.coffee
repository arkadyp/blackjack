class PlayerView extends window.HandView

  className: 'playHand'

  #todo: switch to mustache
  template: _.template '<h2><Player(<span class="playerScore"></span>)</h2>'