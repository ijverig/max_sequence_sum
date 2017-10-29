require "max_sequence_sum"

describe Array do
    describe "#max_sum_slice_positions" do
        it 'is a method of Array' do
            expect(Array.new.respond_to?(:max_sum_slice_positions)).to eql true
        end

        context "given a non-numeric array" do
            array = ["a", "b", "c"]
            it "raises a TypeError exception" do
                expect{(array.max_sum_slice_positions)}.to raise_exception TypeError
            end
        end

        context "given an empty array" do
            array = []
            it "returns [nil,nil]" do
                expect(array.max_sum_slice_positions).to eql [nil,nil]
            end
        end

        context "given an array of 1 element" do
            array = [9]
            it "returns [0,1]" do
                expect(array.max_sum_slice_positions).to eql [0,1]
            end
        end

        context "given an array with only positive numbers" do
            array = [1,2,3,4,5]
            it "returns [0,5]" do
                expect(array.max_sum_slice_positions).to eql [0,5]
            end
        end

        context "given an array with leading an trailing negative numbers" do
            array = [-1,-2,3,4,5,-6,-7]
            it "returns [2,5]" do
                expect(array.max_sum_slice_positions).to eql [2,5]
            end
        end

        context "given an array with positive and negative numbers intermixed" do
            array = [1,-3,-4,5,6,-7]
            it "returns [3,5]" do
                expect(array.max_sum_slice_positions).to eql [3,5]
            end
        end

        context "given the array [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5] with max subarray [7,2,8,-1,2]" do
            array = [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]
            it "returns [6,11]" do
                expect(array.max_sum_slice_positions).to eql [6,11]
            end
        end

        context "given an array with only negative numbers" do
            array = [-4,-3,-2,-5,-6,-7]
            it "returns [2,3]" do
                expect(array.max_sum_slice_positions).to eql [2,3]
            end
        end
    end
end
