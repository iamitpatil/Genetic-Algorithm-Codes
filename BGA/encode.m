function [gene] = encode(DecPop,minDim,maxDim,bitLength)



[DecPop_row,DecPop_col] = size(DecPop);

if length(bitLength) == 1
    bitLength(1:DecPop_col) = bitLength;
end

if length(bitLength) ~= DecPop_col
    display('Error: Elements in bitlength should be equal to the number of variables');
end

if ~isempty(DecPop),
    
   %Normalization between 0 and 1
   norm_x = (DecPop-repmat(minDim,DecPop_row,1))./(repmat(maxDim - minDim,DecPop_row,1));
   
   %Goes from [0,1] space to [0, 2^l-1] space
   temp = norm_x.* repmat(2.^bitLength - 1,DecPop_row,1);
   
   %Rounding everything to integers
   b10 = round(temp);
   
   for i=1:DecPop_row
       for j=1:DecPop_col
           gene{i,j} = dec2bin(b10(i,j),bitLength(j));
       end
   end
   
end
