describe 'hand', ->
  #cards
  ace1 = null
  ace2 = null
  ace3 = null
  ace4 = null
  two = null
  six = null
  seven = null
  ten = null

  beforeEach ->
    ace1 = new Card({rank: 1, suit: 0})
    ace2 = new Card({rank: 1, suit: 1})
    ace3 = new Card({rank: 1, suit: 2})
    ace4 = new Card({rank: 1, suit: 3})
    two = new Card({rank: 2, suit: 1})
    six = new Card({rank: 6, suit: 1})
    seven = new Card({rank: 7, suit: 1})
    ten = new Card({rank: 10, suit: 1})


  # describe 'ace value', ->
  #     it "ace default value should be 1", ->
  #       expect(ace1.get('rank')).toBe 1
  #       expect(seven.get('rank')).toBe 7

  # describe 'hand value without ace', ->
  #     it "hand value should be sum of two cards", ->
  #       hand1 = new Hand([seven, ten])
  #       expect(hand1.getScore()).toBe 17

  # describe 'hand value with ace, less than 21', ->
  #     it "hand value should be sum of two cards", ->
  #       hand1 = new Hand([ace1, ten])
  #       expect(hand1.getScore()).toBe 21

  #       hand2 = new Hand([ace1, seven])
  #       expect(hand2.getScore()).toBe 18

  # describe 'hand value with ace, more than 21', ->
  #     it "hand value should be sum of two cards", ->
  #       hand1 = new Hand([ace1, ace2])
  #       expect(hand1.getScore()).toBe 12

  describe 'hand value with three cards', ->
      it "should be accurate", ->
        hand1 = new Hand([six, seven])
        expect(hand1.getScore()).toBe 13
        hand1.add(ten)
        hand1.updateScore()
        expect(hand1.getScore()).toBe 23

        hand2 = new Hand([ace1, seven])
        expect(hand2.getScore()).toBe 18
        hand2.add(ace2)
        hand2.updateScore()
        expect(hand2.getScore()).toBe 19

        hand3 = new Hand([ten, ace1])
        expect(hand3.getScore()).toBe 21
        hand3.add(ace2)
        hand3.updateScore()
        expect(hand3.getScore()).toBe 12
        hand3.add(six)
        hand3.updateScore()
        expect(hand3.getScore()).toBe 18

        hand4 = new Hand([ace1, ace2])
        expect(hand4.getScore()).toBe 12
        hand4.add(ace3)
        hand4.updateScore()
        expect(hand4.getScore()).toBe 13
        hand4.add(ten)
        hand4.updateScore()
        expect(hand4.getScore()).toBe 13
        hand4.add(seven)
        hand4.updateScore()
        expect(hand4.getScore()).toBe 20


        hand5 = new Hand([ace1, ace2])
        expect(hand5.getScore()).toBe 12
        hand5.add(ace3)
        hand5.updateScore()
        expect(hand5.getScore()).toBe 13
        hand5.add(six)
        hand5.updateScore()
        expect(hand5.getScore()).toBe 19
        hand5.add(ace4)
        hand5.updateScore()
        expect(hand5.getScore()).toBe 20


