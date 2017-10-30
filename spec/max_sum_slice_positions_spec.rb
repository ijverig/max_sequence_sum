describe Array do
    describe "#max_sum_slice_positions" do
        it 'is a method of Array' do
            expect(Array.new.respond_to?(:max_sum_slice_positions)).to be true
        end

        context "given a non-numeric array: ['a', 'b', 'c']" do
            array = ["a", "b", "c"]
            it "raises a TypeError exception" do
                expect{(array.max_sum_slice_positions)}.to raise_exception TypeError
            end
        end

        context "given an empty array: []" do
            array = []
            it "returns [nil,nil]" do
                expect(array.max_sum_slice_positions).to eql [nil,nil]
            end
        end

        context "given an array of 1 element: [9]" do
            array = [9]
            it "returns its positions: [0,1]" do
                expect(array.max_sum_slice_positions).to eql [0,1]
            end
        end

        context "given an array with only positive numbers: [1,2,3,4,5]" do
            array = [1,2,3,4,5]
            it "returns its positions: [0,5]" do
                expect(array.max_sum_slice_positions).to eql [0,5]
            end
        end

        context "given an array with leading an trailing negative numbers: [-1,-2,3,4,5,-6,-7]" do
            array = [-1,-2,3,4,5,-6,-7]
            it "returns its middle subarray positions: [2,5]" do
                expect(array.max_sum_slice_positions).to eql [2,5]
            end
        end

        context "given an array with positive and negative numbers intermixed: [1,-3,-4,5,6,-7]" do
            array = [1,-3,-4,5,6,-7]
            it "returns its largest sum subarray positions: [3,5]" do
                expect(array.max_sum_slice_positions).to eql [3,5]
            end
        end

        context "given an array: [1,-3,-4,5,2,-9,7,2,8,-1,2,-9,-2,-5]" do
            array = [1,-3,-4,5,2,-9,7,2,8,-1,2,-9,-2,-5]
            it "returns its largest sum subarray positions: [6,11]" do
                expect(array.max_sum_slice_positions).to eql [6,11]
            end
        end

        context "given an array with only negative numbers: [-4,-3,-2,-5,-6,-7]" do
            array = [-4,-3,-2,-5,-6,-7]
            it "returns its greatest element positions: [2,3]" do
                expect(array.max_sum_slice_positions).to eql [2,3]
            end
        end
    end
end
