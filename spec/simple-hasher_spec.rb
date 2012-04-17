require './spec/spec_helper.rb'
require './lib/simple-hasher.rb'

describe Simple::Hasher do
  describe "encode" do
    it 'should encode a single digit integer' do
      num = 1
      Simple::Hasher.encode(num).should== Simple::Hasher::ALLOWED_CHARS[num]
    end

    it 'should encode an integer into a multi-character string' do
      Simple::Hasher.encode(5779).should== "LQv"
    end
  end

  describe 'decode' do
    it 'should decode a string to a single digit integer' do
      num = 1
      Simple::Hasher.decode('L').should== num
    end

    it 'should encode an integer into a multi-character string' do
      Simple::Hasher.decode("LQv").should== 5779
    end
  end
end
