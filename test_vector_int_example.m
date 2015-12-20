a = int32(1:5);
b = -0.5*double(a);

% result should be 5 0s
sum= vector_int_example(a,b);
sum = -2*sum;
sum= vector_int_example(a,sum);
if (any(sum)),
  error 'problem with eigen sum'
else
  disp('success');
end

% Make 2nd argument be the wrong data type
sb = single(b);

% Check if we can catch the error
try 
  sum = vector_int_example(a,sb);
catch ME
  switch ME.identifier
    case 'mex_function:validate_and_populate_arg'
      disp([' caught expected type validation error in input argument for vector_example(a,b)']);
      disp([' ',ME.message]);
    otherwise
      error('Unknown error');
  end
end
