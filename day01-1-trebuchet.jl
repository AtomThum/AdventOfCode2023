text = open("day01-trebuchet.txt")
lines = readlines(text)

re = r"[1-9]"
finalResult = 0

for targetString in lines
    local filteredString
    local matchedIntVect
    local matchedStringVect
    global finalResult
    filteredString = eachmatch(re, targetString)
    matchedStringVect = [i.match for i in filteredString]
    matchedIntVect = parse.(Int, matchedStringVect)
    finalResult += 10*first(matchedIntVect) + last(matchedIntVect)
end

display(finalResult)