function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

t= zeros(imax,1);
t(1)= x0;
erro=zeros(length(t),1)

for j =1:length(t)-1
  if j ~=1
    erro(j)=abs((t(j)-t(j-1))/t(j))
    if erro(j)<es
      break
    endif
  endif
  t(j+1)=t(j)- func(t(j))/func_d(t(j));
endfor
t=t(j)

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
