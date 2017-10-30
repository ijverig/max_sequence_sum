describe Array do
    describe "#max_sum_slice" do
        it 'is a method of Array' do
            expect(Array.new.respond_to?(:max_sum_slice)).to be true
        end

        context "given a non-numeric array: ['a', 'b', 'c']" do
            array = ["a", "b", "c"]
            it "raises a TypeError exception" do
                expect{(array.max_sum_slice)}.to raise_exception TypeError
            end
        end

        context "given an empty array: []" do
            array = []
            it "returns an empty array" do
                expect(array.max_sum_slice).to be_empty
            end
        end

        context "given an array of 1 element: [9]" do
            array = [9]
            it "returns this 1 element array: [9]" do
                expect(array.max_sum_slice).to eql array
            end
        end

        context "given an array with only positive numbers: [1,2,3,4,5]" do
            array = [1,2,3,4,5]
            it "returns this array: [1,2,3,4,5]" do
                expect(array.max_sum_slice).to eql array
            end
        end

        context "given an array with leading an trailing negative numbers: [-1,-2,3,4,5,-6,-7]" do
            array = [-1,-2,3,4,5,-6,-7]
            it "returns its middle subarray: [3,4,5]" do
                expect(array.max_sum_slice).to eql [3,4,5]
            end
        end

        context "given an array with positive and negative numbers intermixed: [1,-3,-4,5,6,-7]" do
            array = [1,-3,-4,5,6,-7]
            it "returns its largest sum subarray:  [5,6]" do
                expect(array.max_sum_slice).to eql [5,6]
            end
        end

        context "given an array: [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]" do
            array = [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]
            it "returns its largest sum subarray: [7,2,8,-1,2]" do
                expect(array.max_sum_slice).to eql [7,2,8,-1,2]
            end
        end

        context "given an array with only negative numbers: [-4,-3,-2,-5,-6,-7]" do
            array = [-4,-3,-2,-5,-6,-7]
            it "returns its greatest element: [-2]" do
                expect(array.max_sum_slice).to eql [-2]
            end
        end
    end
end
