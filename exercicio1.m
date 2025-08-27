function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%


t = zeros(20, 1);

t(1) = 0.1;

erro = zeros(length(t), 1);

for ii = 1:length(t)-1
  if ii ~= 1
    erro(ii) = abs(t(ii) - t(ii-1))/t(ii);
    if erro(ii) < 0.01
      break
    endif
  endif
  t(ii+1) = t(ii) - func(t(ii))/func_d(t(ii));
endfor
  last_index = find(t, 1, 'last');
  resultado = t(last_index)

  erro = erro(ii)

  resultado_interacoes = ii

t = 1

endfunction


