function xbin = decode_for_postprocess(string, nbin, nbits, min_binvar, max_binvar)

xbin = zeros(1,nbin);
stop = 0;
for j=1:nbin
    start = stop+1; stop = start + nbits(j) - 1;
    total = sum(string(start:stop) .* 2.^(nbits(j)-1 : -1: 0));
    xbin(j) = min_binvar(j) + (max_binvar(j)-min_binvar(j)) / (2^nbits(j)-1) * total;
end