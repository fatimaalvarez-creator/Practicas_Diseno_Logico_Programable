// log function
function integer ceillog2;
	input integer data;
	integer i, result;
	begin
		for(i = 0; 2**1 < data; i = i + 1)
			result = i + 1;
		ceillog2 = result;
		end
		
endfunction