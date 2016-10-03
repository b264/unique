describe Unique do
  context ".next!" do
    before(:each) { Unique.class_variable_set(:@@instances, Array.new) }

    it "raises an error if a block is not passed" do
      expect{ Unique.next!(:t) }.to raise_error(Unique::NoArgumentsAllowed)
    end

    it "returns a unique value if one is available" do
      expect(Unique.next! { rand(2) }).to_not eq(Unique.next! { rand(2) })
    end

    it "raises an error if no unique object could be found" do
      Unique.next! { rand(1) }
      expect{ Unique.next! { rand(1) } }.to raise_error(Unique::NoUniqueObjects)
    end
  end
end
