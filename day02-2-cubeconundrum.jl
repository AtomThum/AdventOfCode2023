text = open("day02-cubeconundrum.txt")
lines = readlines(text)

reRed = r"(\d+)\s+(red)"
reGreen = r"(\d+)\s+(green)"
reBlue = r"(\d+)\s+(blue)"

redLimit = 12
greenLimit = 13
blueLimit = 14

resultVect = []

for targetString in lines
    targetGame = split(chop(targetString, head = 10, tail = 0), "; ")
    targetGameVect = [String(i::SubString) for i in targetGame]

    gameState = true
    redSum = []
    greenSum = []
    blueSum = []
    for targetGameStr in targetGameVect
        redMatch = eachmatch(reRed, targetGameStr)
        redMatchStringVect = [String(chop(i.match, tail = 4)::SubString) for i in redMatch]
        redMatchIntVect = parse.(Int64, redMatchStringVect)
        push!(redSum, sum(redMatchIntVect))

        greenMatch = eachmatch(reGreen, targetGameStr)
        greenMatchStringVect = [String(chop(i.match, tail = 6)::SubString) for i in greenMatch]
        greenMatchIntVect = parse.(Int64, greenMatchStringVect)
        push!(greenSum, sum(greenMatchIntVect))
    
        blueMatch = eachmatch(reBlue, targetGameStr)
        blueMatchStringVect = [String(chop(i.match, tail = 5)::SubString) for i in blueMatch]
        blueMatchIntVect = parse.(Int64, blueMatchStringVect)
        push!(blueSum, sum(blueMatchIntVect))
    end
    push!(resultVect, maximum(redSum)*maximum(greenSum)*maximum(blueSum))
end

sum(resultVect)