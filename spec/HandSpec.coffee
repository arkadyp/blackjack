describe 'hand', ->
  #cards
  ace1 = null
  ace2 = null
  seven = null
  ten = null

  beforeEach ->
    ace1 = new Card({rank: 1, suit: 0})
    ace2 = new Card({rank: 1, suit: 1})
    seven = new Card({rank: 7, suit: 1})
    ten = new Card({rank: 10, suit: 1})


  describe 'ace value', ->
      it "ace default value should be 1", ->
        expect(ace1.get('rank')).toBe 1
        expect(seven.get('rank')).toBe 7

  describe 'hand value without ace', ->
      it "hand value should be sum of two cards", ->
        hand1 = new Hand([seven, ten])
        expect(hand1.getScore()).toBe 17

  describe 'hand value with ace, less than 21', ->
      it "hand value should be sum of two cards", ->
        hand1 = new Hand([ace1, ten])
        expect(hand1.getScore()).toBe 21

        hand2 = new Hand([ace1, seven])
        expect(hand2.getScore()).toBe 18

