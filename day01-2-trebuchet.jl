text = open("day01-trebuchet.txt")
lines = readlines(text)

strToIntDict = Dict{String, Integer}(
    "one" => 1, "two" => 2, "three" => 3,
    "four" => 4, "five" => 5, "six" => 6,
    "seven" => 7, "eight" => 8, "nine" => 9,
    "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
    "6" => 6, "7" => 7, "8" => 8, "9" => 9
)
reFirst = r"[1-9]|(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine)"
reLast = r"(eno)|(owt)|(eerht)|(rouf)|(evif)|(xis)|(neves)|(thgie)|(enin)|[1-9]"
finalResult = 0

for targetString in lines
    global finalResult, reFirst, reLast
    local matchedStringVect, firstMatch, lastMatch
    firstMatch = match(reFirst, targetString)
    lastMatch = match(reLast, targetString)
    
    firstInt = strToIntDict[String(firstMatch.match::SubString)]
    lastInt = strToIntDict[reverse(String(lastMatch.match::SubString))]

    finalResult += 10*firstInt + lastInt
end

display(finalResult)