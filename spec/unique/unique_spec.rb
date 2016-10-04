# coding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Unique do
  context '.reset!' do
    before(:each) { Unique.next! { rand(500) } }

    it "clears @@instances" do
      Unique.reset!

      expect(Unique.class_variable_get(:@@instances)).to eq([])
    end
  end

  context ".next!" do
      before(:each) { Unique.reset! }

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
