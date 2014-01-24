class window.PlayerView extends window.HandView

  className: 'playerHand'

  #todo: switch to mustache
  template: _.template '<h2>Player (<span class="score"></span>)</h2>'