text = open("day02-cubeconundrum.txt")
lines = readlines(text)

reRed = r"(\d+)\s+(red)"
reGreen = r"(\d+)\s+(green)"
reBlue = r"(\d+)\s+(blue)"

redLimit = 12
greenLimit = 13
blueLimit = 14

impossibleGameVect = []
possibleGameVect = []

for targetString in lines
    targetGame = split(chop(targetString, head = 10, tail = 0), "; ")
    targetGameVect = [String(i::SubString) for i in targetGame]

    gameState = true
    for targetGameStr in targetGameVect
        redMatch = eachmatch(reRed, targetGameStr)
        redMatchStringVect = [String(chop(i.match, tail = 4)::SubString) for i in redMatch]
        redMatchIntVect = parse.(Int64, redMatchStringVect)
    
        greenMatch = eachmatch(reGreen, targetGameStr)
        greenMatchStringVect = [String(chop(i.match, tail = 6)::SubString) for i in greenMatch]
        greenMatchIntVect = parse.(Int64, greenMatchStringVect)
    
        blueMatch = eachmatch(reBlue, targetGameStr)
        blueMatchStringVect = [String(chop(i.match, tail = 5)::SubString) for i in blueMatch]
        blueMatchIntVect = parse.(Int64, blueMatchStringVect)
    
        redState = (sum(redMatchIntVect) <= redLimit)
        greenState = (sum(greenMatchIntVect) <= greenLimit)
        blueState = (sum(blueMatchIntVect) <= blueLimit)
        if (redState & greenState & blueState) == false
            gameState = false
            break
        end
    end
    if gameState == true
        push!(possibleGameVect, 1)
    else
        push!(possibleGameVect, 0)
    end
end

display(possibleGameVect)
sumResult = 0
for i in 1:100
    global sumResult
    if possibleGameVect[i] == 1
        sumResult += i
    end
end
display(sumResult)