function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;

% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% digite seu codigo aqui
h= 3;
l= 2;
g=9.81;
v_alvo=[1,5,12.5];

# matrizes pra abrigar 20 iterações x 3 velocidades
tempo = zeros(20,3);
erro = zeros(20,3);

# derivada e velocidade maxima
velocidade_max = sqrt(2*g*h);
velocidade_d = @(t) (g*h/l) * (1./cosh((sqrt(2*g*h)/(2*l))*t)).^2;

for k = 1:3
  #se a velocidade alvo for maior do que a maxima, o calculo é impossivel, entao a coluna toda vira de NaN
  if v_alvo(k) > velocidade_max
  tempo(:,k) = NaN;
  erro(:,k)  = NaN;
  continue;
  endif
 # reinicializa t e erro para cada alvo
  t = zeros(20,1);
  t(1) = 0.5;

  # função velocidade para este alvo
  velocidade = @(x) (sqrt(2*g*h)*tanh((sqrt(2*g*h)/(2*l))*x)) - v_alvo(k);

  #erro pra cada alvo
  for j = 1:length(t)-1
    if j ~= 1
      erro(j,k) = abs((t(j)-t(j-1))/t(j));
      if erro(j,k) < 0.01
        break
      endif
    endif

  #tempo pra cada alvo
    t(j+1) = t(j) - velocidade(t(j))/velocidade_d(t(j));
    tempo(j,k) = t(j+1)
  endfor
endfor
t = 0; % alterar

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction



