class AvengersHeadQuarter
    attr_accessor :list

    def initialize
        self.list = []
    end


    def put(avenger)
        self.list.push(avenger)
    end
end



# TDD - Test Driven Development
describe AvengersHeadQuarter do
    it 'should add an avenger' do
        hq = AvengersHeadQuarter.new

        hq.put('Spider-man')
        expect(hq.list[0]).to eql 'Spider-man'
    end



    it 'should adda n avengers list' do
        hq = AvengersHeadQuarter.new

        hq.put('Thor')
        hq.put('Iron Man')
        hq.put('Hulk')

        res = hq.list.size > 0
        expect(res).to be true
    end
end
