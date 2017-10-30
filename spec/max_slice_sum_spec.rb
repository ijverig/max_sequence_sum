describe Array do
    describe "#max_slice_sum" do
        it 'is a method of Array' do
            expect(Array.new.respond_to?(:max_slice_sum)).to be true
        end

        context "given a non-numeric array: ['a', 'b', 'c']" do
            array = ["a", "b", "c"]
            it "raises a TypeError exception" do
                expect{(array.max_slice_sum)}.to raise_exception TypeError
            end
        end

        context "given an empty array: []" do
            array = []
            it "returns 0" do
                expect(array.max_slice_sum).to eql 0
            end
        end

        context "given an array of 1 element: [9]" do
            array = [9]
            it "returns this 1 element: 9" do
                expect(array.max_slice_sum).to eql 9
            end
        end

        context "given an array with only positive numbers: [1,2,3,4,5]" do
            array = [1,2,3,4,5]
            it "returns its sum: 15" do
                expect(array.max_slice_sum).to eql 15
            end
        end

        context "given an array with leading an trailing negative numbers: [-1,-2,3,4,5,-6,-7]" do
            array = [-1,-2,3,4,5,-6,-7]
            it "returns its middle subarray sum: 12" do
                expect(array.max_slice_sum).to eql 12
            end
        end

        context "given an array with positive and negative numbers intermixed: [1,-3,-4,5,6,-7]" do
            array = [1,-3,-4,5,6,-7]
            it "returns its largest subarray sum: 11" do
                expect(array.max_slice_sum).to eql 11
            end
        end

        context "given an array: [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]" do
            array = [1,-3,-4,5,2,-7,7,2,8,-1,2,-9,-2,-5]
            it "returns its largest subarray sum: 18" do
                expect(array.max_slice_sum).to eql 18
            end
        end

        context "given an array with only negative numbers: [-4,-3,-2,-5,-6,-7]" do
            array = [-4,-3,-2,-5,-6,-7]
            it "returns its greatest element: -2" do
                expect(array.max_slice_sum).to eql -2
            end
        end
    end
end
