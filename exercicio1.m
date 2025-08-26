function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;

% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% digite seu codigo aqui

function tr = exercicio1(func, x0)
  % Encontra a raiz de func(t) a partir do chute x0 usando Newton-Raphson.
  % Retorna um escalar tr. Para o autograder:
  % - máx. 20 iterações
  % - critério de parada: erro relativo < 0.01 (1%)

  maxit = 20;
  tol   = 0.01;

  t = x0;
  for k = 1:maxit
    f  = func(t);

    % derivada numérica central
    h  = 1e-6 * max(1, abs(t));
    df = (func(t + h) - func(t - h)) / (2*h);

    if ~isfinite(df) || df == 0
      tr = NaN;
      return
    end

    t_new = t - f/df;

    if k > 1
      err = abs((t_new - t) / max(1, abs(t_new)));
      if err < tol
        tr = t_new;
        return
      end
    end

    t = t_new;
  end

  tr = t;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction



