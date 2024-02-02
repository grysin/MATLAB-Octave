function y = exam1_forward_substitution (L,b)

% determine size of L
[n,n]=size(L);
[n,m]=size(b);
y=zeros(n,m);

for i=1:n 
  for j=1:m
    sum=0;
    for k=1:i-1
      sum=sum+L(i,k)*y(k,j); 
    endfor
    y(i,j)=(b(i,j)-sum)/L(i,i);
  endfor
endfor


endfunction
