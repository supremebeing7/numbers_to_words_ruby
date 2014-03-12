require('rspec')
require('numbers_to_words')

describe('numbers_to_words') do
  it('converts numeral single digits to words') do
    numbers_to_words(1).should(eq("one"))
  end
  it('converts numbers under 100 to words') do
    numbers_to_words(25).should eq "twenty five"
  end
  it('converts decades') do
    numbers_to_words(20).should eq "twenty"
  end
  it('converts three digit numbers') do
    numbers_to_words(301).should eq "three hundred one"
  end
  it('converts four digit numbers') do
    numbers_to_words(2435).should eq "two thousand four hundred thiry five"
  end
end
