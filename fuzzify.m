function fuzzyVector = fuzzify(crispVector, fNames, lsprd, rsprd)
for i = 1:length(crispVector)
    tempFuzzyVar = fuzzyVar();
    fLabel = [];
    j = 1;
    while (fNames(j) ~= ' ')
        fLabel = [num2str(fLabel) fNames(j)];
        if j+1 <= length(fNames)
            j = j + 1;
        else
            break;
        end
    end
    fNames = fNames(j+1:length(fNames));
    tempFuzzyVar = set(tempFuzzyVar,'name',fLabel,'type','p',...
        'parameters',[crispVector(i) lsprd rsprd]);
    fuzzyVector(i) = tempFuzzyVar;
end