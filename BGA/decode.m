function [xDecimal] = decode(gene,minDim,maxDim)



[gene_row, gene_col] = size(gene);

for i=1:gene_row
    for j=1:gene_col
        xDecimal(i,j) = decodeSingle(gene{i,j}, minDim(j), maxDim(j));
    end
end


function [singleDecimal] = decodeSingle(xBinary, minDim, maxDim)

dec_gene = bin2dec(xBinary);

for i = 1:length(xBinary)
    
    power(i) = 2.^(i-1);
    
end 

maxim = sum(power);

singleDecimal = minDim + (dec_gene/maxim)*(maxDim-minDim);
