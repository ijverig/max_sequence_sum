require "max_sequence_sum"

describe Array do
    describe "#max_slice_sum" do
        context "given a non-numeric array" do
            it "raises a TypeError exception" do
                array = ["a", "b", "c"]
                expect{(array.max_slice_sum)}.to raise_exception TypeError
            end
        end

        context "given an empty array" do
            it "returns 0" do
                array = []
                expect(array.max_slice_sum).to eql 0
            end
        end

        context "given an array of 1 element" do
            it "returns this 1 element" do
                array = [9]
                expect(array.max_slice_sum).to eql 9
            end
        end

        context "given the array [1,2,3,4,5] with only positive numbers" do
            it "returns 15" do
                array = [1,2,3,4,5]
                expect(array.max_slice_sum).to eql 15
            end
        end

        context "given the array [-1,3,4,5,-6] with negative numbers on the sides" do
            it "returns 12" do
                array = [-1,3,4,5,-6]
                expect(array.max_slice_sum).to eql 12
            end
        end

        context "given the array [1,-3,-4,5,6,-7] with positive and negative numbers intermixed" do
            it "returns 11" do
                array = [1,-3,-4,5,6,-7]
                expect(array.max_slice_sum).to eql 11
            end
        end

        context "given the array [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5] with max subarray [7,2,8,-1,2]" do
            it "returns 18" do
                array = [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]
                expect(array.max_slice_sum).to eql 18
            end
        end

        context "given the array [-4,-3,-2,-5,-6,-7] with only negative numbers" do
            it "returns -2" do
                array = [-4,-3,-2,-5,-6,-7]
                expect(array.max_slice_sum).to eql -2
            end
        end
    end
end
