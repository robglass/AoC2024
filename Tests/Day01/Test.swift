import Testing
@testable import AoC2024

struct Test {

    @Test func readInputOpensFile() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let result = try readInput(from: "input.txt")
        #expect(result.isEmpty == false)
    }
    
    @Test func readInputReturnsNil() throws {
        #expect(throws: DayO1Error.malformedInput, performing: {
            let _ = try readInput(from: "DoesntExist.txt")
        })
    }
    
    
    @Test func parseCSV_withValidInput() throws {
        let input = """
        69214 60950
        83241 38269
        22475 84756
        """
        
        let (column1, column2) = parseCSV(input: input)
        
        #expect(column1 == [69214, 83241, 22475])
        #expect(column2 == [60950, 38269, 84756])
    }

    @Test func parseCSV_withEmptyInput() throws {
        let input = ""
        
        let (column1, column2) = parseCSV(input: input)
        
        #expect(column1.isEmpty)
        #expect(column2.isEmpty)
    }
    
    @Test func parseCSV_withInvalidInput() throws {
        let input = "69214 60950\n83244\n22475 abc"
        
        let (column1, column2) = parseCSV(input: input)
        
        #expect(column1 == [69214])
        #expect(column2 == [60950])
    }
    
    @Test func caclculateDistance_withValidInput() throws {
        let result = try calulateDistance(column1: [3,4,2,1,3,3], column2: [4,3,5,3,9,3])
        
        #expect(result == 11)
    }
    
    @Test func caclulateDistance_withInvalidInput() throws {
        #expect(throws: DayO1Error.mismatchedColumnCount, performing: {
            let _ = try calulateDistance(column1: [3,4,2,3,1,3,3], column2: [4,3,5,3,9,3])
        })
   
    }
    
    @Test func solveDistance_withValidInput() throws {
        let result = try solveDistance()
        #expect(result == 1879048)
    
    }
    
    @Test func caclculateSimilarity_withValidInput() throws {
        let result = try calculateSimilarity(column1: [3,4,2,1,3,3], column2: [4,3,5,3,9,3])
        
        #expect(result == 31)
    }
    
    @Test func solveSimilarity_withValidInput() throws {
        let result = try solveSimilarity()
        #expect(result == 21024792)
    
    }
    
    @Test func caclulateSimilarity_withInvalidInput() throws {
        #expect(throws: DayO1Error.mismatchedColumnCount, performing: {
            let _ = try calculateSimilarity(column1: [3,4,2,3,1,3,3], column2: [4,3,5,3,9,3])
        })
   
    }
}
