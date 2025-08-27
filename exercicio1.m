function tr = exercicio1(func, x0)
  % Secante modificada para raiz de func(t)
  % Entrada: handle, x0 (chute inicial)
  % Saída:   escalar
  % Critérios: máx. 20 iterações; erro relativo < 1%

  imax = 20;
  es   = 0.01;                  % 1%
  t = x0;

  for k = 1:imax
    f  = func(t);
    d  = 1e-6 * max(1, abs(t)); % passo pequeno para secante modificada
    fd = func(t + d);

    denom = fd - f;
    if denom == 0 || ~isfinite(denom)
      tr = NaN;                 % não foi possível atualizar
      return
    end

    t_new = t - f * (d / denom);

    if k > 1
      ea = abs((t_new - t) / max(1, abs(t_new)));
      if ea < es
        tr = t_new;
        return
      end
    end

    t = t_new;
  end

  tr = t;                       % último valor se não atingiu tol antes
end
