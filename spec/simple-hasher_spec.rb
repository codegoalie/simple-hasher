require './spec/spec_helper.rb'
require './lib/simplehasher.rb'

describe SimpleHasher do
  describe "encode" do
    it 'should encode a single digit integer' do
      num = 1
      SimpleHasher.encode(num).should== SimpleHasher::ALLOWED_CHARS[num]
    end

    it 'should encode an integer into a multi-character string' do
      SimpleHasher.encode(5779).should== "LQv"
    end
  end

  describe 'decode' do
    it 'should decode a string to a single digit integer' do
      num = 1
      SimpleHasher.decode('L').should== num
    end

    it 'should encode an integer into a multi-character string' do
      SimpleHasher.decode("LQv").should== 5779
    end
  end
end
